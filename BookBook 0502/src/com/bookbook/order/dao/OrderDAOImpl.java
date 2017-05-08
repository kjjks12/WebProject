package com.bookbook.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.ResolutionSyntax;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.order.domain.OrderDTO;
import com.bookbook.orderdetail.dao.OrderDetailDAO;
import com.bookbook.orderdetail.dao.OrderDetailDAOImpl;
import com.bookbook.orderdetail.domain.OrderDetailDTO;
import com.bookbook.payment.domain.PaymentDTO;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.db.DBUtil;

public class OrderDAOImpl implements OrderDAO {

	/**
	 * 사용자별 주문 전체 수 얻어오기
	 */
	@Override
	public int selectOrderCount(String customerCode) throws SQLException {
		int result=0;
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		String sql="select count(*) from bookOrder where order_customer_code=?";
		try{
			con=DBUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, customerCode);
			rs=ps.executeQuery();
			
			if(rs.next()){
				result=rs.getInt(1);
			}
			
		}finally{
			DBUtil.dbClose(con, ps, rs);
		}
		
		return result;
	}
	
	
	@Override
	public List<OrderDTO> selectCurrentOrder(String customerCode, String orderStateCode) throws SQLException {
		
		
		return null;
	}
	
	@Override
	public List<OrderDTO> selectOrderAll(String customerCode, int pageNum) throws SQLException {
		int pageSize=3;
		int pageStartNum=(pageSize*(pageNum-1))+1;
		int pageEndNum=(pageSize*pageNum);
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<OrderDTO> orderDTOList=new ArrayList<>();
		String sql="select order_code, order_title, order_date, order_price, order_qty, order_state from "+
					"(select rownum rnum, order_code, order_title, order_date, order_price, order_qty, order_state "+
					"from (select order_code, order_title, order_date, order_price, order_qty, order_state from bookOrder where ORDER_CUSTOMER_CODE=? order by order_code desc)) "+
					"where rnum between ? and ?";


		try{
			con=DBUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, customerCode);
			ps.setInt(2, pageStartNum);
			ps.setInt(3, pageEndNum);
			rs=ps.executeQuery();

			while(rs.next()){
				OrderDTO orderDTO=new OrderDTO(null, null, null, rs.getString("order_code"), rs.getString("order_title"), null, null, rs.getString("order_date"), null, rs.getString("order_state"), rs.getInt("order_price"), rs.getInt("order_qty"));
				orderDTOList.add(orderDTO);
			}
			
		}finally{
			DBUtil.dbClose(con, ps, rs);
			
		}
		return orderDTOList;
	}

	@Override
	public OrderDTO insertOrder(OrderDTO orderDTO) throws SQLException {
		OrderDTO orderDTOResult=null;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String selectOrderCodeSql="select lpad(order_sequence.nextval, 12, '0') from dual";
		String insertOrderSql="insert into bookOrder values(?, ?, ?, sysdate, ?, ?, '0303', ?, ?, ?)";
		String insertOrderDetailSql="insert all ";
		String insertPaymentSql="insert into payment values(lpad(payment_sequence.nextval, 15, '0'), ?, ?, sysdate, ?)";
		String deleteCartSql="delete from cart where cart_customer_code=?";
		String orderCode=null;
		
		try{
			List<OrderDetailDTO> orderDetailDTOList=orderDTO.getOrderDetailDTOList();
			PaymentDTO paymentDTO=orderDTO.getPaymentDTO();
			
			//주문상세정보 SQL생성
			//insertOrderDetailSql;
			for(OrderDetailDTO orderDetailDTO : orderDetailDTOList){
				insertOrderDetailSql+="into orderDetail values(?, ?, ?, ?) ";
			}
			insertOrderDetailSql+=" select * from dual";
			
			
			con=DBUtil.getConnection();
			con.setAutoCommit(false);
			ps=con.prepareStatement(selectOrderCodeSql);
			rs=ps.executeQuery();
			
			//주문번호 하나를 얻어온다.
			if(rs.next()){
				orderCode=rs.getString(1);
			}else{
				con.rollback();
			}
			

			//얻어온 주문번호로 주문테이블에 저장
			ps=con.prepareStatement(insertOrderSql);
			ps.setString(1, orderCode);
			ps.setString(2, orderDTO.getCustomerDTO().getUserCode());
			ps.setString(3, orderDTO.getOrderTitle());
			ps.setString(4, orderDTO.getOrderAddr());
			ps.setString(5, orderDTO.getOrderTel());
			ps.setInt(6, orderDTO.getOrderPrice());
			ps.setInt(7, orderDTO.getOrderQty());			
			ps.setString(8, orderDTO.getOrderMessage());
			if(ps.executeUpdate()<=0){
				con.rollback();
			}
	
			//주문상세 정보 저장\
			ps=con.prepareStatement(insertOrderDetailSql);
			int cols=4;
			for(int i=0; i<orderDetailDTOList.size(); i++){
				ps.setString((i*cols)+1, orderCode);
				ps.setString((i*cols)+2, orderDetailDTOList.get(i).getBookDTO().getBookCode());
				ps.setInt((i*cols)+3, orderDetailDTOList.get(i).getOrderDetailQty());
				ps.setInt((i*cols)+4, orderDetailDTOList.get(i).getOrderDetailPrice());
			}

			if(ps.executeUpdate()<=0){
				con.rollback();
			}

			//결제정보 저장
			ps=con.prepareStatement(insertPaymentSql);
			ps.setInt(1, paymentDTO.getPaymentTotalPrice());
			ps.setString(2, paymentDTO.getPaymentType());
			ps.setString(3, orderCode);
			if(ps.executeUpdate()<=0){
				con.rollback();
			}
			
			//재고수량 조절
			String bookInventorySql="update book set book_inventory=case book_code ";
			String caseStr="";
			String bookCodeStr="";
			for(int i=0, size=orderDetailDTOList.size(); i<size; i++){
				caseStr+=" when ? then book_inventory-"+orderDetailDTOList.get(i).getOrderDetailQty();
				if(i<size-1){
					bookCodeStr+="?, ";
				}else{
					bookCodeStr+="?";
				}
			}
			bookInventorySql+=caseStr+" end where book_code in(" + bookCodeStr + ")";
			
			ps=con.prepareStatement(bookInventorySql);
			for(int i=0, size=orderDetailDTOList.size(); i<size; i++){
				String bookCodeParam=orderDetailDTOList.get(i).getBookDTO().getBookCode();
				ps.setString(i+1, bookCodeParam);
				ps.setString(size+i+1, bookCodeParam);
			}
			if(ps.executeUpdate()<=0){
				con.rollback();
			}

			//카트정보 삭제
			ps=con.prepareStatement(deleteCartSql);
			ps.setString(1, orderDTO.getOrderUserCode());
			int result=ps.executeUpdate();
			if(result<=0){
				con.rollback();
			}else{
				con.commit();
			}
			
			OrderDetailDAO orderDetailDAO=new OrderDetailDAOImpl();
			orderDTOResult=orderDetailDAO.selectOrderDetail(orderCode);

		}finally{
			DBUtil.dbClose(con, ps, null);
		}
		
		return orderDTOResult;
	}

	@Override
	public int updateOrder(OrderDTO orderDTO) throws SQLException {
		int result=0;
		Connection con=null;
		PreparedStatement ps=null;
		String sql="update bookOrder set order_addr=?, order_tel=? where order_code=?";
		
		try{
			con=DBUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, orderDTO.getOrderAddr());
			ps.setString(2, orderDTO.getOrderTel());
			ps.setString(3, orderDTO.getOrderCode());
			result=ps.executeUpdate();		
		}finally{
			DBUtil.dbClose(con, ps, null);
		}
		
		return result;
	}

	@Override
	public int deleteOrder(String orderCode) throws SQLException {
		int result=0;
		Connection con=null;
		PreparedStatement ps=null;
		String sql="delete from bookOrder where order_code=?";
		
		try{
			con=DBUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, orderCode);
			result=ps.executeUpdate();
		}finally{
			DBUtil.dbClose(con, ps, null);
		}
		return result;
	}



	@Override
	public int updateOrderState(String orderCode, String orderStateCode) throws SQLException {
		int result=0;
		Connection con=null;
		PreparedStatement ps=null;
		String sql="update bookOrder set order_state=? where order_code=?";
		
		try{
			con=DBUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, orderStateCode);
			ps.setString(2, orderCode);
			result=ps.executeUpdate();		
		}finally{
			DBUtil.dbClose(con, ps, null);
		}
		
		return result;
	}


	@Override
	public List<OrderDetailDTO> selectAvailableOrder(List<OrderDetailDTO> orderDetailDTOList) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<OrderDetailDTO> orderDetailDTOListResult=new ArrayList<>();
		StringBuffer sql=new StringBuffer();
		
		try{
			//sql 생성
			
			//주문 할  더미 테이블 과  in에 들어갈 문자열 생성
			StringBuffer orderQty=new StringBuffer();
			StringBuffer inBookCode=new StringBuffer();
			StringBuffer inQty=new StringBuffer();
			for(int i=0, size=orderDetailDTOList.size(); i<size; i++){
				String bookCode=orderDetailDTOList.get(i).getBookDTO().getBookCode();
				int qty=orderDetailDTOList.get(i).getOrderDetailQty();
				
				if(i>0){
					orderQty.append(" union all ");
				}
				orderQty.append("select '").append(bookCode).append("' book_code, '");
				orderQty.append(qty+"").append("' order_qty from dual");
				
				
				if(i!=size-1){
					inBookCode.append("'").append(bookCode).append("', ");
					inQty.append("'").append(qty).append("', ");
				}else{
					inBookCode.append("'").append(bookCode).append("'");
					inQty.append("'").append(qty).append("'");
				}
			}
			
			sql.append("select a.book_code , a.book_title, a.book_price from (select book_code, book_inventory, book_title, book_price from book where book_code in(");
			sql.append(inBookCode).append(") and book_used='Y') a, ");
			sql.append("(").append(orderQty).append(") b where a.book_code=b.book_code and a.book_inventory>=b.order_qty");

			
			//Db연결 및 데이터셋 가져오기
			con=DBUtil.getConnection();
			ps=con.prepareStatement(sql.toString());
			rs=ps.executeQuery();
			
			//데이터셋에서 List<OrderDetailDTO> 생성
			while(rs.next()){
				BookDTO bookDTO=new BookDTO();
				bookDTO.setBookCode(rs.getString("book_code"));
				bookDTO.setBookTitle(rs.getString("book_title"));
				bookDTO.setBookPrice(rs.getInt("book_price"));
				orderDetailDTOListResult.add(new OrderDetailDTO(null, bookDTO, 0, 0));
			}
			
		}finally{
			DBUtil.dbClose(con, ps, rs);
		}
		
		return orderDetailDTOListResult;
	}

	@Override
	public UserDTO selectUserOrderInfo(String customerCode)throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		UserDTO result=null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con =DBUtil.getConnection();
			sql = "select customer_tel, customer_addr, customer_email, customer_name, customer_zipcode from customer where customer_code=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, customerCode);
			rs=ps.executeQuery();
			
			if(rs.next()){
				result=new UserDTO(customerCode, rs.getString("customer_name"), null, rs.getString("customer_tel"), rs.getString("customer_addr"), null, null, rs.getString("customer_email"), null, null, null, rs.getString("customer_zipcode"), null, null);
			}

		}finally{
			DBUtil.dbClose(con, ps, rs);
		}
		return result;
	}


	@Override
	public BookDTO selectBookByBookCode(String bookCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		BookDTO result=null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con =DBUtil.getConnection();
			sql = "select * from book where book_code=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, bookCode);
			rs=ps.executeQuery();
			
			if(rs.next()){
				result=new BookDTO(rs.getString("book_code"), rs.getString("book_title"), rs.getInt("book_price"));
			}

		}finally{
			DBUtil.dbClose(con, ps, rs);
		}
		return result;
	}


}

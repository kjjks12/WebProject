package com.bookbook.orderdetail.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.order.domain.OrderDTO;
import com.bookbook.orderdetail.domain.OrderDetailDTO;
import com.bookbook.payment.domain.PaymentDTO;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.db.DBUtil;

public class OrderDetailDAOImpl implements OrderDetailDAO {

	@Override
	public  OrderDTO selectOrderDetail(String orderCode) throws SQLException {
		OrderDTO orderDTO=null;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=null;
		try{
			sql="select order_code, order_state, order_title, order_tel, order_customer_code, order_addr, order_date, order_qty, order_price, "
					+ "orderdetail_book_code, orderdetail_qty, orderdetail_price, payment_code, payment_date, payment_total_price, "
					+ "payment_type, book_title, book_price, book_cover, customer_name from( "
					+ "select * from( "
					+ "select * from ( "
					+ "select * from "
					+ "(select order_code, order_state, order_customer_code, order_title, order_tel, order_addr, order_date, order_qty, order_price from bookOrder where order_code=?) od, "
					+ "(select orderdetail_order_code, orderdetail_book_code, orderdetail_qty, orderdetail_price from orderDetail where orderdetail_order_code=?) oddt "
					+ "      where od.order_code=oddt.orderdetail_order_code "
					+ "    ) od_result, payment "
					+ "    where od_result.order_code=payment.payment_order_code "
					+ "  ) pay_od, book "
					+ "  where pay_od.orderdetail_book_code=book.book_code "
					+ ") pay_od_book, customer "
					+ "where pay_od_book.order_customer_code=customer.customer_code";
			con=DBUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, orderCode);
			ps.setString(2, orderCode);
			rs=ps.executeQuery();
			
			List<OrderDetailDTO> orderDetailDTOList=new ArrayList<>();
			UserDTO userDTO=null;
			PaymentDTO paymentDTO=null;
			while(rs.next()){
				if(rs.getRow()==1){
					userDTO=new UserDTO(null,  null, null, null, null, null, null, rs.getString("customer_name"), null, null, null );
					paymentDTO=new PaymentDTO(rs.getString("payment_code"), rs.getString("order_code"), rs.getInt("payment_total_price"), rs.getString("payment_type"), rs.getString("payment_date"));
					orderDTO=new OrderDTO(orderDetailDTOList, paymentDTO, userDTO, rs.getString("order_code"), rs.getString("order_title"), rs.getString("order_addr"), rs.getString("order_customer_code"),rs.getString("order_date"), rs.getString("order_tel"), rs.getString("order_state"), rs.getInt("order_price"), rs.getInt("order_qty"));
				}
				BookDTO bookDTO=new BookDTO(rs.getString("orderdetail_book_code"), rs.getString("book_title"), null, null, null, 0, rs.getShort("book_price"), rs.getString("book_cover"), null, null, 0, null);
				OrderDetailDTO orderDetailDTO=new OrderDetailDTO(rs.getString("order_code"), bookDTO, rs.getInt("orderdetail_qty"), rs.getInt("orderdetail_price"));
				orderDetailDTOList.add(orderDetailDTO);
			}

		}finally{
			DBUtil.dbClose(con, ps, rs);
		}
		
		return orderDTO;
	}
}

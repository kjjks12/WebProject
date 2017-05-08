package com.bookbook.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookbook.order.domain.OrderDTO;
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
	public int insertOrder(OrderDTO orderDTO) throws SQLException {
		int result=0;
		Connection con=null;
		PreparedStatement ps=null;
		String sql="insert into bookOrder values(?, ?, ?, ?, ?, ?)";
		
		try{
			con=DBUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, orderDTO.getOrderCode());
			ps.setString(2, orderDTO.getOrderUserCode());
			ps.setString(3, orderDTO.getOrderDate());
			ps.setString(4, orderDTO.getOrderAddr());
			ps.setString(5, orderDTO.getOrderTel());
			ps.setString(6, orderDTO.getOrderState());
			result=ps.executeUpdate();		
		}finally{
			DBUtil.dbClose(con, ps, null);
		}
		
		return result;
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




}

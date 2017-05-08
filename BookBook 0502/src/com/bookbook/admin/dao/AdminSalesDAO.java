package com.bookbook.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bookbook.admin.dto.SaleDTO;
import com.bookbook.bookdetail.domain.BookDetailDTO;
import com.bookbook.util.db.DBUtil;

public class AdminSalesDAO {

	/**
	 * @author 정광수
	 * @return SaleDTO
	 * @throws SQLException
	 * @brief 월별 데이터 가지고 나감
	 */
	public SaleDTO getMonthSaleData() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			StringBuffer sqlQuery = new StringBuffer();
			sqlQuery.append("select extract(month from payment_date) as month,count(payment_code) as ordercount,sum(PAYMENT_TOTAL_PRICE)as sum_price from payment ");
			sqlQuery.append("group by (extract(month from payment_date)) ");	
			sqlQuery.append("order by (extract(month from payment_date)) asc ");	
		
		
		
			conn = DBUtil.getConnection();
			pstmt=conn.prepareStatement(sqlQuery.toString());
			
			
			
			pstmt.executeUpdate();
			conn.commit();

			//System.out.println("마지막까지 왔어");
		} finally {
			DBUtil.dbClose(conn, pstmt, rs);
		}
		return null;
	}
	
	
}

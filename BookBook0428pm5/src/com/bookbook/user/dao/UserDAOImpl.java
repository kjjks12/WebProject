package com.bookbook.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.db.DBUtil;

public class UserDAOImpl implements UserDAO {

	@Override
	public int idCheck(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result = 1;
		// 아이디가 중복이 아니라 사용가능
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement("select customer_code from customer where customer_code=?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = 0;
			}
			// System.out.println("result: " + result);
			// 중복된 아이디라서 사용할 수 없다.

		} finally {
			DBUtil.dbClose(con, ps, rs);
		}
		return result;
	}

	@Override
	public int insert(UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into customer values(?,?,?,?,?,?,?,?,'1','1','1')";

		System.out.println(userDTO);
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userDTO.getUserCode());
			ps.setString(2, userDTO.getUserPassword());
			ps.setString(3, userDTO.getUserTel());
			ps.setString(4, userDTO.getUserAddr());
			ps.setString(5, userDTO.getUserGender());
			ps.setString(6, userDTO.getUserBirth());
			ps.setString(7, userDTO.getUserEmail());
			ps.setString(8, userDTO.getUserName());

			result = ps.executeUpdate();

		} finally {
			DBUtil.dbClose(con, ps, null);
		}

		return result;
	}

	/**
	 * @author 정광수
	 * @return USER 에 대한 정보 List 형태로 보냄
	 * @throws SQLException
	 * @brief 책과, 책 세부항목 두번의 insert 필요 일괄 처리로 함!
	 */
	@Override
	public List<UserDTO> selectAll() throws SQLException{
		//System.out.println("UserDAO 들어옴");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		StringBuffer sqlQuery = new StringBuffer();
		List <UserDTO> userList=null;
		try {
			conn = DBUtil.getConnection();
			sqlQuery.append(" select * from customer ");
			pstmt = conn.prepareStatement(sqlQuery.toString());
			rs=pstmt.executeQuery();
		
			userList= new ArrayList<>();
			while(rs.next()){
				UserDTO userDTO= new UserDTO(
						rs.getString("CUSTOMER_CODE"),
						rs.getString("CUSTOMER_NAME"),
						rs.getString("CUSTOMER_TEL"),
						rs.getString("CUSTOMER_ADDR"),
						rs.getString("CUSTOMER_GENDER"),
						rs.getString("CUSTOMER_BIRTH"),
						rs.getString("CUSTOMER_EMAIL")
						);
						
						userList.add(userDTO);
			}
			
		} finally {
			DBUtil.dbClose(conn, pstmt,rs);
		}
		return userList;
	}

	/**
	 * @author 정광수
	 * @param String
	 *            으로 회원 id값 받아서 삭제
	 * @return 삭제 성공 실패 여부 반환
	 * @throws SQLException
	 * @brief 책과, 책 세부항목 두번의 insert 필요 일괄 처리로 함!
	 */

	@Override
	public int delete(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		StringBuffer sqlQuery = new StringBuffer();
		sqlQuery.append("delete from CUSTOMER where CUSTOMER_CODE=?");
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sqlQuery.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

		} finally {
			DBUtil.dbClose(conn, pstmt, null);
		}

		return result;
	}

	@Override
	public int update(UserDTO userDTO) {
		return 0;
	}

	@Override
	public int login(UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result =0;
		String sql = "";
		ResultSet rs = null;
		try {
			con =DBUtil.getConnection();
			sql = "SELECT customer_code from customer where customer_code = ? and customer_password = ?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1,userDTO.getUserCode());
			ps.setString(2,userDTO.getUserPassword());
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}		
	
}
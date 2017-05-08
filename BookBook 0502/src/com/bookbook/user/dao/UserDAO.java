package com.bookbook.user.dao;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.user.domain.UserDTO;

public interface UserDAO {

	/**
	 * ���̵� �ߺ�üũ idCheck
	 * @throws SQLException 
	 */
	int idCheck(String id) throws SQLException;
	
	/**
	 * ȸ�������ϱ� insert
	 */
	int insert(UserDTO userDTO)throws SQLException;	

	/**
	 * ȸ�� �˻� selectAll --������
	 */
	List<UserDTO> selectAll()throws SQLException;

	/**
	 * ȸ�� �����ϱ� delete
	 */
	int delete(String id)throws SQLException;

	/**
	 * ȸ�� �������� update
	 */
	int update(UserDTO userDTO)throws SQLException;

	int login(UserDTO userDTO) throws SQLException;



}

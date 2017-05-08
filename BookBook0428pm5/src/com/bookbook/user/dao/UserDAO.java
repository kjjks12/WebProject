package com.bookbook.user.dao;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.user.domain.UserDTO;

public interface UserDAO {

	/**
	 * 아이디 중복체크 idCheck
	 * @throws SQLException 
	 */
	int idCheck(String id) throws SQLException;
	
	/**
	 * 회원가입하기 insert
	 */
	int insert(UserDTO userDTO)throws SQLException;	

	/**
	 * 회원 검색 selectAll --관리자
	 */
	List<UserDTO> selectAll()throws SQLException;

	/**
	 * 회원 삭제하기 delete
	 */
	int delete(String id)throws SQLException;

	/**
	 * 회원 정보수정 update
	 */
	int update(UserDTO userDTO)throws SQLException;

	int login(UserDTO userDTO) throws SQLException;



}

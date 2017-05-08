package com.bookbook.user.service;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.user.dao.UserDAO;
import com.bookbook.user.dao.UserDAOImpl;
import com.bookbook.user.domain.UserDTO;

public class UserService implements UserDAO {
	private static UserDAOImpl userDao = new UserDAOImpl();

	@Override
	public int idCheck(String id) throws SQLException {
		int result = userDao.idCheck(id);
		return result;
	}

	@Override
	public int insert(UserDTO userDTO) throws SQLException {
		int result = userDao.insert(userDTO);
		if (result == 0) {
			throw new SQLException("가입을 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserDTO> selectAll() throws SQLException {
		return userDao.selectAll();
	}

	@Override
	public int delete(String id) throws SQLException {
		return userDao.delete(id);
	}

	@Override
	public int update(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int login(UserDTO userDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}

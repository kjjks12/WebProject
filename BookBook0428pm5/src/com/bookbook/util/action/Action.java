package com.bookbook.util.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	/**
	 * ����� ��û�� ó���� �޼ҵ� �ۼ�
	 * @throws IOException 
	 * @throws ServletException 
	 */
	void execute(HttpServletRequest request, HttpServletResponse response);
}
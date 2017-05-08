package com.bookbook.util.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	/**
	 * 사용자 요청을 처리할 메소드 작성
	 * @throws IOException 
	 * @throws ServletException 
	 */
	void execute(HttpServletRequest request, HttpServletResponse response);
}
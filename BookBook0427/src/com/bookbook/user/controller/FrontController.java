package com.bookbook.user.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.util.action.Action;

@WebServlet("/user")
public class FrontController extends HttpServlet {
	Map<String, Action> map;
	
	@Override
	public void init() throws ServletException {
		System.out.println("init메소드 호출됨");
		map=(Map<String, Action>)getServletContext().getAttribute("actionMap");
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key=request.getParameter("command");
		System.out.println(key);
		map.get(key).execute(request, response);
	}

}

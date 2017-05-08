package com.bookbook.book.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.util.action.Action;

@WebServlet("/book")
public class FrontController extends HttpServlet {
	private Map<String, Action> map;

	@Override
	public void init() throws ServletException {
		map = (Map<String, Action>) getServletContext().getAttribute("actionMap");
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response){
		String key = request.getParameter("key");
		String[] keys = {};
		
		if(key==null){
			key="book_select";
		}else if(key.contains("?")){
			keys = key.split("\\?");
			key = keys[0];
		}
		try {
			map.get(key).execute(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

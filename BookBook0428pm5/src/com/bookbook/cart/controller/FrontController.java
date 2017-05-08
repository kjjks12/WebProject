package com.bookbook.cart.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.util.action.Action;

@WebServlet("/Cart")
public class FrontController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Map<String, Action> map=new HashMap<>(); 
	
	@Override
	public void init() throws ServletException {
		map = (Map<String, Action>) getServletContext().getAttribute("actionMap");
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key=request.getParameter("key");
		
		Action action=map.get(key);
		
		if(action==null){
			map.get("cartSelect").execute(request, response);
		}
		
		else {
			action.execute(request, response);
		}
	}
}

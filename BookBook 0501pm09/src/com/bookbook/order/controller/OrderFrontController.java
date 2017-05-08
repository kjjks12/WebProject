package com.bookbook.order.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.util.action.Action;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/Order")
public class OrderFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ServletContext application;
	private Map<String, Action> actionMap=new HashMap<>(); 
	
	@Override
	public void init() throws ServletException {
		application=getServletContext();
		actionMap=(Map<String, Action>)application.getAttribute("actionMap");
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key=request.getParameter("key");
		
		Action action=actionMap.get(key);
		
		if(action==null){
			actionMap.get("orderList").execute(request, response);
		}
		else {
			action.execute(request, response);
		}
	}
}

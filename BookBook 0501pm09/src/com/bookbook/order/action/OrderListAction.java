package com.bookbook.order.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookbook.order.domain.OrderDTO;
import com.bookbook.order.service.OrderService;
import com.bookbook.order.service.OrderServiceImpl;
import com.bookbook.util.action.Action;

public class OrderListAction implements Action {
	int pageGroupSize=4;
	int pageSize=3;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		List<OrderDTO> orderDTOList=new ArrayList<>();
		HttpSession session=request.getSession();
		String customerCode=(String)session.getAttribute("loggedInUser");
		String pageNum=(String)request.getParameter("pageNum");

		OrderService orderService=new OrderServiceImpl();
		try {
			if(customerCode==null){
				throw new Exception("로그인이 필요합니다.");
			}

			if(pageNum==null || pageNum==""){
				pageNum="1";
			}
			

			orderDTOList=orderService.selectOrderAll(customerCode, Integer.parseInt(pageNum));
			int totalResult=orderService.selectOrderCount(customerCode);
			
			List<Integer> pageGroupList=new ArrayList<>();
			
			request.setAttribute("orderDTOList", orderDTOList);
			request.setAttribute("pageNum", pageNum);
			
			//현재 페이지 그룹을 구함
			int curPage=Integer.parseInt(pageNum);
			int curGroup=(int) Math.ceil((double)curPage/(pageGroupSize));
			int totalGroup= (int) Math.ceil((double)totalResult/(pageSize*pageGroupSize));
			int totalPage= (int) Math.ceil((double)totalResult/pageSize);
			
			//그룹에 표시될 페이지 범위 구함
			int startPage=(curGroup-1)*pageGroupSize+1;
			int endPage=startPage+(pageGroupSize-1);
			if(curGroup==totalGroup){
				endPage=totalPage;
			}else{
				//존재하지 않는 페이지
				System.out.println("unknow page");
			}

			for(int i=startPage; i<=endPage; i++){
				pageGroupList.add(i);
			}
			request.setAttribute("pageGroupList", pageGroupList);
			request.setAttribute("totalPage", totalPage);

			request.getRequestDispatcher("customer/order/orderList.jsp").forward(request, response);
			
		} catch (Exception e) {
			try {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
	}

}

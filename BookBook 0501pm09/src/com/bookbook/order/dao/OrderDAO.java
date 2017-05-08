package com.bookbook.order.dao;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.order.domain.OrderDTO;
import com.bookbook.orderdetail.domain.OrderDetailDTO;
import com.bookbook.user.domain.UserDTO;

public interface OrderDAO {
	/**
	 * 사용자별 주문 전체 수 얻어오기
	 */
	int selectOrderCount(String customerCode) throws SQLException;
	/**
	 * 사용자별 주문 목록 전체 불러오기, page에 따라 페이지 단위로 출력
	 */
	List<OrderDTO> selectOrderAll(String customerCode, int pageNum) throws SQLException;
	
	/**
	 * 주문상태에 따라 사용자별 주문 목록 불러오기
	 */
	List<OrderDTO> selectCurrentOrder(String customeCode, String orderStateCode) throws SQLException;	
	
	/**
	 * 주문가능한 도서인지 확인
	 */
	List<OrderDetailDTO> selectAvailableOrder(List<OrderDetailDTO> orderDetailDTOList) throws SQLException ;
	
	/**
	 * 주문 추가  1이면 주문성공, 0이면 주문실패
 	 */
	OrderDTO insertOrder(OrderDTO orderDTO) throws SQLException;
	
	/**
	 * 주문 수정(배송지, 배송 연락처 수정) 1이면 변경소성공, 0이면 변경실패
	 */
	int updateOrder(OrderDTO orderDTO) throws SQLException;
	
	/**
	 * 주문 삭제(관리자가 주문을 삭제) 1이면 삭제성공, 0이면 삭제실패
	 */
	int deleteOrder(String orderCode) throws SQLException;
	
	/**
	 * 주문 취소(사용자가 주문을 취소) 1이면 취소성공, 0이면 취소실패
	 */
	int updateOrderState(String orderCode, String orderStateCode) throws SQLException;
	
	
	/**
	 * 회원의 배송정보 검색 
	 */
	UserDTO selectUserOrderInfo(String customerCode)throws SQLException;
	
}

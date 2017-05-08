<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="${pageContext.request.contextPath}/start.jsp"><img src="${pageContext.request.contextPath}/assets/img/logo/logo.png"  width="100px" height="30px"></a>
	</div>
	<div class="navbar-collapse collapse navbar-right">
		<ul class="nav navbar-nav">
			<li class="active"><a href="index.html">홈</a></li>
			<li><c:choose>
					<c:when test="${sessionScope.loggedInUser==null}">
						<a href="${pageContext.request.contextPath}/customer/user/login.jsp">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="user?command=logout">로그아웃</a>
					</c:otherwise>
				</c:choose></li>
			<c:choose>
				<c:when test="${sessionScope.loggedInUser==null}">
					<li><a href="${pageContext.request.contextPath}/customer/user/tempsign.jsp">회원가입</a></li>
				</c:when>
			</c:choose>
	<%-- 		<li><a
				href="${pageContext.request.contextPath}/customer/book/detail_book.jsp">도서</a></li> --%>
			<li><a href="${pageContext.request.contextPath}/customer/user/mypage.jsp">마이부크</a></li>
			<li><a href="${pageContext.request.contextPath}/Cart?key=cartSelect">장바구니</a></li>
			<li><a href="#">찾아오시는 길</a></li>
		</ul>
	</div>
	
</div>
<br><br>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">

	<!-- Sidebar user panel (optional) -->
	<div class="user-panel">
		<div class="pull-left image">
			<img src="${pageContext.request.contextPath}/admin/dist/img/user2-160x160.jpg" class="img-circle"
				alt="User Image">
		</div>
		<div class="pull-left info">
			<p>Alexander Pierce</p>
			<!-- Status -->
			<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
		</div>
	</div>

	<!-- search form (Optional) -->
	<form action="#" method="get" class="sidebar-form">
		<div class="input-group">
			<input type="text" name="q" class="form-control"
				placeholder="Search..."> <span class="input-group-btn">
				<button type="submit" name="search" id="search-btn"
					class="btn btn-flat">
					<i class="fa fa-search"></i>
				</button>
			</span>
		</div>
	</form>
	<!-- /.search form -->


	<!-- 사이드바!!!!!!!! -->

	<!-- Sidebar Menu -->
	<ul class="sidebar-menu">
		<li class="header">메뉴</li>
		<!-- Optionally, you can add icons to the links -->
				<li class="treeview">
					<a href="#">
					<i class="fa fa-link"></i> 
					<span>도서관리</span>
					<span class="pull-right-container">
					<i class="fa fa-angle-left pull-right"></i>	
					</span> 
					</a>
					<ul class="treeview-menu">
						<li><a href="${pageContext.request.contextPath}/ShowBookServlet">도서보기</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/book_detail_registeration.jsp">도서등록</a></li>
					</ul>
				</li>
		
				<li class="treeview">
					<a href="${pageContext.request.contextPath}/UserManagementServlet"> 
					<i class="fa fa-link"></i>
					 <span>회원관리</span></a>
				</li>
		
				<li class="treeview">
					<a href="${pageContext.request.contextPath}/admin/sales_management.jsp"> 
					<i class="fa fa-link"></i>
					 <span>매출관리</span></a>
				</li>
				
				<li class="treeview">
					<a href="#"> 
					<i class="fa fa-link"></i>
					 <span>배송관리</span></a>
				</li>
		
		
				<li class="treeview">
					<a href="#">
					<i class="fa fa-link"></i> 
					<span>카테고리 관리</span>
					<span class="pull-right-container">
					<i class="fa fa-angle-left pull-right"></i>	
					</span> 
					</a>
					<ul class="treeview-menu">
						<li><a href="#">카테고리 추가</a></li>
						<li><a href="#">카테고리 수정</a></li>
						<li><a href="#">카테고리 삭제</a></li>
						<li><a href="#">카테고리 출력</a></li>
					</ul>
				</li>
		
	</ul>
	<!-- /.sidebar-menu -->
</section>
<!-- /.sidebar -->
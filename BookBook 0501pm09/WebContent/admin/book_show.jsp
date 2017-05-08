<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bookbook.util.db.CodeUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/dist/css/skins/skin-blue.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/dist/css/skins/skin-blue.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/tinymce/tinymce.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/jquery-3.2.1.min.js"></script>

<script>
	$(function() {}); //jQeury Area
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- top -->
		<header class="main-header">
			<jsp:include page="admin_header.jsp" />
		</header>
		<!--  왼쪽 전체 -->
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<jsp:include page="left.jsp"></jsp:include>
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<!-- Content Header (Page header) -->
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>도서목록</h1>
				<p>
				<p>
				<div class="row">
					<div class="col-xs-12">
						<div class="input-group">
							<div class="input-group-btn search-panel">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown">
									<span id="search_concept">분류</span> <span class="caret"></span>
								</button>
								<ul id="select_box" class="dropdown-menu" role="menu">
									<li value="book_title"><a href="#all">전체검색</a></li>
									<li value="book_title"><a href="#bookName">제목</a></li>
									<li value="book_author"><a href="#author">저자</a></li>
									<li value="book_publisher"><a href="#publisher">출판사</a></li>
								</ul>
							</div>
							<input type="hidden" name="search_param" value="all"
								id="search_param"> <input type="text" id="input_data"
								class="form-control" name="x" placeholder="Search term...">
							<span class="input-group-btn">
								<button id="search_btn" class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</div>

				<div class="box-body">
					<table id="example2" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>ISBN</th>
								<th>도서명</th>
								<th>분야코드</th>
								<th>분야명</th> 
								<th>출판사</th>
								<th>저자</th>
								<th>가격</th>
								<th>재고</th>
								<th>삭제</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="book_dto">
							<tr>
								<th>${book_dto.bookCode}</th>
								<th><a
									href="${pageContext.request.contextPath}/SelectBookServlet?book_code=${book_dto.bookCode}">${book_dto.bookTitle}</a></th>
								 <th>${book_dto.bookCategoryCode}</th> 
								 <th>${CodeUtil.getCodeName(book_dto.bookCategoryCode)}</th>
								<th>${book_dto.bookPublisher}</th>
								<th>${book_dto.bookAuthor}</th>
								<th><fmt:formatNumber value="${book_dto.bookPrice}"
										pattern="#,###.##" />원</th>
								<th><fmt:formatNumber value="${book_dto.bookInventory}"
										pattern="#,###.##" />권</th>
								<th><button type="button" id="delete_btn"
										class="btn btn-block btn-primary">삭제</button></th>
							</tr>
						</c:forEach>
					</table>

				</div>
				<!-- /.box-body -->
			</section>





			<!--!!!!주요 내용!!!! -->


			<!-- Main content -->
			<section class="content" id="custompage">
				<!-- Your Page Content Here -->

			</section>




			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs"></div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2017 <a href="#">BookBook
					Company</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control	-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
	<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 2.2.3 -->
	<script
		src="${pageContext.request.contextPath}/admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/admin/dist/js/app.min.js"></script>

	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath}/admin/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script>
		$(function() {
			var param;
			
			//table 삭제 버튼 동적
			//$(이벤트대상 부모노드).on(이벤트종류,이벤트 대상,콜백함수);
			$(document).on("click", "button[id='delete_btn']", function() {

				alert($(this).parent().parent().find("th:eq(0)").text());
				//$(location).attr('href', "UserDeleteServlet?customer_code=" + $(this).parent().parent().find("th:eq(0)").text());

			}) //on 함수

			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : true,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});


			
			//검색 기능	
		    $('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				param = $(this).attr("href").replace("#","");
				var concept = $(this).text();
				$('.search-panel span#search_concept').text(concept);
				//$('.input-group #search_param').val(param);
			});
		
		    $("#search_btn").click(function(){
			//alert("a");
		    	location.href="ShowBookServlet?attr="+param+"&data="+$("#input_data").val();
		    	
			});
			
			
		});//jQeury
	</script>




</body>

</html>
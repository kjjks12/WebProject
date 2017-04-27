<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dist/css/skins/skin-blue.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dist/css/skins/skin-blue.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/tinymce/tinymce.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-3.2.1.min.js"></script>

<script>
	$(document).ready(function() {
		tinymce.init({
			selector : "textarea",
			theme : "modern",
			height : "300",
			paste_data_images : true,
			language : "ko_KR",
			images_upload_base_path : '/book_detail_img',
			plugins : [
				"advlist autolink lists link image charmap print preview hr anchor pagebreak",
				"searchreplace wordcount visualblocks visualchars code fullscreen",
				"insertdatetime media nonbreaking save table contextmenu directionality",
				"emoticons template paste textcolor colorpicker textpattern"
			],
			toolbar1 : "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
			toolbar2 : "print preview media | forecolor backcolor emoticons",
			image_advtab : true,
			file_picker_callback : function(callback, value, meta) {
				if (meta.filetype == 'image') {
					$('#upload').trigger('click');
					$('#upload').on('change', function() {
						var file = this.files[0];
						var reader = new FileReader();
						reader.onload = function(e) {
							callback(e.target.result, {
								alt : ''
							});
						};
						reader.readAsDataURL(file);
					});
				}
			},
			templates : [ {
				title : 'Test template 1',
				content : 'Test 1'
			}, {
				title : 'Test template 2',
				content : 'Test 2'
			} ]
		});
	});
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


				<h1>도서 수정하기</h1>
				<p>
					<br>
				<form id="form" name="bookInfo" action="${pageContext.request.contextPath}/UpdateBookServlet"
					method="post" enctype="multipart/form-data">
					I&nbsp;S&nbsp;B&nbsp;N&nbsp;:&nbsp;<input type="text"
						class="form-control" name="isbn" value="${book_detail_dto.bookDTO.bookCode}" readonly><br> <br>
					도서명:&nbsp;<input type="text" class="form-control" name="book_name" value="${book_detail_dto.bookDTO.bookTitle}">
					<br> 저 자:&nbsp;<input type="text" name="author"
						value="${book_detail_dto.bookDTO.bookAuthor}"><br> 
					<br> 출판사:&nbsp;<input 	type="text" name="publisher" value="${book_detail_dto.bookDTO.bookPublisher}"><br>
					<br> 출간일:&nbsp;<input type="text" name="publish_date" value="${book_detail_dto.bookDTO.bookDate}"><br>
					<br> 페이지수:&nbsp;<input type="text" name="page_num" value="${book_detail_dto.bookDTO.bookPage}"><br>
					<br> 가격:&nbsp;<input type="text" name="price" value="${book_detail_dto.bookDTO.bookPrice}"><br>
					<br> 책 이미지:&nbsp;<input type="file" name="book_img" value="${book_detail_dto.bookDTO.bookCover}"><br>
					<br> 분야코드:&nbsp;<input type="text" name="book_category_code" value="${book_detail_dto.bookDTO.bookCategoryCode}"><br>
					<br> 분야명:&nbsp;<input type="text" name="category_name" value="${book_detail_dto.bookDTO.bookCategoryName}"><br>
					<br> 재고수량:&nbsp;<input type="text" name="inventory" value="${book_detail_dto.bookDTO.bookInventory}"><br>
					<br>
					<h3>
						상세 정보
						<h3>
							책설명
							<textarea name="book_description" id="text" cols="10	" rows="10">${fn:replace(book_detail_dto.bookDetailDescription,'&lt;', '<')}<p></textarea>
							<input name="image" type="file" id="upload" class="hidden" hidden><br>
							<br> 저자 설명
							<textarea name="author_description" id="text" cols="10" rows="10">${fn:replace(book_detail_dto.bookDetailAuthor,'&lt;', '<')}<p></textarea>
							<input name="image" type="file" id="upload" class="hidden" hidden><br>
							<br> 목차
							<textarea name="index_description" id="text" cols="10" rows="10">${fn:replace(book_detail_dto.bookDetailIndex,'&lt;', '<')}<p></textarea>
							<input name="image" type="file" id="upload" class="hidden" hidden><br>
							<br>

							<button type="submit" class="btn btn-block btn-warning">저장하기</button>
				</form>
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

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.2.3 -->
	<script src="${pageContext.request.contextPath}/admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/admin/dist/js/app.min.js"></script>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->

</body>

</html>
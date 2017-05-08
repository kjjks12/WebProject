<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bookbook.util.db.CodeUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<!-- bootstrap datepicker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/bootstrap/css/datepicker3.css">


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

				<br>
				<h1>도서 등록</h1>
				<p>
					<br>
					<!-- 폼시작 -->
				<form id="form" name="bookInfo" id="input_form"
					action="${pageContext.request.contextPath}/SaveBookServlet"
					method="post" enctype="multipart/form-data">

					<div class="row">
						<div class="col-xs-5">
							<img id="book_img" width="400" height="530" src="" />
						</div>

						<div class="col-xs-6" align="right">
							<div class="row">
								<div class="col-xs-2">
									<strong>I&nbsp;S&nbsp;B&nbsp;N&nbsp;:&nbsp;</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm" name="isbn"
										id=isbn>
								</div>
							</div>

							<br>
							<div class="row">
								<div class="col-xs-2">
									<strong>도서명 :</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm"
										name="book_name" id="book_name">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-xs-2">
									<strong>저 자:</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm" name="author"
										id="author">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-xs-2">
									<strong>출판사:</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm" id="publisher"
										name="publisher">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-xs-2">
									<strong>출간일:</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm"
										data-inputmask="'alias': 'dd-mm-yyyy'" name="publish_date"
										id="datepicker">
									<!-- <input type="text" class="form-control input-sm"
								name="publish_date" > -->
									<%-- 	${pageContext.request.contextPath} --%>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-xs-2">
									<strong>페이지 수:</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm"
										name="page_num" id="page_num">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-xs-2">
									<strong>가 격:</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm" name="price"
										id="price">
										<div class="col-xs-1">원</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-xs-2">
									<strong>책 이미지:</strong>
								</div>
								<div class="col-xs-1">
									<input type="file" name="book_img" id="imgInp"
										accept='image/jpeg,image/gif,image/png'
										onchange='chk_file_type(this)'>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-xs-2">
									<strong>분야명 :</strong>
								</div>
								<div class="col-xs-1">
									<select name="category_name" id="category_name">
										<c:forEach items="${CodeUtil.getChildCodes('04')}" var="code_number">
											<option value="${code_number}">${CodeUtil.getCodeName(code_number)}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-xs-2">
									<strong>분야코드:</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm"
										name="book_category_code" id="book_category_code" value="0401" readonly>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-xs-2">
									<strong>재고수량:</strong>
								</div>
								<div class="col-xs-6">
									<input type="text" class="form-control input-sm"
										name="inventory" id="inventory">
								</div>
							</div>
						</div>
					</div>





					<p>



						<h3>상세 정보</h3>
					<h3>책설명</h3>
					<textarea name="book_description" id="text" cols="10" rows="10"><p></textarea>
					<input name="image" type="file" id="upload" class="hidden" hidden><br>
					<br> 저자 설명
					<textarea name="author_description" id="text" cols="10" rows="10"><p></textarea>
					<input name="image" type="file" id="upload" class="hidden" hidden><br>
					<br> 목차
					<textarea name="index_description" id="text" cols="10" rows="10"><p></textarea>
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
	<script
		src="${pageContext.request.contextPath}/admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/admin/dist/js/app.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/admin/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->

	<script>
		$(function() {
			$("#imgInp").on('change', function() {
				readURL(this);
			});
		});
	
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					$('#book_img').attr('src', e.target.result);
				}
	
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script>
		$(document)
			.ready(
				function() {
	
					//tiymce 
					tinymce
						.init({
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
								"emoticons template paste textcolor colorpicker textpattern" ],
							toolbar1 : "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
							toolbar2 : "print preview media | forecolor backcolor emoticons",
							image_advtab : true,
							file_picker_callback : function(
								callback, value, meta) {
								if (meta.filetype == 'image') {
									$('#upload').trigger('click');
									$('#upload')
										.on(
											'change',
											function() {
												var file = this.files[0];
												var reader = new FileReader();
												reader.onload = function(
													e) {
													callback(
														e.target.result,
														{
															alt : ''
														});
												};
												reader
													.readAsDataURL(file);
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
	
					//유효성 검사 리스트	
						//공백 alert()
	
					$("form").submit(function() {
						//alert($("#imgInp").val().trim());
						if ($("#isbn").val().trim() == "") {
							alert("isbn값을 입력해주세요");
							$("#isbn").focus();
							return false;
						}
						if ($("#book_name").val().trim() == "") {
							alert("도서명을  입력해주세요");
							$("#book_name").focus();
							return false;
						}
						if ($("#author").val().trim() == "") {
							alert("저자를  입력해주세요");
							$("#author").focus();
							return false;
						}
						if ($("#publisher").val().trim() == "") {
							alert("출판사를  입력해주세요");
							$("#publisher").focus();
							return false;
						}
						if ($("#datepicker").val().trim() == "") {
							alert("출간일을  입력해주세요");
							$("#datepicker").focus();
							return false;
						}
						if ($("#page_num").val().trim() == "") {
							alert("쪽 수를  입력해주세요");
							$("#page_num").focus();
							return false;
						}
						if ($("#price").val().trim() == "") {
							alert("가격을  입력해주세요");
							$("#price").focus();
							return false;
						}
						if ($("#imgInp").val().trim() == "") {
							alert("이미지를   삽입 해주세요");
							$("#imgInp").focus();
							return false;
						}
						if ($("#book_category_code").val().trim() == "") {
							alert("카테고리 코드 를  입력해주세요");
							$("#book_category_code").focus();
							return false;
						}
						if ($("#inventory").val().trim() == "") {
							alert("재고수량을  입력해주세요");
							$("#inventory").focus();
							return false;
						}
	
						return true;
					});
	
					//숫자만 입력 받기
					$("#isbn").keyup(
						function() {
							$(this).val(
								$(this).val().replace(
									/[^0-9]/g, ""));
						});
					$("#page_num").keyup(
						function() {
							$(this).val(
								$(this).val().replace(
									/[^0-9]/g, ""));
						});
					$("#price").keyup(
						function() {
							$(this).val(
								$(this).val().replace(
									/[^0-9]/g, ""));
						});
					$("#inventory").keyup(
						function() {
							$(this).val(
								$(this).val().replace(
									/[^0-9]/g, ""));
						});
	
					//Date picker
					$('#datepicker').datepicker({
						format : "yyyy-mm-dd",
						autoclose : true
					});
					
					//분야명 셋팅시 분야코드 자동 셋팅
					$("#category_name").change(function() {
				           $("#book_category_code").val($(this).val())
						//alert();
				});
	
				}); //jQuery
	</script>
<script type="text/javascript">
function chk_file_type(obj) {
	 var file_kind = obj.value.lastIndexOf('.');
	 var file_name = obj.value.substring(file_kind+1,obj.length);
	 var file_type = file_name.toLowerCase();

	var check_file_type=['jpg','gif','png','jpeg','bmp'];

	 if(check_file_type.indexOf(file_type)==-1){
	  alert('이미지 파일만 선택할 수 있습니다.');
	  var parent_Obj=obj.parentNode
	  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
	  return false;
	 }
	}


</script>

</body>

</html>
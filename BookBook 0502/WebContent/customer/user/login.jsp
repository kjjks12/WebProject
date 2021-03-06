<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
<title>부끄부끄</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/assets/css/style.css?ver=2" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">
<style>
.card-container.card {
	max-width: 350px;
	padding: 40px 40px;
}

.btn {
	font-weight: 700;
	height: 36px;
	-moz-user-select: none;
	-webkit-user-select: none;
	user-select: none;
	cursor: default;
}

/*
 * Card component
 */
.card {
	background-color: #F7F7F7;
	/* just in case there no content*/
	padding: 20px 25px 30px;
	margin: 0 auto 25px;
	margin-top: 50px;
	/* shadows and rounded borders */
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	margin: 10px 0 0;
	min-height: 1em;
}

.reauth-email {
	display: block;
	color: #404040;
	line-height: 2;
	margin-bottom: 10px;
	font-size: 14px;
	text-align: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin #inputEmail, .form-signin #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 16px;
}

.form-signin input[type=email], .form-signin input[type=password],
	.form-signin input[type=text], .form-signin button {
	width: 100%;
	display: block;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

.btn.btn-signin {
	/*background-color: #4d90fe; */
	background-color: rgb(104, 145, 162);
	/* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
	padding: 0px;
	font-weight: 700;
	font-size: 14px;
	height: 36px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: none;
	-o-transition: all 0.218s;
	-moz-transition: all 0.218s;
	-webkit-transition: all 0.218s;
	transition: all 0.218s;
}

.btn.btn-signin:hover, .btn.btn-signin:active, .btn.btn-signin:focus {
	background-color: rgb(12, 97, 33);
}

.forgot-password {
	color: rgb(104, 145, 162);
}

.forgot-password:hover, .forgot-password:active, .forgot-password:focus
	{
	color: rgb(12, 97, 33);
}
</style>
</head>

<body>
	<%@ include file="/header.jsp"%>
	<div class="container mtb">
		<div class="row">
			<!--
    you can substitue the span of reauth email for a input with the email and
    include the remember me checkbox
    -->
			<div class="container">
				<c:if test="${param.msg=='login'}">
					<h1>환영합니다!</h1>
				</c:if>
				<c:if test="${param.msg=='mypage'}">
					<h1>마이부끄는 로그인이 필요합니다!</h1>
				</c:if>
				<c:if test="${param.msg=='cart'}">
					<h1>장바구니는 로그인이 필요합니다!</h1>
				</c:if>
			
				<div class="card card-container">
					<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
					<img id="profile-img" class="profile-img-card"
						src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
					<p id="profile-name" class="profile-name-card"></p>
					<form class="form-signin" method ="post" action="${pageContext.request.contextPath}/user" id="login_btn">
						<span id="reauth-id" class="reauth-id"></span> 
						<input type="hidden" name="command" value="login">
						<input type="text"
							id="inputId" class="form-control" placeholder="아이디" required
							autofocus name="inputId"> <input type="password" id="inputPassword"
							class="form-control" name="inputPassword" placeholder="비밀번호" required>
						<div id="remember" class="checkbox">
							<label> <input type="checkbox" value="remember-me">
								아이디 저장
							</label>
						</div>
						<button class="btn btn-lg btn-primary btn-block btn-signin"
							type="submit">로그인</button>
					</form>
					<!-- /form -->
					<a href="#" class="forgot-password"> 비밀번호 찾기</a>
				</div>
				<!-- /card-container -->
			</div>
			<!-- /container -->

		</div>
	</div>

	<%@ include file="/footer.jsp"%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.hoverdir.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.hoverex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.prettyPhoto.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/portfolio.js"></script>
	
	<script>
	$(document).ready(function(){
/* 		$("#login_btn").submit(function(){
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/user",
				data : "inputId=" + $("#inputId").val() + "&bookCode="+$("#inputPassword").val(),
				dataType : "text",
				success : function(result) {
					if(result!=0){
					alert('login 성공');
					}
					else(result==0){
						alert('login 실패');
					}
				},
				error : function(err) {
					alert('login 실패');
				}
			})
			
			return false;
		});//submit 버튼
		
		 */
	});//jQuery
		
	
	
	</script>
</body>
</html>

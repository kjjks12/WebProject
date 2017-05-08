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
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<title>SOLID - Bootstrap 3 Theme</title>
<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/header.jsp" %>
   <div id="headerwrap">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
               <div>
                  <h1>페이지에 오류 발생</h1>
                     죄송합니다. 문제가 발생하였습니다.<br>
                  발생된 문제 : ${requestScope.errorMsg}<br>
                  <a href="javascript:history.back()">뒤로가기</a>
               </div>
            </div>
            <div class="col-lg-8 col-lg-offset-2 himg">
               <!-- <img src="assets/img/.png" class="img-responsive"> -->
            </div>
         </div>
         <!-- /row -->
      </div>
      <!-- /container -->
   </div>
   <!-- /headerwrap -->

<%@ include file="/footer.jsp" %>
   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script src="${pageContext.request.contextPath}assets/js/jquery-3.2.0.min.js"></script>
   <script src="${pageContext.request.contextPath}assets/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}assets/js/retina-1.1.0.js"></script>
   <script src="${pageContext.request.contextPath}assets/js/jquery.hoverdir.js"></script>
   <script src="${pageContext.request.contextPath}assets/js/jquery.hoverex.min.js"></script>
   <script src="${pageContext.request.contextPath}assets/js/jquery.prettyPhoto.js"></script>
   <script src="${pageContext.request.contextPath}assets/js/jquery.isotope.min.js"></script>
   <script src="${pageContext.request.contextPath}assets/js/custom.js"></script>
</body>
</html>



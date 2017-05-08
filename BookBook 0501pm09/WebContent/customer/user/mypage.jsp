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
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
   rel="stylesheet">
<!-- Custom styles for this template -->
<link
   href="${pageContext.request.contextPath}/assets/css/style.css?ver=2"
   rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"
   rel="stylesheet">
</head>
<body>
   <%@ include file="/header.jsp"%>
   <div>
      <c:choose>
         <c:when test="${sessionScope.loggedInUser==null}">
            <div id="headerwrap">
               <div class="container">
                  <div class="row">
                     <div class="col-lg-8 col-lg-offset-2">
                        <h1>마이페이지</h1>
                     </div>
                     <div class="col-lg-8 col-lg-offset-2 himg">
                        <!-- <img src="assets/img/.png" class="img-responsive"> -->
                        <nav>
                        <a href="#"><img id="cart" class="icon"
                           src="${pageContext.request.contextPath}/customer/user/img/cart_yellow.png" 
                           style="margin: 15px 25px 25px 25px"></a>
                        <a href="#"><img id="info" class="icon"
                           src="${pageContext.request.contextPath}/customer/user/img/info_yellow.png"
                           style="margin: 15px 25px 25px 25px"></a>
                        <a href="#"><img id="order" class="icon"
                           src="${pageContext.request.contextPath}/customer/user/img/order_yellow.png"
                           style="margin: 15px 25px 25px 25px"></a>
                   </nav>                   
                     </div>
                  </div>
                  <!-- /row -->
               </div>
               <!-- /container -->
            </div>
         </c:when>

         <c:otherwise>
            <c:redirect url="login.jsp">
               <c:param name="msg" value="mypage">
               </c:param>
            </c:redirect>
         </c:otherwise>
      </c:choose>
   </div>
   <%@ include file="/footer.jsp"%>
   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery-3.2.0.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.hoverdir.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.hoverex.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.prettyPhoto.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.isotope.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
   <script>
      $(function() {
         $(".icon").mouseover(function() {
            var id = $(this).attr('id');
            var imgRed = "${pageContext.request.contextPath}"+"/customer/user/img/"+id+"_red.png";
            $(this).attr('src', imgRed);
         })
         $(".icon").mouseout(function() {
            var id = $(this).attr('id');
            var imgYellow = "${pageContext.request.contextPath}"+"/customer/user/img/"+id+"_yellow.png";
            $(this).attr('src', imgYellow);
         })
      });
   </script>
</body>
</html>
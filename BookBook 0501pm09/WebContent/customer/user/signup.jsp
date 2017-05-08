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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<title>회원가입</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/assets/css/style.css?ver=2" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">
<style>

</style>


<script language="javascript">
	function passwordCheck() {

		var password1 = document.getElementById("inputPassword1").value;
		var password2 = document.getElementById("inputPassword2").value;

		if (password2 == "") {
			document.getElementById("passwordCheck").innerHTML = ""
		} else if (password1 != password2) {
			document.getElementById("passwordCheck").innerHTML = "<b><font color = red size=2pt> 비밀번호 불일치 </font></b>"
		} else {
			document.getElementById("passwordCheck").innerHTML = "<b><font color = blue size=2pt> 비밀번호 일치  </font></b>"
		}
	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>


<script>
	function Init() {
		var birthMonth = document.getElementById("birthMonth");

		birthMonth.innerHTML = "월";
		for (var i = 0; i < 12; i++) {
			var month = i;
			birthMonth.innerHTML += "<option value='"+month+"'>" + month
					+ "</option>";
		}
	}

	function formChange() {
		var birthYear = document.getElementById("birthYear");
		var birthMonth = document.getElementById("birthMonth");
		var birthDay = document.getElementById("birthDay");
		var lastDay = (new Date(birthYear.value, birthMonth.value, 0))
				.getDate();

		var today = new Date();

		if (birthYear.value > today.getFullYear()) {
			//alert("알러트");
			return;
		}

		birthDay.innerHTML = "일";
		for (var i = 0; i <= lastDay; i++) {
			birthDay.innerHTML += "<option value='"+i+"'>" + i + "</option>";
		}
	}
	$(function() {
		
		$("#inputId").keyup(function() {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/user?command=idcheck",
				data : "inputId=" + $(this).val(),
				dataType : "text",
				success : function(result) {
					console.log(result);
					$("#idCheck").text(result);
				},
				error : function(err) {
					alert("에러발생 :" + err)
				}

			})
			
		}); //중복확인 끝
		
		
		$(".form-horizontal").submit(function() { //회원가입 버튼
              //alert("submit")
			if ($("#inputId").val().trim() == "") {
				alert("아이디를 입력하세요.");
				$("#inputId").focus();
				return false;
			}
			if ($("#inputPassword1").val().trim() == "") {
				alert("비밀번호를 입력하세요.");
				$("#inputPassword1").focus();
				return false;
			}
			if ($("#inputPassword2").val().trim() == "") {
				alert("비밀번호를 입력하세요.");
				$("#inputPassword2").focus();
				return false;
			}
			if ($("#name").val().trim() == "") {
				alert("이름을 입력하세요.");
				$("#name").focus();
				return false;
			}
			//성별 라디오체크버튼 체크되었는지.
			if ($("#tel1").val().trim() == "") {
				alert("전화번호를 입력하세요.");
				$("#tel1").focus();
				return false;
			}
			if ($("#tel2").val().trim() == "") {
				alert("전화번호를 입력하세요.");
				$("#tel2").focus();
				return false;
			}
			if ($("#tel3").val().trim() == "") {
				alert("전화번호를 입력하세요.");
				$("#tel3").focus();
				return false;
			}
			if ($("#birthYear").val().trim() == "") {
				alert("생일을 입력하세요.");
				$("#birthYear").focus();
				return false;
			}
			if ($("#birthMonth").val().trim() == "") {
				alert("생일을 입력하세요.");
				$("#birthYear").focus();
				return false;
			}
			if ($("#birthDay").val().trim() == "") {
				alert("생일을 입력하세요.");
				$("#birthYear").focus();
				return false;
			}
			if ($("#sample6_address").val().trim() == "") {
				alert("주소를 입력하세요.");
				$("#sample6_address").focus();
				return false;
			}
			if ($("#sample6_address2").val().trim() == "") {
				alert("상세주소를 입력하세요.");
				$("#sample6_address2").focus();
				return false;
			}
			if ($("#userEmail1").val().trim() == "") {
				alert("이메일을 입력하세요.");
				$("#userEmail1").focus();
				return false;
			}
			if ($("#userEmail2").val().trim() == "") {
				alert("이메일을 입력하세요.");
				$("#userEmail2").focus();
				return false;
			}
		})
	})
</script>


</head>

<body onload="Init()">
	<%@ include file="/header.jsp"%>
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user?command=insert">
					
					
					<div class="col-lg-5">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">아이디</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="inputId"
										id="inputId" placeholder="아이디를 입력하세요" style="width=30px" maxlength="10"/> <span id="idCheck">중복체크
										부분입니다.</span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="" class="cols-sm-2 control-label">비밀번호</label>
							<div class="cols-sm-10">
								<div class="input-group">
								<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input type="password"
										class="form-control" name="inputPassword1" id="inputPassword1"
										placeholder="비밀번호를 입력하세요." maxlength="10" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="" class="cols-sm-2 control-label">비밀번호 확인</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input type="password"
										class="form-control" name="inputPassword2" id="inputPassword2"
										placeholder="비밀번호를 입력하세요." onkeyup="passwordCheck()" maxlength="10"/> <span
										id="passwordCheck">비밀번호 일치 불일치 </span>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">이름</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="name" id="name"
										placeholder="이름을 입력하세요." maxlength="12" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">성별</label>
							<div class="cols-sm-10">
								<div >
									<span class="input-group-addon"><i
										class="fa fa-users fa" aria-hidden="true"></i></span> <input
										type="radio" id="gender" name="gender" value="m">남성 <input
										type="radio" id="gender" name="gender" value="f">여성
								</div>
							</div>
						</div>


						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">전화번호</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-phone" aria-hidden="true"></i></span> 
										
										<div>
										<input type="text"  id="tel1" name="tel1" style="text-align:center; width:100px; height:30px;" maxlength="4">
										<b>-</b>
				
									 	<input type="text" id="tel2" name="tel2" style="text-align:center; width:100px; height:30px;" maxlength="4" float="right">
									 	<b>-</b>
									 	
									 	<input type="text"  id="tel3" name="tel3" style="text-align:center; width:100px; height:30px;" maxlength="4" float="right">
									 	
										</div>

								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-5 col-lg-offset-2">
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">생년월일</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> 
								
										<input type="number" size="10" id="birthYear" name="birthYear"value="2017" style="text-align:left; width:200; height:25px;">년 
										<select id="birthMonth" name="birthMonth" onchange="formChange()" style="text-align:left; width:50px; height:25px;"></select>월 
										<select id="birthDay" name="birthDay" style="text-align:left; width:50px; height:25px;"></select>일
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">주소</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-home"
										aria-hidden="true"></i></span>
										 
										<input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호"  style="text-align:left; width:280px; height:25px;"> 
										<input type="button" onclick="sample6_execDaumPostcode()" name="birthYear" value="우편번호 찾기" style="text-align:left; width:150px; height:25px;"><br> 
										<input type="text" id="sample6_address" name="sample6_address" placeholder="주소"  style="text-align:center; width:230px; height:25px;">
										<input type="text" id="sample6_address2" name="sample6_address2" placeholder="상세주소"  style="text-align:center; width:210px; height:25px;">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">이메일</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"
										aria-hidden="true"></i></span> 
										<input type="text"  id="userEmail1" name="userEmail1" placeholder="이메일 주소" style="text-align:center; width:150px; height:30px;"/>
										 <label style="color:black">@</label>
										<input type="text"id="userEmail2"name="userEmail2" placeholder="이메일 주소" style="text-align:center; width:150px; height:30px;"> 
										
										
								</div>
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="password" class="cols-sm-2 control-label">비밀번호
								찾기 질문</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <select
										name="email"style="text-align:left; width:450px; height:30px;">
										<option value="self">:: 질문 선택 ::</option>
										<option value="father">1. 아버지의 성함은?</option>
										<option value="mother">2. 어머니의 성함은?</option>
										<option value="teacher">3. 학창시절 가장 기억나는 선생님은?</option>
										<option value="love">4. 첫사랑의 이름은?</option>
										<option value="weight">5. 본인의 진짜 몸무게는?</option>
									</select>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">비밀번호
								찾기 정답</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
										type="text" class="form-control" id="passWordFinder"
										name="passWordFinder" placeholder="비밀번호 찾기 정답">
								</div>
							</div>
						</div> -->


						<div class="form-group ">
							<input type="submit"
								class="btn btn-primary btn-lg btn-block login-button"
								id="submitBtn" name="submitBtn" value="회원가입하기">
						</div>
						<div class="login-register">
							<input type="button"
								class="btn btn-primary btn-lg btn-block login-button"
								id="cancelBtn" name="cancelBtn" value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



	<%@ include file="/footer.jsp"%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<%-- <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.0.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.hoverdir.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/assets/js/jquery.hoverex.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.prettyPhoto.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/portfolio.js"></script>
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	 -->
	<script 
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.min.js"></script>

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

		for (var i = 0; i < 12; i++) {
			var month = i + 1;
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
			alert("알러트");
			return;
		}

		birthDay.innerHTML = "";
		for (var i = 1; i <= lastDay; i++) {
			birthDay.innerHTML += "<option value='"+i+"'>" + i + "</option>";
		}
	}
	$(function() {
		$("#inputId").keyup(function() {
			$.ajax({
				type : "post",
				url : "user?command=idcheck",
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
		$("#submitBtn").submit(function() { //회원가입 버튼

			if ($("#inputId").val().trim() == "") {
				alert("아이디를 입력하세요.");
				$("#inputId").focus();
				return;
			}
			if ($("#inputPassword1").val().trim == "") {
				alert("비밀번호를 입력하세요.");
				$("#inputPassword1").focus();
				return;
			}
			if ($("#inputPassword2").val().trim == "") {
				alert("비밀번호를 입력하세요.");
				$("#inputPassword2").focus();
				return;
			}
			if ($("#name").val().trim == "") {
				alert("이름을 입력하세요.");
				$("#name").focus();
				return;
			}
			//성별 라디오체크버튼 체크되었는지.
			if ($("#tel1").val().trim == "") {
				alert("전화번호를 입력하세요.");
				$("#tel1").focus();
				return;
			}
			if ($("#tel2").val().trim == "") {
				alert("전화번호를 입력하세요.");
				$("#tel2").focus();
				return;
			}
			if ($("#tel3").val().trim == "") {
				alert("전화번호를 입력하세요.");
				$("#tel3").focus();
				return;
			}
			if ($("#birthYear").val().trim == "") {
				alert("생일을 입력하세요.");
				$("#birthYear").focus();
				return;
			}
			if ($("#birthMonth").val().trim == "") {
				alert("생일을 입력하세요.");
				$("#birthYear").focus();
				return;
			}
			if ($("#birthDay").val().trim == "") {
				alert("생일을 입력하세요.");
				$("#birthYear").focus();
				return;
			}
			if ($("#sample6_address").val().trim = "") {
				alert("주소를 입력하세요.");
				$("#sample6_address").focus();
				return;
			}
			if ($("#sample6_address2").val().trim = "") {
				alert("상세주소를 입력하세요.");
				$("#sample6_address2").focus();
				return;
			}
			if ($("#userEmail1").val().trim = "") {
				alert("이메일을 입력하세요.");
				$("#userEmail1").focus();
				return;
			}
			if ($("#userEmail2").val().trim = "") {
				alert("이메일을 입력하세요.");
				$("#userEmail2").focus();
				return;
			}
		})
	})
</script>
<Style>
h1 {
	padding-top: 20px;
	color: white;
	height: 40px;
	text-align: left;
	background-color: #74acf2;
}

table {
	border-style: none;
	padding: 0px 0px 0px 0px;
	margin: 0px 0px 0px 0px;
	font-size: 10pt;
	line-height: 150%;
	width: 800px;
	border-collapse: collapse;
}

td {
	height: 30px;
	border-style: none;
	padding: 0px 0px 0px 0px;
	margin: 0px 0px 0px 0px;
	font-size: 9pt;
	line-height: 150%;
}

tr {
	height: 50px;
	border-style: none;
	padding: 0px 0px 0px 0px;
	margin: 0px 0px 0px 0px;
	font-size: 8pt;
	line-height: 150%;
}
</Style>
<link rel="shortcut icon" href="assets/ico/favicon.ico">

<title>BookBook</title>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/custom/css/common.css" />

</head>
<body onload="Init()">
	<%@ include file="/header.jsp"%>
	<div class="container">
	<form action="user" method="post">
		<input type="hidden" name="command" value="insert">
		<table>
			<tr id="idForm">
				<td><label> <strong>아이디 <span>*</span>
					</strong>
				</label></td>
				<td><input type="text" id="inputId" name="inputId"
					placeholder="아이디를 입력하세요."></td>
				<td colspan="2"><span id="idCheck">중복체크 부분입니다.</span></td>
			</tr>

			<tr id="passwordForm">
				<td><label> <strong> 비밀번호 <span>*</span></strong>
				</label></td>
				<td><input type="password" id="inputPassword1"
					name="inputPassword1" placeholder="비밀번호를 입력하세요."></td>
			</tr>

			<tr id="passwordCheckFrom">
				<td><label> <strong> 비밀번호 확인<span>*</span></strong>
				</label>
				<td><input type="password" id="inputPassword2"
					name="inputPassword2" placeholder="비밀번호 확인"
					onkeyup="passwordCheck()"></td>
				<td><span id="passwordCheck">비밀번호 일치 불일치 </span></td>

			</tr>

			<tr id="nameForm">
				<td><label> <strong> 이름 <span>*</span></strong>
				</label></td>
				<td><input type="text" id="name" name="name"
					placeholder="이름을 입력하세요."></td>
			</tr>

			<tr id="genderForm">
				<td><label> <strong> 성별 <span>*</span></strong>
				</label></td>
				<td><input type="radio" id="gender" name="gender" value="m">남성
					<input type="radio" id="gender" name="gender" value="f">여성
				</td>
			</tr>

			<tr id="telForm">
				<td><label> <strong> 전화번호 <span>*</span></strong>
				</label></td>
				<td><label> <input type="tel" class="form-control"
						id="tel1" name="tel1">
				</label> <label> <span id="dash"> -</span> <input type="tel"
						class="form-control" id="tel2" name="tel2">
				</label> <label> <span id="dash"> -</span> <input type="tel"
						class="form-control" id="tel3" name="tel3">
				</label></td>
			</tr>

			<tr id="birthForm">
				<td><label> <strong> 생년월일 <span>*</span></strong>
				</label></td>

				<td><input type="number" size="10" id="birthYear"
					name="birthYear" value="2017">년 <select id="birthMonth"
					name="birthMonth" onchange="formChange()">
				</select>월 <select id="birthDay" name="birthDay">
				</select>일</td>
			</tr>

			<tr id="addressForm">
				<!-- http://postcode.map.daum.net/guide -->
				<td><label> <strong> 주소 <span>*</span></strong>
				</label></td>
				<td><input type="text" id="sample6_postcode"
					name="sample6_postcode" placeholder="우편번호"> <input
					type="button" onclick="sample6_execDaumPostcode()" name="birthYear"
					value="우편번호 찾기"><br> <input type="text"
					id="sample6_address" name="sample6_address" placeholder="주소">
					<input type="text" id="sample6_address2" name="sample6_address2"
					placeholder="상세주소"></td>

			</tr>

			<tr id="emailForm">
				<td><label> <strong> 이메일 <span>*</span></strong>
				</label></td>
				<td><input type="text" class="form-control" id="userEmail1"
					name="userEmail1" placeholder="이메일 주소 "> @ <input
					type="text" class="form-control" id="userEmail2" name="userEmail2"
					placeholder="이메일 주소 "> <select name="email">
						<option value="self">직접입력</option>
						<option value="naver">naver.com</option>
						<option value="daum">daum.net</option>
						<option value="google">google.com</option>
						<option value="hotmail">hotmail.com</option>
				</select></td>
			</tr>

			<tr>
				<td><label> <strong> 비밀번호 찾기 질문 <span>*</span></strong>
				</label></td>
				<td><select name="email">
						<option value="self">:: 질문 선택 ::</option>
						<option value="father">1. 아버지의 성함은?</option>
						<option value="mother">2. 어머니의 성함은?</option>
						<option value="teacher">3. 학창시절 가장 기억나는 선생님은?</option>
						<option value="love">4. 첫사랑의 이름은?</option>
						<option value="weight">5. 본인의 진짜 몸무게는?</option>
				</select></td>
			</tr>

			<tr>
				<td><label> <strong> 비밀번호 찾기 정답 <span>*</span></strong>
				</label></td>
				<td><input type="text" class="form-control" id="passWordFinder"
					name="passWordFinder" placeholder="비밀번호 찾기 정답"></td>
			</tr>


			<tr>
				<td id="submitForm" colspan="4" align="center"><input
					type="submit" id="submitBtn" name="submitBtn" value="회원가입하자">
					<input type="reset" id="cancelBtn" name="cancelBtn" value="취소">
				</td>
			</tr>

		</table>
		<!-- 테이블 끝 -->
	</form>
	<!--전송 form 양식 끝 -->
	</div>
	<!--부트스트랩 container 끝 -->
	
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
	<script src="${pageContext.request.contextPath}/assets/js/portfolio.js"></script>
</body>
</html>
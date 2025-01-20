<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SPIKE - 회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="../css/signup.css">

</head>
<body>
	<div class="auth-container">
		<div class="auth-card">
			<div class="auth-header">
				<h1>회원가입</h1>
				<p>SPIKE와 함께 시작하세요</p>
			</div>
			<form name="s" action="signup_ok" method="post" class="auth-form"
				id="signupForm" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="form-group">
					<label for="loginId">아이디</label>
					<div class="id-container">
						<input type="text" id="loginId" name="loginId" required
							placeholder="아이디를 입력하세요">
						<button type="button" onclick="id_check()">중복 확인</button>
					</div>
					<span class="error-message" id="idcheck"></span>
				</div>

				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password"
						id="password" name="password" required placeholder="비밀번호를 입력하세요">
					<span class="error-message" id="passwordError"></span>
				</div>

				<div class="form-group">
					<label for="password2">비밀번호 확인</label> <input type="password"
						id="password2" name="password2" required
						placeholder="비밀번호를 다시 입력하세요"> <span class="error-message"
						id="confirmError"></span>
				</div>

				<div class="form-group">
					<label for="name">이름</label> <input type="text" id="name"
						name="name" required placeholder="이름을 입력하세요">
				</div>
				<div class="form-group">
					<label for="email_id">이메일</label>
					<div class="email-container">
						<input name="email_id" id="email_id" /> @ <input
							name="email_domain" id="email_domain" value="gmail.com" readonly /> <select
							name="mail_list" onchange="domain_list();">
							<c:forEach var="mail" items="${email}">
								<option value="${mail}">${mail}</option>
							</c:forEach>
						</select>
					</div>
					<span class="error-message" id="emailError"></span>
				</div>

				<div class="form-group">
					<label for="birth_date">생년월일</label> <input type="date"
						id="birth_date" name="birth_date" max="2099-12-31" required>
				</div>
				<span class="error-message" id="birthError"></span>

				<div class="form-group">
					<label for="phone">핸드폰번호</label>
					<div class="phone-container">
						<select name="phone01" id="phone01">
							<c:forEach var="p" items="${phone}">
								<option value="${p}">${p}</option>
							</c:forEach>
						</select> - <input name="phone02" id="phone02" size="4" maxlength="4" /> -
						<input name="phone03" id="phone03" size="4" maxlength="4" />
					</div>
					<span class="error-message" id="phoneError"></span>
				</div>

				<!-- 카카오 주소 API 입력 필드 및 버튼 -->
				<div class="form-group">
					<div class="form-group">
						<label for="postcode">우편번호</label>
						<div class="address-container">
							<input type="text" id="postcode" name="postcode"
								placeholder="우편번호" readonly> <input type="button"
								onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						</div>

						<label for="roadAddress">도로명주소</label> 
						<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly>
						<label for="jibunAddress">지번주소</label> 
						<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" readonly>
						<span id="guide" style="color: #999; display: none"></span>
						<label for="detailAddress">상세주소</label> 
						<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" required> 
						<label for="sample4_extraAddress">참고항목</label>
						<input type="text" id="References" name="References" placeholder="참고항목">
					</div>
				</div>

				<!-- 프로필 이미지 추가 -->
				<div class="form-group">
					<label for="profile_image_uri">프로필 이미지</label> <input type="file"
						id="profileImage" name="profileImage"
						onchange="previewImage(event)">
					<div class="image-preview-container">
						<img id="profileImagePreview" src="" alt="프로필 이미지 미리보기"
							style="display: none; width: 100px; height: 100px; object-fit: cover; margin-top: 10px;">
					</div>
				</div>

				<button type="submit">가입하기</button>
				<div class="auth-links">
					이미 계정이 있으신가요? <a href="javascript:location='login';">로그인</a>
				</div>
			</form>
		</div>
	</div>
	<!-- 카카오 주소 API JS SDK 추가 -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// Daum 우편번호 API 호출 함수
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 주소 항목을 처리하는 부분

							// 도로명 주소
							var roadAddr = data.roadAddress;
							var extraRoadAddr = ''; // 참고 항목

							// 법정동명이 있을 경우 추가
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}

							// 건물명이 있을 경우, 공동주택인 경우 추가
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							// 참고 항목을 괄호 안에 넣기
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 폼 필드에 값 입력
							document.getElementById('postcode').value = data.zonecode; // 우편번호
							document.getElementById("roadAddress").value = roadAddr; // 도로명 주소
							document.getElementById("jibunAddress").value = data.jibunAddress; // 지번 주소

							// 참고 항목 추가
							if (roadAddr !== '') {
								document.getElementById("References").value = extraRoadAddr;
							} else {
								document.getElementById("References").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 예시 도로명 주소 및 지번 주소 표시
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open(); // 우편번호 검색 팝업 열기
		}

		document
				.getElementById('signupForm')
				.addEventListener(
						'submit',
						function(e) {
							let isValid = true;

							// 모든 에러 메시지 초기화
							document.getElementById('emailError').textContent = '';
							document.getElementById('passwordError').textContent = '';
							document.getElementById('confirmError').textContent = '';
							document.getElementById('phoneError').textContent = '';
							document.getElementById('birthError').textContent = '';
							document.getElementById('idcheck').textContent = '';

							// 이메일 검증
							const email = document.getElementById('email_id').value;
							const emailDomain = document
									.getElementById('email_domain').value;
							const emailFull = email + '@' + emailDomain;

							const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

							if (!emailFull || !emailRegex.test(emailFull)) {
								document.getElementById('emailError').textContent = '올바른 이메일 형식이 아닙니다';
								isValid = false;
							}

							// 비밀번호 검증
							const password = document
									.getElementById('password').value;
							if (password.length < 8) {
								document.getElementById('passwordError').textContent = '비밀번호는 8자 이상이어야 합니다';
								isValid = false;
							}

							// 비밀번호 확인 검증
							const confirmPassword = document
									.getElementById('password2').value;
							if (password !== confirmPassword) {
								document.getElementById('confirmError').textContent = '비밀번호가 일치하지 않습니다';
								isValid = false;
							}

							// 핸드폰 검증
							const phone01 = document.getElementById('phone01').value; // 선택된 값
							const phone02 = document.getElementById('phone02').value;
							const phone03 = document.getElementById('phone03').value;
							const phoneRegex = /^[0-9]{4}$/;

							if (phone02 === '' || phone03 === '') {
								document.getElementById('phoneError').textContent = '핸드폰 번호를 모두 입력해주세요';
								isValid = false;
							} else if (!phoneRegex.test(phone02)
									|| !phoneRegex.test(phone03)) {
								document.getElementById('phoneError').textContent = '핸드폰 번호가 올바르지 않습니다';
								isValid = false;
							}

							// 생년월일 검증
							const birthDate = document
									.getElementById('birth_date').value;
							const birthDateObj = new Date(birthDate);
							const today = new Date();
							today.setHours(0, 0, 0, 0); // 현재 날짜의 시간을 00:00:00으로 설정

							if (birthDateObj > today) {
								document.getElementById('birthError').textContent = '생년월일은 현재 날짜보다 미래일 수 없습니다.';
								isValid = false;
							}

							// 폼 검증에 실패한 경우 제출을 막고, 에러 메시지를 표시한 필드에만 에러 메시지를 추가
							if (!isValid) {
								e.preventDefault();
							}
						});

		function previewImage(event) {

			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('profileImagePreview');
				output.src = reader.result;
				output.style.display = 'block';
			};
			reader.readAsDataURL(event.target.files[0]);
		}

		function id_check() {
			$("#idcheck").hide();
			$loginId = $.trim($("#loginId").val());
			if ($loginId.length < 4) {
				$newtext = '<font color="red" size="3"><b>아이디는 4자 이상이어야 합니다.</b></font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append($newtext);
				$("#loginId").val('').focus();
				return false;
			}
			;
			if ($loginId.length > 12) {
				$newtext = '<font color="red" size="3"><b>아이디는12자 이하이어야 합니다.</b></font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append($newtext);
				$("#loginId").val('').focus();
				return false;
			}
			;
			if (!(validate_userid($loginId))) {
				$newtext = '<font color="red" size="3"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append($newtext);
				$("#loginId").val('').focus();
				return false;
			}
			;
			$
					.ajax({
						type : "POST",
						url : "signup_idcheck",
						data : {
							"id" : $loginId
						},
						datatype : "int",
						headers : {
							'X-CSRF-TOKEN' : $(
									'input[name="${_csrf.parameterName}"]')
									.val()
						// CSRF 토큰을 헤더에 포함
						},
						success : function(data) {
							if (data == 1) {
								$newtext = '<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
								$("#idcheck").text('');
								$("#idcheck").show();
								$("#idcheck").append($newtext);
								$("#loginId").val('').focus();
								return false;

							} else {
								$newtext = '<font color="blue" size="3"><b>사용가능한 아이디입니다.</b></font>';
								$("#idcheck").text('');
								$("#idcheck").show();
								$("#idcheck").append($newtext);
								$("#password").focus();
							}
						},
						error : function() {
							alert("data error");
						}
					});
		}

		function validate_userid($loginId) {
			var pattern = new RegExp(/^[a-z0-9_]+$/);//아이디를 영문소문
			//자와 숫자 와 _조합으로 처리
			return pattern.test($loginId);
		};

		function domain_list() {
			var s = document.forms['s']; // s 폼 객체를 가져와야 합니다.
			var num = s.mail_list.selectedIndex;

			// 선택된 값이 없으면 바로 반환
			if (num == -1) {
				return true;
			}

			// "직접입력"을 선택한 경우
			if (s.mail_list.value == "직접입력") {
				s.email_domain.value = ""; // 입력 필드를 비워두기
				s.email_domain.readOnly = false; // 사용자가 입력할 수 있도록 설정
				s.email_domain.focus(); // 포커스를 주어 사용자가 입력할 수 있게 함
			} else {
				s.email_domain.value = s.mail_list.options[num].value; // 선택된 값으로 이메일 도메인 설정
				s.email_domain.readOnly = true; // 수정 불가능하게 설정
			}
		}
	</script>
</body>
</html>

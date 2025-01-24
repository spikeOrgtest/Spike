<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SPIKE 카드 발급</title>
<link rel="stylesheet" href="/css/newmember.css" />
</head>
<body>
	<div class="container">
		<h1>SPIKE 카드 발급</h1>
		<form name="s" id="signupForm" action="/spike.com/card_ok"
			method="POST">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				
				<%
    // 세션에서 이미지 경로 가져오기
    String imagePath = (String) session.getAttribute("imagePath");
   
%>

<div style="text-align:center;">
    <img src="<%= imagePath %>" width="50%" height="100%"/>
</div>
				

			<div class="form-group">
				<label for="card_name">카드종류</label>
				<div class="card_container">
					<select id="card_name" name="card_name">
						<c:forEach var="type" items="${card_name}">
							<option value="${type}">${type}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group" id="product_select" class="hidden">
				<label for="product_type">세부상품</label>
				<div class="product_container">
					<select id="product_type" name="product_type">
					</select>
				</div>
			</div>
			
			<div>
				<label for="overseas_payment">해외결제</label>
					<div class="payment">
						<input type="radio" id="visa" name="option" value="visa"><label for="visa">VISA</label>
						<input type="radio" id="internal" name="option" value="in"><label for="in">국내전용</label>
					</div>
			</div>

			<div>
				<label for="transportation_card">후불교통카드</label>
					<div class="trans">
						<input type="radio" id="yes" name="option2" value="yes"><label for="yes">신청</label>
						<input type="radio" id="no" name="option2" value="no"><label for="no">신청안함</label>
					</div>
			</div>
			<input type="hidden" id="overseas_payment_value" name="overseas_payment" />
<input type="hidden" id="transportation_card_value" name="transportation_card" />
			

			<div class="form-group">
				<label for="password">비밀번호</label>
				<div class="password_container">
					<input type="password" id="card_password"
						name="card_password" required />
				</div>
				<p class="password-requirements">비밀번호는 6자 숫자를 사용해야 합니다.</p>
			</div>
			<div class="form-group">
				<label for="confirmPassword">비밀번호 확인</label>
				<div class="password_container">
					<input type="password" id="confirmPassword" name="confirmPassword"
						required />
				</div>
			</div>
			<div class="form-group checkbox">
				<input type="checkbox" id="termsAgreement" required /> <label
					for="termsAgreement"> <a href="#" id="termsLink">금융 서비스
						이용약관</a>에 동의합니다.
				</label>
			</div>
			<div class="form-group checkbox">
				<input type="checkbox" id="privacyAgreement" required /> <label
					for="privacyAgreement"> <a href="#" id="privacyLink">개인정보
						처리방침</a>에 동의합니다.
				</label>
			</div>
			<div>
				<button type="submit">카드 발급</button>
				<button type="button" onclick="location.href='../products'">취소</button>
			</div>
			<input type="hidden" id="card_number" name="card_number" />
		</form>
		<!-- 성공메시지는 alert 사용해서 띄우는 방향으로 수정하기. -->
		<div id="cardInfo" class="hidden">
			<p>카드가 성공적으로 개설되었습니다!</p>
			<p>
				귀하의 카드번호: <span id="cardNumber"></span>
			</p>
		</div>
		<p class="security-notice">⚠️ 보안 주의사항: 귀하의 개인정보 보호를 위해 공용 컴퓨터에서는
			사용을 자제해 주시기 바랍니다.</p>
	</div>
	<script src="/js/newCard.js"></script>

</body>
</html>

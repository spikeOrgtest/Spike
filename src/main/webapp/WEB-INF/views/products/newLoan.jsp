<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SPIKE 대출</title>
<link rel="stylesheet" href="/css/newmember.css" />
</head>
<body>
	<div class="container">
		<h1>SPIKE 대출</h1>
		<form name="s" id="signupForm" action="/spike.com/loan_ok"
			method="POST">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

			<div class="form-group">
				<label for="loan_name">대출종류</label>
				<div class="loan_container">
					<select id="loan_name" name="loan_name">
						<c:forEach var="type" items="${loan_name}">
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
				<button type="submit">대출 신청</button>
				<button type="button" onclick="location.href='../products'">취소</button>
			</div>
		</form>
		<!-- 성공메시지는 alert 사용해서 띄우는 방향으로 수정하기. -->
		<div id="loanInfo" class="hidden">
			<p>대출이 성공적으로 신청 되었습니다!</p>
		</div>
		
		<p class="security-notice">⚠️ 보안 주의사항: 귀하의 개인정보 보호를 위해 공용 컴퓨터에서는
			사용을 자제해 주시기 바랍니다.</p>
	</div>
	<script src="/js/newLoan.js"></script>

</body>
</html>

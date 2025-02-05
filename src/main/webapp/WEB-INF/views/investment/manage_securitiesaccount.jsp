<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>계좌 관리</title>
<link rel="stylesheet"
	href="/css/investment/manage_securitiesaccount.css">
</head>
<body>
	<div class="container">
		<h1>📂 계좌 관리</h1>

		<!-- 내 계좌 정보 -->
		<section class="account-info">
			<h2>내 계좌정보</h2>
			<p>
				<strong>계좌 번호:</strong> ${account.accountNumber}
			</p>
			<p>
				<strong>개설일:</strong> ${account.createdDate}
			</p>

			<!-- 계좌 비밀번호 변경 폼 -->
			<form
				action="${pageContext.request.contextPath}/spike.com/securities-account/manage/change-password"
				method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="hidden" name="accountId"
					value="${account.accountId}">

				<!-- 기존 비밀번호 입력 -->
				<label for="currentPassword">기존 비밀번호:</label> <input type="password"
					name="currentPassword" maxlength="6" required> <br />

				<!-- 새 비밀번호 입력 -->
				<label for="newPassword">새 비밀번호:</label> <input type="password"
					name="newPassword" maxlength="6" required> <br />

				<button type="submit">비밀번호 변경</button>
			</form>

			<!-- 계좌 삭제 폼 -->
			<form
				action="${pageContext.request.contextPath}/spike.com/securities-account/manage/delete"
				method="post" onsubmit="return validateDeleteForm();">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="hidden" name="accountId"
					value="${account.accountId}">

				<!--  비밀번호 입력 필드 -->
				<label for="currentPassword">비밀번호 입력:</label> <input type="password"
					name="currentPassword" id="currentPassword" maxlength="6" required
					pattern="\d{6}">

				<button type="submit" class="btn-delete">계좌 해지</button>
			</form>

			<!-- Flash 메시지 표시 -->
			<c:if test="${not empty errorMessage}">
				<script>
					alert("${errorMessage}");
				</script>
			</c:if>

			<c:if test="${not empty message}">
				<script>
					alert("${message}");
				</script>
			</c:if>

			<script>
				//  비밀번호 입력 검증
				function validateDeleteForm() {
					var password = document.getElementById("currentPassword").value;

					// 비밀번호가 6자리 숫자가 아닐 경우 경고
					if (!/^\d{6}$/.test(password)) {
						alert("비밀번호는 6자리 숫자여야 합니다.");
						return false;
					}

					// 계좌 해지 확인 메시지
					return confirm("정말 계좌를 삭제하시겠습니까?");
				}
			</script>
</body>
</html>

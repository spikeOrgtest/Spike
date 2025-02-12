<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 상세 관리</title>

<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/support/subpage.css">
<link rel="stylesheet" href="/css/manager/cheatDetail.css">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="subpageWrapper">
		<div class="subpage-main-container" style="justify-content: center;">
			<div class="subpage-content">
				<h2 style="margin-left: 50px;">계좌 관리</h2>
				<form action="UpdateAccount" method="post"
					onsubmit="return checkSelection()">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<input type="hidden" name="reportId" value="${reportId}">
					<div class="form-group">
						<label for="accountId">계좌 ID</label> <input type="text" id="accountId"
							name="accountId" value="${ag.accountId}" readonly>
					</div>

					<div class="form-group">
						<label for="accountType">계좌유형</label> <input type="text" id="accountType"
							value="${ag.accountType}" readonly>
					</div>

					<div class="form-group">
						<label for="productType">계좌상세유형</label> <input type="text" id="productType"
							value="${ag.productType}" readonly>
					</div>

					<div class="form-group">
						<label for="accountNumber">계좌번호</label> <input type="text"
							id="accountNumber" value="${ag.accountNumber}"
							readonly>
					</div>

					<div class="form-group">
						<label for="balance">잔액</label> <input type="text" id="balance"
							value="${ag.balance}" readonly>
					</div>
					<div class="form-group">
						<select name="accountState" id="accountStateSelect" data-accountState="${ag.accountState}">
							<option value="" disabled selected>${ag.accountState}(현재 상태)</option>
							<option value="ACTIVE">ACTIVE</option>
							<option value="BLOCK">BLOCK</option>
						</select>
					</div>
					<div class="form-group">
						<label for="list">거래 내역</label>
						<table>
							<thead>
								<tr>
									<th>거래 번호</th>
									<th>받는 사람</th>
									<th>보낸 사람</th>
									<th>이체 금액</th>
									<th>남은 금액</th>
									<th>메모</th>
									<th>거래 날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<td>${item.id}</td>
										<td>
										<c:set var="toAccountId" value="${item.toAccount.accountId}" /> 
											<c:forEach var="acc" items="${accounts}">
												<c:if test="${acc.accountId eq toAccountId}">
                   									 ${acc.accountNumber}
                								</c:if>
											</c:forEach>
										</td>
										<td>
										<c:set var="fromAccountId" value="${item.fromAccount.accountId}" />
											<c:forEach var="acc" items="${accounts}">
												<c:if test="${acc.accountId eq fromAccountId}">
                 								   ${acc.accountNumber}
               									 </c:if>
											</c:forEach>
										</td>
										<td>${item.amount}</td>
										<td>${item.afterBalance}</td>
										<td>${item.memo}</td>
										<td><fmt:formatDate value="${item.transactionDate}"
												pattern="yy/MM/dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="form-buttons">
						<button type="submit" name="status" value="COMPLETE" class="submit-btn">수락</button>
						<button type="submit" name="status" value="NEGATIVE" class="reset-btn">거절</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<%@ include file="../include/shortfooter.jsp"%>
</body>
<script>
	function checkSelection() {
		const accountStateSelect = document.getElementById('accountStateSelect');
		const accountState = accountStateSelect.getAttribute('data-accountState');
		if (accountStateSelect.value === "") {
			accountStateSelect.value = accountState;
		}
		return true;
	}
</script>

</html>
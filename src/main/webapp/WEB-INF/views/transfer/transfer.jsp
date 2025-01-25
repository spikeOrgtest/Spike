<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>이체/송금</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEJ6R2h2p7F8dU6n7hF5bC2Q0yOa2XrY8lX5Z5uZzZ5B5g5qzZf5q1tZz5Z5z"
	crossorigin="anonymous" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEJ6R2h2p7F8dU6n7hF5bC2Q0yOa2XrY8lX5Z5uZzZ5B5g5qzZf5q1tZz5Z5z"
	crossorigin="anonymous" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/transfer/transfer.css" rel="stylesheet" />
<link href="/css/include/include.css" rel="stylesheet">
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<div class="mm">
		<div class="test" id="wrapper">
			<!-- Page content wrapper-->
			<div id="page-content-wrapper">
				<!-- Main content-->
				<div class="container">
					<header class="text-center py-5">
						<div class="img-container">
							<!-- 이미지 배경 -->
							<img src="/images/transfer/transfer.jpg" class="opaque-image"
								alt="불투명도 이미지" />
						</div>
					</header>

					<main>
						<!-- 송금 섹션 -->
						<form action="/spike.com/transfer_ok"
							method="post" onsubmit="removeComma()">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<section class="transfer-container container">
								<!-- 출금계좌정보 -->
								<div class="transfer-section mb-5 p-4 border rounded shadow">
									<h3 class="mb-4">
										<i class="bi bi-wallet2"></i> 출금계좌정보
									</h3>
									<div class="mb-3">

										<label for="fromAccount" class="form-label">출금계좌 선택</label> <select
											class="form-select" id="fromAccount" name="fromAccountId" required
											onchange="updateAccountInfo()">
											<option value="" disabled selected>계좌를 선택하세요</option>
											<c:choose>
												<c:when test="${empty accountList}">
													<option value="" disabled>출금 가능한 계좌가 없습니다</option>
												</c:when>
												<c:otherwise>
													<c:forEach var="account" items="${accountList}">
														<option value="${account.account_id}"
															data-balance="${account.balance}"
															data-available="${account.day_limit}">
															${account.account_type}: ${account.account_number}</option>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</select>
									</div>
									<div class="row">
										<div class="col">
											<label class="form-label">일일한도금액</label>
											<div class="form-control bg-light" id="availableAmount">
												- 원</div>
										</div>
										<div class="col">
											<label class="form-label">잔액</label>
											<div class="form-control bg-light" id="balanceAmount">-
												원</div>
										</div>
									</div>
								</div>

								<!-- 입금계좌정보 -->
								<div class="transfer-section p-4 border rounded shadow">
									<h3 class="mb-4">
										<i class="bi bi-bank"></i> 입금계좌정보
									</h3>
									<div class="mb-3">
										<label for="depositBank" class="form-label">입금은행</label> <select
											class="form-select" id="depositBank" required>
											<option value="" disabled selected>은행을 선택하세요</option>
											<option value="SPIKE">SPIKE</option>

										</select>
									</div>
									<!-- 송금 폼 -->

									<div class="mb-3">
										<label for="toAccount" class="form-label">계좌번호</label> <input
											type="text" class="form-control" id="toAccount"
											name="toAccount" placeholder="'-' 없이 숫자만 입력" required />
									</div>
									<div class="mb-3">
										<label for="amount" class="form-label">이체금액</label> <input
											type="text" class="form-control" id="amount" name="amount"
											placeholder="금액을 입력하세요" required />
									</div>
									<div class="mb-3">
										<label for="note" class="form-label">이체메모(선택)</label> <input
											type="text" class="form-control" id="memo" name="memo"
											placeholder="메모를 입력하세요" />
									</div>
									<!-- 계좌 비밀번호 -->
									<div class="mb-3">
										<label for="accountPassword" class="form-label">계좌
											비밀번호</label> <input type="password" class="form-control"
											id="accountPassword" name="accountPassword"
											placeholder="계좌 비밀번호를 입력하세요" required />
									</div>

									<!-- 버튼 영역 -->
									<div class="text-end mt-4">
										<button type="submit" class="btn btn-primary">송금</button>
										<button type="reset" class="btn btn-secondary">취소</button>
									</div>

								</div>
							</section>
						</form>

						<!-- 송금 내역 -->

						<section class="transfer-history mt-5">
							<h4>
								<i class="bi bi-receipt"></i> 송금 내역
							</h4>
							<ul id="transferHistory" class="list-group"></ul>
						</section>
						<!-- 
						 -->
					</main>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/transfer/transfer.js"></script>
</body>
</html>

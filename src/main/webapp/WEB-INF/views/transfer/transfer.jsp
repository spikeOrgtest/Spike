<%@ page contentType="text/html; charset=UTF-8"%>
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
<link href="assets/css/transfer.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/include.css">
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<div class="d-flex" id="wrapper">
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Main content-->
			<div class="container">
				<header class="text-center py-5">
					<div class="img-container">
						<!-- 이미지 배경 -->
						<img src="assets/img/transfer/transfer.jpg" class="opaque-image"
							alt="불투명도 이미지" />
					</div>
				</header>

				<main>
					<!-- 송금 섹션 -->
					<section class="transfer-container container">
						<!-- 출금계좌정보 -->
						<div class="transfer-section mb-5 p-4 border rounded shadow">
							<h3 class="mb-4">
								<i class="bi bi-wallet2"></i> 출금계좌정보
							</h3>
							<div class="mb-3">
								<label for="fromAccount" class="form-label">출금계좌 선택</label> <select
									class="form-select" id="fromAccount" required
									onchange="updateAccountInfo()">
									<option value="" disabled selected>계좌를 선택하세요</option>
									<option value="123-4567-8901" data-balance="2345678"
										data-available="1234567">123-4567-8901</option>
									<option value="987-6543-2100" data-balance="3456789"
										data-available="2345678">987-6543-2100</option>
									<option value="456-7890-1234" data-balance="4567890"
										data-available="3456789">456-7890-1234</option>
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
									<div class="form-control bg-light" id="balanceAmount">- 원
									</div>
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
									<option value="우리은행">우리은행</option>
									<option value="국민은행">국민은행</option>
									<option value="신한은행">신한은행</option>
									<option value="하나은행">하나은행</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="toAccount" class="form-label">계좌번호</label> <input
									type="text" class="form-control" id="toAccount"
									placeholder="'-' 없이 숫자만 입력" required />
							</div>
							<div class="mb-3">
								<label for="amount" class="form-label">이체금액</label> <input
									type="text" class="form-control" id="amount"
									placeholder="금액을 입력하세요" required />
							</div>
							<div class="mb-3">
								<label for="note" class="form-label">이체메모(선택)</label> <input
									type="text" class="form-control" id="note"
									placeholder="메모를 입력하세요" />
							</div>
						</div>

						<!-- 버튼 영역 -->
						<div class="text-end mt-4">
							<button type="button" class="btsub">취소</button>
							<button type="button" class="btsub"
								onclick="completeTransfer()">송금</button>
						</div>
					</section>

					<!-- 송금 내역 -->
					<section class="transfer-history mt-5">
						<h4>
							<i class="bi bi-receipt"></i> 송금 내역
						</h4>
						<ul id="transferHistory" class="list-group"></ul>
					</section>
				</main>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="assets/js/transfer.js"></script>
</body>
</html>

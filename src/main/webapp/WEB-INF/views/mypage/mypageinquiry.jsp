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
<title>계좌조회</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="../../css/mypage/mypageinquiry.css" rel="stylesheet" />
<link href="../../css/mypage/sidebars.css" rel="stylesheet" />
<link href="../../css/include/include.css" rel="stylesheet" />
</head>

<body>
	<jsp:include page="../include/header.jsp" />
	<div class="mm">
		<div class="test" id="wrapper">
			<!-- 사이드바 -->
			<div class="flex-shrink-0 p-3 sidebar" style="width: 250px;">
				<a href="#"
					class="d-flex align-items-center pb-3 mb-0 link-dark text-decoration-none border-bottom">
					<svg class="bi me-2" width="30" height="24">
                    <use xlink:href="#bootstrap" />
                </svg> <span class="fs-5 fw-semibold">마이페이지</span>
				</a>
				<hr />
				<br />
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#home-collapse"
							aria-expanded="true">Home</button>
						<div class="collapse show" id="home-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a
									href="javascript:location='/spike.com/mypage/mypageEdit';"
									class="link-dark rounded">회원정보수정</a></li>
								<li><a
									href="javascript:location='/spike.com/mypage/inquiry';"
									class="link-dark rounded">나의 계좌</a></li>
								<li><a
									href="javascript:location='/spike.com/mypage/property';"
									class="link-dark rounded">자산조회</a></li>
								<li><a href="#" class="link-dark rounded">목표 금액 설정</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<!-- 페이지 내용 -->
			<div id="page-content-wrapper">
				<div class="container row g-0">
					<header class="text-center py-5">
						<div class="img-container">
							<img src="../../images/mypage/inquiry.jpg" class="opaque-image"
								alt="불투명도 이미지">
							<div class="text-overlay"></div>
						</div>
					</header>

					<main>
						<!-- 계좌 조회 섹션 -->
						<section class="account-inquiry-container container mt-5">
							<!-- 계좌 선택 및 정보 조회 -->
							<div class="account-section mb-5 p-4 border rounded shadow">
								<h3 class="mb-4">
									<i class="bi bi-wallet2"></i> 계좌 조회
								</h3>
								<div class="mb-3">
									<label for="accountSelect" class="form-label">계좌 선택</label> <select
										class="form-select" id="accountSelect" required
										onchange="updateAccountInfo()">
										<option value="" disabled selected>계좌를 선택하세요</option>
										<c:forEach var="item" items="${list}">
											<option value="${item.accountNumber}:${item.accountType}"
												data-balance="${item.balance}"
												data-available="${item.balance}">
												${item.accountNumber}:${item.accountType}</option>
										</c:forEach>

									</select>
								</div>

								<div class="row">
									<div class="col">
										<label class="form-label">잔액</label>
										<div class="form-control bg-light" id="balanceAmount">-

											원</div>
									</div>
									<div class="col">
										<label class="form-label">일일한도</label>
										<div class="form-control bg-light" id="daylimit">- 원</div>
									</div>
									<div class="col">
										<label class="form-label">1회한도</label>
										<div class="form-control bg-light" id="onelimit">- 원</div>
									</div>
								</div>
							</div>

							<div class="p-4 border rounded shadow">
								<div class="transaction-filter mb-4 ">
									<h3 class="mb-4">
										<i class="bi bi-calendar"></i> 거래 내역 검색
									</h3>
									<div class="row g-3">
										<!-- 시작 날짜 -->
										<div class="col-md-6">
											<label for="startDate" class="form-label">시작일</label>
											<div class="input-group">
												<input type="date" class="form-control" id="startDate" />
											</div>
										</div>
										<!-- 종료 날짜 -->
										<div class="col-md-6">
											<label for="endDate" class="form-label">종료일</label>
											<div class="input-group">
												<input type="date" class="form-control" id="endDate" />
											</div>
										</div>
									</div>
									<div class="mt-3 text-end">
										<button class="btn btn-secondary" id="filterBtn"
											onclick="filterTransactionHistory()">검색</button>
									</div>
									<!-- 최근 거래 내역 -->
									<div id="transactionHistoryContainer"
										class="transaction-history p-4 border rounded shadow"
										style="display: none;">
										<h3 class="mb-4">
											<i class="bi bi-receipt"></i> 최근 거래 내역
										</h3>
										<ul id="transactionHistory" class="list-group">
											<!-- 거래 내역은 JavaScript에서 동적으로 추가됩니다 -->
										</ul>
									</div>
									<p id="noTransactionsMessage" class="text-danger"
										style="display: none;">검색된 거래 내역이 없습니다.</p>
								</div>
							</div>
						</section>

						<div class="settings-container p-4 border rounded shadow mt-4">
							<div class="d-flex justify-content-between">
								<!-- 일일 출금 한도 설정 -->
								<div class="setting-box p-3 w-48">
									<h4>일일 출금 한도 설정</h4>
									<p>계좌의 일일 출금 한도를 설정하여 안전하게 관리하세요.</p>
									<button class="btn btn-secondary" id="setLimitBtn"
										data-bs-toggle="modal" data-bs-target="#dailyLimitModal">설정</button>
								</div>

								<!-- 계좌 비밀번호 변경 -->
								<div class="setting-box p-3 w-48">
									<h4>계좌 비밀번호 변경</h4>
									<p>계좌의 비밀번호를 변경하여 보안을 강화하세요.</p>
									<button class="btn btn-secondary" id="changePasswordModalBtn"
										data-bs-toggle="modal" data-bs-target="#passwordChangeModal">변경</button>
								</div>
							</div>
						</div>

						<!-- 일일 출금 한도 설정 모달 -->
						<div class="modal fade" id="dailyLimitModal" tabindex="-1"
							aria-labelledby="dailyLimitModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="dailyLimitModalLabel">출금 한도
											설정</h4>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form id="limit" action="inquiryLimit" method="post">
										<input type="hidden" name="${_csrf.parameterName}"
																value="${_csrf.token}" />
											<div class="form-group">
												<label for="dayLimitInput" style="margin-bottom: 20px;">일일
													한도 금액 (₩)</label> <input type="text" class="form-control"
													id="dayLimitInput" placeholder="출금 한도를 입력하세요" name="day_limit"
													style="margin-bottom: 20px;" />
											</div>
											<div class="form-group">
												<label for="oneLimitInput" style="margin-bottom: 20px;">1회
													한도 금액 (₩)</label> <input type="text" class="form-control" name="one_limit"
													id="oneLimitInput" style="margin-bottom: 20px;" placeholder="출금 한도를 입력하세요" />
											</div>
											<input type="hidden" id="selectedAccountNumber1" name="accountNumber" value="" />
											<button type="reset" class="btn btn-secondary"
												data-bs-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-secondary"
												id="saveLimitBtn" onclick="limitChange()">저장</button>
										</form>
									</div>
								</div>
							</div>
						</div>

						<!-- 계좌 비밀번호 변경 모달 -->
						<div class="modal fade" id="passwordChangeModal" tabindex="-1"
							aria-labelledby="passwordChangeModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="passwordChangeModalLabel">계좌
											비밀번호 변경</h4>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form action="inquiryPassword" method="post" id="passwordChangeForm">
										<input type="hidden" name="${_csrf.parameterName}"
																value="${_csrf.token}" />
											<div class="mb-3">
												<label for="currentPassword" class="form-label">현재
													비밀번호</label> <input type="password" class="form-control"
													id="currentPassword" name="currentPassword" required />
											</div>
											<div class="mb-3">
												<label for="newPassword" class="form-label">새 비밀번호</label> <input
													type="password" class="form-control" id="newPassword" name="account_password"
													required />
													<input type="hidden" id="selectedAccountNumber2" name="accountNumber" value="" />
											</div>
											<div class="mb-3">
												<label for="confirmPassword" class="form-label">새
													비밀번호 확인</label> <input type="password" class="form-control"
													id="confirmPassword" required />
											</div>
										<button type="reset" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-secondary"
											id="changePasswordBtn" onclick="changePassword()">비밀번호
											변경</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</main>
				</div>
			</div>
		</div>
	</div>
	<br />
	<jsp:include page="../include/footer.jsp" />

	<!-- Bootstrap JS, Chart.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="../../js/mypage/mypageinquiry.js"></script>
	<script src="../../js/mypage/sidebars.js"></script>

	<script>
		// 계좌 데이터 전달을 위한 JavaScript 변수 생성
		const accountData = {};
		<c:forEach var="item" items="${list}">
		accountData["${item.accountNumber}:${item.accountType}"] = {
			balance : "${item.balance}",
			daylimit : "${item.dayLimit}",
			onelimit : "${item.oneLimit}",
			transactions : [ {
				date : "2024-11-28",
				type : "출금",
				amount : 500000,
				destination : "증권"
			}, {
				date : "2024-11-27",
				type : "입금",
				amount : 200000,
				source : "급여"
			}, {
				date : "2024-11-26",
				type : "출금",
				amount : 300000,
				destination : "편의점"
			} ]
		};
		</c:forEach>
	</script>
</body>

</html>

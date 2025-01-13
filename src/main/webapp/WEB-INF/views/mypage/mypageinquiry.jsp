<%@ page contentType="text/html; charset=UTF-8"%>
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
<link href="assets/css/mypage/mypageinquiry.css" rel="stylesheet" />
<link href="assets/css/mypage/sidebars.css" rel="stylesheet" />
<link href="assets/css/include.css" rel="stylesheet" />
</head>

<body>
	<jsp:include page="include/header.jsp" />
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
								<li><a href="mypageEdit.jsp" class="link-dark rounded">회원정보수정</a></li>
								<li><a href="mypageinquiry.jsp" class="link-dark rounded">나의 계좌</a></li>
								<li><a href="mypageproperty.jsp" class="link-dark rounded">자산조회</a></li>
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
							<img src="assets/img/mypage/inquiry.jpg" class="opaque-image"
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
										<option value="123-4567-8901:일반" data-balance="2345678"
											data-available="1234567">123-4567-8901:일반</option>
										<option value="987-6543-2100:mini" data-balance="3456789"
											data-available="2345678">987-6543-2100:mini</option>
										<option value="456-7890-1234:증권" data-balance="4567890"
											data-available="3456789">456-7890-1234:증권</option>
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
										<div class="form-control bg-light" id="availableAmount">
											- 원</div>
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
										<h5 class="modal-title" id="dailyLimitModalLabel">일일 출금
											한도 설정</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label for="dailyLimitInput">최대 출금 금액 (₩)</label> <input
												type="text" class="form-control" id="dailyLimitInput"
												placeholder="출금 한도를 입력하세요" />
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn btn-secondary"
											id="saveLimitBtn">저장</button>
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
										<h5 class="modal-title" id="passwordChangeModalLabel">계좌
											비밀번호 변경</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form id="passwordChangeForm">
											<div class="mb-3">
												<label for="currentPassword" class="form-label">현재
													비밀번호</label> <input type="password" class="form-control"
													id="currentPassword" required />
											</div>
											<div class="mb-3">
												<label for="newPassword" class="form-label">새 비밀번호</label> <input
													type="password" class="form-control" id="newPassword"
													required />
											</div>
											<div class="mb-3">
												<label for="confirmPassword" class="form-label">새
													비밀번호 확인</label> <input type="password" class="form-control"
													id="confirmPassword" required />
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn btn-secondary"
											id="changePasswordBtn" onclick="changePassword()">비밀번호
											변경</button>
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
	<jsp:include page="include/footer.jsp" />

	<!-- Bootstrap JS, Chart.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="assets/js/mypage/mypageinquiry.js"></script>
	<script src="assets/js/mypage/sidebars.js"></script>
</body>

</html>

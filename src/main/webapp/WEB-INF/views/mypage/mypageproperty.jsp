<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>자산조회</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="assets/css/mypage/mypageproperty.css" rel="stylesheet" />
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
								<li><a href="mypageinquiry.jsp" class="link-dark rounded">나의
										계좌</a></li>
								<li><a href="mypageproperty.jsp" class="link-dark rounded">자산조회</a></li>
								<li><a href="#" class="link-dark rounded">목표 금액 설정</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<div id="page-content-wrapper">
				<div class="container row g-0">
					<header class="text-center py-5">
						<div class="img-container">
							<img src="assets/img/mypage/property.jpg" class="opaque-image"
								alt="불투명도 이미지">
							<div class="text-overlay"></div>
						</div>
					</header>

					<main>
						<!-- 자산 요약 섹션 -->
						<section class="container my-5 section-box">
							<h2>자산 요약</h2>
							<div class="asset-summary">
								<!-- 총 자산 카드 -->
								<div class="card">
									<div class="card-header">총 자산</div>
									<div class="card-body">
										<h5 class="card-title">₩10,000,000</h5>
										<p class="card-text">현재 보유하고 있는 자산의 총 합계입니다.</p>
									</div>
								</div>
								<!-- 투자 자산 카드 -->
								<div class="card">
									<div class="card-header">투자 자산</div>
									<div class="card-body">
										<h5 class="card-title">₩7,500,000</h5>
										<p class="card-text">현재 투자 중인 자산의 합계입니다.</p>
									</div>
								</div>
								<!-- 현금 자산 카드 -->
								<div class="card">
									<div class="card-header">현금 자산</div>
									<div class="card-body">
										<h5 class="card-title">₩2,500,000</h5>
										<p class="card-text">현재 보유한 현금 자산의 합계입니다.</p>
									</div>
								</div>
							</div>
						</section>
						<!-- 대출 현황 섹션 -->
						<section class="container my-5 section-box loan-summary">
							<h2>대출 현황</h2>
							<div class="asset-summary">
								<!-- 대출 잔액 카드 -->
								<div class="card">
									<div class="card-header">대출 잔액</div>
									<div class="card-body">
										<h5 class="card-title">₩3,000,000</h5>
										<p class="card-text">현재 남은 대출 잔액입니다.</p>
									</div>
								</div>
								<!-- 대출 이자율 카드 -->
								<div class="card">
									<div class="card-header">대출 이자율</div>
									<div class="card-body">
										<h5 class="card-title">3.5%</h5>
										<p class="card-text">현재 대출의 이자율입니다.</p>
									</div>
								</div>
								<!-- 대출 잔여 기간 카드 -->
								<div class="card">
									<div class="card-header">잔여 기간</div>
									<div class="card-body">
										<h5 class="card-title">5년 3개월</h5>
										<p class="card-text">대출의 잔여 상환 기간입니다.</p>
									</div>
								</div>
							</div>
							<!-- 상세 내역 버튼 -->
							<div class="text-center mt-3">
								<button type="button" class="btn btn-secondary"
									data-bs-toggle="modal" data-bs-target="#loanModal">대출
									상세 내역 보기</button>
							</div>
						</section>

						<!-- 대출 상세 모달 -->
						<div class="modal fade" id="loanModal" tabindex="-1"
							aria-labelledby="loanModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="loanModalLabel">대출 상세 내역</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<h5>대출 상세 정보</h5>
										<ul>
											<li><strong>대출금액:</strong> ₩3,000,000</li>
											<li><strong>이자율:</strong> 3.5%</li>
											<li><strong>잔여 기간:</strong> 5년 3개월</li>
											<li><strong>상환 방식:</strong> 월 상환</li>
											<li><strong>매월 상환액:</strong> ₩50,000</li>
											<li><strong>다음 상환일:</strong> 2024-12-25</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<!-- 예/적금 현황 섹션 -->
						<section class="container my-5 section-box savings-summary">
							<h2>예/적금 현황</h2>
							<div class="asset-summary">
								<!-- 예금 카드 -->
								<div class="card">
									<div class="card-header">예금 잔액</div>
									<div class="card-body">
										<h5 class="card-title">₩1,000,000</h5>
										<p class="card-text">예금 금액과 이자율입니다.</p>
									</div>
								</div>
								<!-- 적금 카드 -->
								<div class="card">
									<div class="card-header">적금 잔액</div>
									<div class="card-body">
										<h5 class="card-title">₩500,000</h5>
										<p class="card-text">적금 금액과 만기일입니다.</p>
									</div>
								</div>
								<!-- 예금 이자율 카드 -->
								<div class="card">
									<div class="card-header">이자율</div>
									<div class="card-body">
										<h5 class="card-title">2.5%</h5>
										<p class="card-text">예/적금의 이자율입니다.</p>
									</div>
								</div>
							</div>
							<!-- 상세 내역 버튼 -->
							<div class="text-center mt-3">
								<button type="button" class="btn btn-secondary"
									data-bs-toggle="modal" data-bs-target="#savingsModal">예/적금
									상세 내역 보기</button>
							</div>
						</section>

						<!-- 예/적금 상세 모달 -->
						<div class="modal fade" id="savingsModal" tabindex="-1"
							aria-labelledby="savingsModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="savingsModalLabel">예/적금 상세 내역</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<h5>예금 상세 정보</h5>
										<ul>
											<li><strong>예금금액:</strong> ₩1,000,000</li>
											<li><strong>이자율:</strong> 2.5%</li>
											<li><strong>만기일:</strong> 2025-12-25</li>
											<li><strong>예금 유형:</strong> 정기예금</li>
										</ul>

										<h5>적금 상세 정보</h5>
										<ul>
											<li><strong>적금금액:</strong> ₩500,000</li>
											<li><strong>이자율:</strong> 2.0%</li>
											<li><strong>만기일:</strong> 2026-06-25</li>
											<li><strong>적금 유형:</strong> 월납 적금</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<!-- 거래 내역 섹션 -->
						<section class="container my-5 section-box">
							<h2>최근 거래 내역</h2>
							<div class="table-responsive">
								<table class="table table-striped">
									<thead class="thead-dark">
										<tr>
											<th>거래일</th>
											<th>상세 내용</th>
											<th>금액</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>2024-11-25</td>
											<td>투자상품 A 매수</td>
											<td>₩1,000,000</td>
											<td><span>완료</span></td>
										</tr>
										<tr>
											<td>2024-11-20</td>
											<td>금융상품 B 매도</td>
											<td>₩500,000</td>
											<td><span>취소</span></td>
										</tr>
										<tr>
											<td>2024-11-15</td>
											<td>투자상품 C 매수</td>
											<td>₩2,000,000</td>
											<td><span>진행 중</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</section>

						<!-- 자산 추이 그래프 섹션 -->
						<section class="container my-5 section-box">
							<h2>자산 추이</h2>
							<div class="row">
								<div class="col-md-12">
									<canvas id="assetChart"></canvas>
								</div>
							</div>
						</section>
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
	<script src="assets/js/mypage/mypageproperty.js"></script>
	<script src="assets/js/mypage/sidebars.js"></script>
</body>

</html>

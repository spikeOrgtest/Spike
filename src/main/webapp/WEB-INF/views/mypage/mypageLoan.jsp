<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출정보</title>
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
									href="javascript:location='/spike.com/mypage/main';"
									class="link-dark rounded">메인</a></li>
								<li><a
									href="javascript:location='/spike.com/mypage/inquiry';"
									class="link-dark rounded">나의 계좌</a></li>
								<li><a
									href="javascript:location='/spike.com/mypage/property';"
									class="link-dark rounded">자산조회</a></li>
								<li><a href="javascript:location='/spike.com/mypage/loan';"
									class="link-dark rounded">목표 금액 설정</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<!-- 대출 현황 섹션 -->
			<main>
				<section class="container my-5 section-box loan-summary">
					<h2>대출 상환</h2>
					<div class="asset-summary">
						<div class="card">
							<div class="card-header">신청 내역</div>
							<div class="card-body">
								<h5 class="card-title">여기에 대출상품명 가져오기.</h5>
								<p class="card-text">여기에 상태표시 가져오기. (신청중 이런거)</p>
							</div>
						</div>
						<!-- 대출 잔액 카드 -->
						<div class="card">
							<div class="card-header">대출 잔액</div>
							<div class="card-body">
								<h5 class="card-title">₩3,000,000(대출금액 가져오기.)</h5>
								<p class="card-text">현재 남은 대출 잔액입니다.</p>
							</div>
						</div>
						<!-- 대출 이자율 카드 -->
						<div class="card">
							<div class="card-header">대출 상품명</div>
							<div class="card-body">
								<h5 class="card-title">비상금 대출(대출상품명 가져오기.)</h5>
								<p class="card-text">현재 대출상품입니다.</p>
							</div>
						</div>
						<!-- 대출 잔여 기간 카드 -->
						<div class="card">
							<div class="card-header">잔여 기간</div>
							<div class="card-body">
								<h5 class="card-title">5년 3개월(상환기간 가져오기.)</h5>
								<p class="card-text">대출의 잔여 상환 기간입니다.</p>
							</div>
						</div>
					</div>
					<!-- 상세 내역 버튼 -->
					<div class="text-center mt-3">
						<button type="button" class="btn btn-secondary"
							data-bs-toggle="modal" data-bs-target="#loanModal">대출 상세
							내역 보기</button>
					</div>
				</section>
			</main>

		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
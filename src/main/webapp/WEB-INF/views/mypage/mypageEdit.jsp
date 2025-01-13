<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원정보수정</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="assets/css/mypage/mypageEdit.css" rel="stylesheet" />
<link href="assets/css/mypage/sidebars.css" rel="stylesheet" />
<link href="assets/css/include.css" rel="stylesheet" />

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
							<img src="assets/img/mypage/edit.jpg" class="opaque-image"
								alt="불투명도 이미지">
							<div class="text-overlay"></div>
						</div>
					</header>
					<main>
						<div class="container py-5">
							<h2 class="text-center mb-4">회원 정보 수정</h2>
							<form action="#" method="POST">

								<div class="row mb-3">
									<label for="name" class="col-sm-2 col-form-label">이름</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="이름을 입력하세요">
									</div>
								</div>

								<div class="row mb-3">
									<label for="email" class="col-sm-2 col-form-label">이메일</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="이메일을 입력하세요">
									</div>
								</div>

								<div class="row mb-3">
									<label for="phone" class="col-sm-2 col-form-label">전화번호</label>
									<div class="col-sm-10">
										<input type="tel" class="form-control" id="phone" name="phone"
											placeholder="전화번호를 입력하세요">
									</div>
								</div>

								<div class="row mb-3">
									<label for="address" class="col-sm-2 col-form-label">주소</label>
									<div class="address-form">
										<input type="text" class="address" id="sample4_postcode"
											placeholder="우편번호"> <input type="button"
											class="address-button" onclick="sample4_execDaumPostcode()"
											value="우편번호 찾기"><br> <input type="text"
											class="address" id="sample4_roadAddress" placeholder="도로명주소">
										<input type="text" class="address" id="sample4_jibunAddress"
											placeholder="지번주소"> <span id="guide"
											style="color: #999; display: none"></span> <input type="text"
											class="address-full" id="sample4_detailAddress"
											placeholder="상세주소"> <input type="text"
											class="address-full" id="sample4_extraAddress"
											placeholder="참고항목">
									</div>
								</div>

								<div class="row mb-3">
									<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="password"
											name="password" placeholder="새 비밀번호를 입력하세요">
									</div>
								</div>

								<div class="row mb-3">
									<label for="confirm_password" class="col-sm-2 col-form-label">비밀번호
										확인</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											id="confirm_password" name="confirm_password"
											placeholder="비밀번호를 확인하세요">
									</div>
								</div>

								<div class="d-flex justify-content-end">
									<button type="submit" class="btn btn-secondary w-25 me-2">수정
										완료</button>
									<button type="reset" class="btn btn-secondary w-25 h-25">취소</button>
								</div>
							</form>

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
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="assets/js/mypage/mypageEdit.js"></script>
	<script src="assets/js/mypage/sidebars.js"></script>
</body>

</html>
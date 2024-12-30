<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>마이페이지</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="assets/css/mypageMain.css" rel="stylesheet" />
<link href="assets/css/include.css" rel="stylesheet"/>
</head>

<body>
	
	<jsp:include page="../include/header.jsp"/>
	
	<div class="d-flex" id="wrapper">
		<div id="page-content-wrapper">
			<div class="container row g-0">
				<header class="text-center py-5">
					<div class="img-container">
						<img src="assets/img/mypage/mypage.jpg" class="opaque-image"
							alt="불투명도 이미지">
						<div class="text-overlay"></div>
					</div>
				</header>
				<main>
					
					<section class="user-info py-5">
						<div class="container">
							<div class="row">
								<div class="col-md-4">
									<div class="card">
										<img src="assets/img/mypage/profile.jpg" class="card-img-top"
											alt="프로필 이미지">
										<div class="card-body">
											<h5 class="card-title">사용자 이름</h5>
											<p class="card-text">사용자 이메일: user@example.com</p>
											<p class="card-text">가입일: 2022-03-15</p>
											<button class="btn btn-primary" data-bs-toggle="modal"
												data-bs-target="#editProfileModal">프로필 수정</button>
										</div>
									</div>
								</div>
								<div class="col-md-8">
									<h2>최근 활동</h2>
									<ul class="list-group">
										<li class="list-group-item"><strong>2024-11-28:</strong>
											금융상품 A에 투자 완료</li>
										<li class="list-group-item"><strong>2024-11-20:</strong>
											투자 관련 문의</li>
										<li class="list-group-item"><strong>2024-11-10:</strong>
											계좌 정보 변경</li>
										<li class="list-group-item"><strong>2024-11-30:</strong>
											금융상품 B에 투자 완료</li>
										<li class="list-group-item"><strong>2024-11-25:</strong>
											월간 투자 리포트 확인</li>
										<li class="list-group-item"><strong>2024-11-18:</strong>
											새로운 결제 수단 등록</li>
										<li class="list-group-item"><strong>2024-11-15:</strong>
											이전 투자 상품 만기</li>
										<li class="list-group-item"><strong>2024-11-12:</strong>
											투자 포트폴리오 재조정</li>
										<li class="list-group-item"><strong>2024-11-05:</strong>
											연금 상품 가입</li>
										<li class="list-group-item"><strong>2024-11-03:</strong>
											자동 이체 설정 완료</li>
										<li class="list-group-item"><strong>2024-10-30:</strong>
											금융상품 C에 부분 청산</li>
										<li class="list-group-item"><strong>2024-10-28:</strong>
											계좌 인증 절차 완료</li>
									</ul>
								</div>
							</div>
						</div>
					</section>

					
					<section class="settings py-5 bg-light">
						<div class="container">
							<h2>설정</h2>
							<div class="row">
								
								<div class="col-md-6">
									<div class="card d-flex align-items-stretch">
										<div class="card-header">알림 설정</div>
										<div class="card-body">
											<p>사용자에게 중요한 알림을 이메일로 받을지 선택하세요.</p>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value=""
													id="emailNotifications"> <label
													class="form-check-label" for="emailNotifications">
													이메일 알림 받기 </label>
												<div id="notificationStatus" class="mt-2 text-muted"></div>
											</div>
										</div>
									</div>
								</div>

								
								<div class="col-md-6">
									<div class="card d-flex align-items-stretch"
										style="min-height: 152px;">
										<div class="card-header">계좌 정보 수정</div>
										<div class="card-body" style="margin-top: 15px;">
											<a href="#accountInfo" class="btn btn-primary">계좌 정보 수정</a>
										</div>
									</div>
								</div>

								
								<div class="col-md-6 mt-4">
									<div class="card d-flex align-items-stretch">
										<div class="card-header">2단계 인증 설정</div>
										<div class="card-body">
											<a href="#twoFactor" class="btn btn-warning">2단계 인증 설정</a>
										</div>
									</div>
								</div>

								
								<div class="col-md-6 mt-4">
									<div class="card d-flex align-items-stretch">
										<div class="card-header">로그아웃</div>
										<div class="card-body">
											<button class="btn btn-danger" onclick="logout()">로그아웃</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

					
					<section class="help py-5">
						<div class="container">
							<h2>도움이 필요하신가요?</h2>
							<p>금융상품에 대해 더 궁금한 사항이 있으면 고객센터로 문의주세요.</p>
							<a href="#contact" class="btn btn-info">고객센터 연락하기</a>
						</div>
					</section>

					<%-- 프로필 모달 --%>
					
					<div class="modal fade" id="editProfileModal" tabindex="-1"
						aria-labelledby="editProfileModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="editProfileModalLabel">프로필 수정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form id="editProfileForm">
										<div class="mb-3">
											<label for="userName" class="form-label">사용자 이름</label> <input
												type="text" class="form-control" id="userName"
												value="사용자 이름">
										</div>
										<div class="mb-3">
											<label for="userEmail" class="form-label">이메일</label> <input
												type="email" class="form-control" id="userEmail"
												value="user@example.com">
										</div>
										<div class="mb-3">
											<label for="userPassword" class="form-label">비밀번호</label> <input
												type="password" class="form-control" id="userPassword"
												value="********">
										</div>
										<button type="submit" class="btn btn-primary">저장</button>
									</form>
								</div>
							</div>
						</div>
					</div>

				</main>
			</div>
		</div>
	</div>
	
		<jsp:include page="../include/footer.jsp"/>
	

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="assets/js/mypageMain.js"></script>


</body>

</html>
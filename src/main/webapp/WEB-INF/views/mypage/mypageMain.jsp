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
<link href="assets/css/mypage/mypageMain.css" rel="stylesheet" />
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
							<img src="assets/img/mypage/mypage.jpg" class="opaque-image"
								alt="불투명도 이미지">
							<div class="text-overlay"></div>
						</div>
					</header>
					<main>
						<!-- 사용자 정보 섹션 -->
						<section class="user-info py-5">
							<div class="container">
								<div class="row">
									<div class="col-md-4">
										<div class="card">
											<img src="assets/img/mypage/profile.jpg" class="card-img-top"
												alt="프로필 이미지">
											<div class="card-body">
												<button class="btn btn-primary" style="width: 100%"
													data-bs-toggle="modal" data-bs-target="#editProfileModal">프로필
													수정</button>
											</div>
										</div>
									</div>
									<div class="col-md-8">
										<h2>개인정보</h2>
										<ul class="list-group">
											<li class="list-group-item"><strong>사용자 이름:</strong> 사용자
												이름</li>
											<li class="list-group-item"><strong>이메일:</strong>
												user@example.com</li>
											<li class="list-group-item"><strong>가입일:</strong>
												2022-03-15</li>
											<li class="list-group-item"><strong>전화번호:</strong>
												010-1234-5678</li>
											<li class="list-group-item"><strong>주소:</strong> 서울시 강남구
												테헤란로 123</li>
											<li class="list-group-item"><strong>생년월일:</strong>
												1990-01-01</li>
											<li class="list-group-item"><strong>성별:</strong> 남성</li>
										</ul>
									</div>

								</div>
							</div>
						</section>

						<!-- 설정 섹션 -->
						<section class="settings py-5 bg-light">
							<div class="container">
								<h2>설정</h2>
								<div class="row">
									<!-- 중요 알림 설정 카드 -->
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

									<!-- 목표 금액 알림 설정 카드 -->
									<div class="col-md-6">
										<div class="card d-flex align-items-stretch">
											<div class="card-header">목표 금액 알림 설정</div>
											<div class="card-body">
												<p>설정하신 목표 금액보다 잔고가 줄어들시 알림을 받을지 선택하세요.</p>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value=""
														id="goalAmountNotifications"> <label
														class="form-check-label" for="goalAmountNotifications">
														알림 받기 </label>
													<div id="goalNotificationStatus" class="mt-2 text-muted"></div>
												</div>
											</div>
										</div>
									</div>

									<!-- 계좌 정보 수정 카드 -->
									<div class="col-md-6">
										<div class="card d-flex align-items-stretch"
											style="min-height: 152px;">
											<div class="card-header">계좌 정보 수정</div>
											<div class="card-body" style="margin-top: 15px;">
												<p>여기서 계좌 정보를 수정하실 수 있습니다. 비밀번호 변경이나 결제 수단 업데이트도 가능합니다.</p>
												<a href="#accountInfo" class="btn btn-secondary">계좌 정보
													수정</a>
											</div>
										</div>
									</div>

									<!-- 2단계 인증 카드 -->
									<div class="col-md-6 mt-4">
										<div class="card d-flex align-items-stretch">
											<div class="card-header">2단계 인증 설정</div>
											<div class="card-body">
												<p>계정의 보안을 강화하려면 2단계 인증을 설정하세요. 계정을 보호하기 위해 필요한 추가적인 인증
													절차입니다.</p>
												<a href="#twoFactor" class="btn btn-secondary">2단계 인증 설정</a>
											</div>
										</div>
									</div>

									<!-- 로그아웃 카드 -->
									<div class="col-md-6 mt-4">
										<div class="card d-flex align-items-stretch">
											<div class="card-header">로그아웃</div>
											<div class="card-body">
												<p>현재 계정에서 로그아웃하려면 아래 버튼을 클릭하세요. 로그아웃 후 다시 로그인하려면 인증이
													필요합니다.</p>
												<button class="btn btn-secondary" onclick="logout()">로그아웃</button>
											</div>
										</div>
									</div>

									<!-- 탈퇴하기 카드 -->
									<div class="col-md-6 mt-4">
										<div class="card d-flex align-items-stretch">
											<div class="card-header">탈퇴하기</div>
											<div class="card-body">
												<p>회원 탈퇴 시 모든 계정 정보와 연결된 데이터가 삭제됩니다. 탈퇴 후 계정 복구는 불가능합니다.
													신중히 결정하세요.</p>
												<button class="btn btn-secondary" id="openWithdrawalModal">탈퇴하기</button>
											</div>
										</div>
									</div>

								</div>
							</div>
						</section>

						<!-- 도움말 섹션 -->
						<section class="help py-5">
							<div class="container">
								<h2>도움이 필요하신가요?</h2>
								<p>금융상품에 대해 더 궁금한 사항이 있으면 고객센터로 문의주세요.</p>
								<a href="#contact" class="btn btn-secondary">고객센터 연락하기</a>
							</div>
						</section>



						<!-- 탈퇴 모달 -->
						<div class="modal fade" id="withdrawalModal" tabindex="-1"
							aria-labelledby="withdrawalModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="withdrawalModalLabel">회원탈퇴</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<!-- 회원탈퇴 섹션을 모달 안에 포함 -->
										<div class="container">
											<h2 class="text-center mb-4" style="color: red">회원탈퇴</h2>
											<p class="text-center mb-4 text-muted">회원탈퇴를 진행하기 전에 아래의
												주의사항을 확인해주세요. 탈퇴 후 계정 복구는 불가능합니다.</p>

											<!-- 주의사항 -->
											<div class="alert alert-warning text-start">
												<ul style="padding: 10px">
													<li>회원탈퇴 시 모든 데이터가 삭제됩니다.</li>
													<li>연결된 금융 계좌 및 거래 기록도 함께 삭제됩니다.</li>
													<li>계정을 복구할 수 없으며 동일 이메일로 재가입이 제한될 수 있습니다.</li>
												</ul>
											</div>

											<!-- 확인 질문 -->
											<div class="my-4">
												<h5 class="text-center">계속 진행하시겠습니까?</h5>
												<p class="text-center text-muted">
													계정을 삭제하려면 아래 확인란에 체크한 후 <strong style="color: red">"탈퇴하기"</strong>
													버튼을 클릭해주세요.
												</p>
											</div>

											<!-- 탈퇴 확인 폼 -->
											<form id="withdrawal-form" class="text-center">
												<div class="form-check mb-3">
													<input class="form-check-input" type="checkbox"
														id="confirmCheck"> <label
														class="form-check-label memberout" for="confirmCheck">
														회원탈퇴에 따른 모든 내용을 확인하였으며, 이에 동의합니다. </label>
												</div>
												<button type="submit" class="btn btn-danger btn-lg">탈퇴하기</button>
												<a href="mypageMain.jsp"
													class="btn btn-secondary btn-lg ms-3">취소</a>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 프로필 수정 모달 -->
						<div class="modal fade" id="editProfileModal" tabindex="-1"
							aria-labelledby="editProfileModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="editProfileModalLabel">프로필 수정</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
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
	</div>
	<br />

	<jsp:include page="include/footer.jsp" />

	<%--
	
    <!-- Bootstrap JS, Chart.js -->
	 --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="assets/js/mypage/mypageMain.js"></script>
	<script src="assets/js/mypage/sidebars.js"></script>

</body>

</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/newsSubpage_bank.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body class="subpage">
	<jsp:include page="include/header.jsp" />

	<jsp:include page="include/subnav.jsp" />

	<div class="subpageWrapper">

		<div class="subpage-breadcrumbs">
			<a href="#">소식</a> <span> > </span> <a href="#">은행소식</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container">
			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">SPIKE 소식</h3>
				<ul>
					<li><a href="newsSubpage_bank.jsp">은행소식</a></li>
					<li><a href="newsSubpage_product.jsp">새 상품소식</a></li>
					<li><a href="newsSubpage_job.jsp">채용공고</a></li>
					<%-- 현재페이지=선택된 메뉴면 배경색 진하게, 백엔드랑 연동할예정 --%>
					<li><a href="newsSubpage_notice.jsp">공지사항</a></li>
				</ul>
			</div>

			<%-- ===============================컨텐츠 랩================================= --%>
			<div class="subpage-content-wrap">
				<h2>SPIKE 소식</h2>

				<div class="news-section">
					<!-- 이벤트 -->
					<div class="news-category">
						<img src="./assets/img/subpage/event-banner1.jpg" alt="이벤트 배너">
						<h3>이벤트</h3>
						<ul>
							<li><a href="eventDetail.jsp">SPIKE 글로벌 통장 출시 기념 이벤트</a> <span
								class="date">2024-12-10</span></li>
							<li><a href="eventDetail.jsp">SPIKE 클럽 특별 혜택</a> <span
								class="date">2024-11-25</span></li>
							<li><a href="eventDetail.jsp">고객 감사 이벤트</a> <span
								class="date">2024-11-05</span></li>
						</ul>
					</div>


					<!-- 관련 뉴스 -->
					<div class="news-category">
						<img src="./assets/img/subpage/event-banner2.jpg" alt="뉴스 배너">
						<h3>관련 뉴스</h3>
						<ul>
							<li><a href="#">[언론 보도] SPIKE, ESG 선도 기업으로 발돋움</a> <span
								class="date">2024-12-15</span></li>
							<li><a href="#">[금융 뉴스] 모바일 뱅킹 고객 5천만 돌파</a> <span
								class="date">2024-11-30</span></li>
						</ul>
					</div>
				</div>

				<!-- 고객 후기 섹션 -->
				<div class="testimonial-container">
					<h2 class="testimonial-title">고객 후기</h2>
					<!-- 고객 후기 텍스트 -->
					<div class="testimonial-slider-container">
						<div class="testimonial-slider">
							<!-- 첫 번째 슬라이드 -->
							<div class="testimonial-slide">
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>최고의 서비스! 항상 만족합니다.</p>
									</div>
									<p class="customer-name">홍길동</p>
								</div>

								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>이용하기 너무 편리하고 좋습니다!</p>
									</div>
									<p class="customer-name">김철수</p>
								</div>
							</div>
							<!-- 두 번째 슬라이드 -->
							<div class="testimonial-slide">
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>고객 맞춤 서비스가 마음에 듭니다.</p>
									</div>
									<p class="customer-name">이영희</p>
								</div>
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>친절한 고객센터에 만족해요.</p>
									</div>
									<p class="customer-name">박민수</p>
								</div>
							</div>
							<!-- 세 번째 슬라이드 -->
							<div class="testimonial-slide">
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>빠르고 신속한 서비스가 마음에 들어요.</p>
									</div>
									<p class="customer-name">최진영</p>
								</div>
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>다양한 서비스가 있어서 좋아요.</p>
									</div>
									<p class="customer-name">정성호</p>
								</div>
							</div>
							<!-- 네 번째 슬라이드 -->
							<div class="testimonial-slide">
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>해외 통장 혜택이 맘에 들어요!</p>
									</div>
									<p class="customer-name">이수현</p>
								</div>
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>믿을 수 있어요~</p>
									</div>
									<p class="customer-name">장수진</p>
								</div>
							</div>

							<!-- 다섯 번째 슬라이드 -->
							<div class="testimonial-slide">
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>아이들도 같이 사용할 수 있어서 좋아요.</p>
									</div>
									<p class="customer-name">정지희</p>
								</div>
								<div class="testimonial-item">
									<i class="fas fa-user-circle profile-icon"></i>
									<div class="testimonial-text">
										<p>스파이크 쉴드 서비스를 애용해요!</p>
									</div>
									<p class="customer-name">이진수</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 고객 후기 끝 -->

				<!-- 이메일 알림 구독 섹션 -->
				<div class="newsletter-container">
					<h2 class="newsletter-title">이메일 알림 구독</h2>
					<!-- 구독 제목 -->
					<p class="newsletter-description">스파이크의 최신 소식과 이벤트를 이메일로 받아보세요.</p>
					<!-- 설명 텍스트 -->
					<form class="newsletter-form"
						onsubmit="showSubscriptionPopup(event)">
						<input type="email" id="email" name="email"
							placeholder="이메일을 입력하세요" required>
						<button type="submit">구독하기</button>
					</form>
				</div>

				<script>
					function showSubscriptionPopup(event) {
						event.preventDefault(); // 폼 제출 방지
						alert("SPIKE 구독 신청이 완료되었습니다!");
					}
				</script>


				<!-- 이메일 알림 구독 섹션 끝 -->


			</div>
		</div>
	</div>
	<jsp:include page="include/shortfooter.jsp" />
	<script src="./assets/js/subpage.js"></script>
	<script src="./assets/js/subpage_bank.js"></script>

</body>
</html>

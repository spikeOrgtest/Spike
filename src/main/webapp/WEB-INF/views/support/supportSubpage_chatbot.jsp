<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SPIKE 챗봇</title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/chatbot.css">
<link rel="stylesheet" href="assets/css/include.css">
</head>
<body class="subpage">
	<%@ include file="include/header.jsp"%>

	<jsp:include page="include/subnav.jsp" />
	<%-- 서브네비바 --%>

	<div class="subpageWrapper">
		<div class="subpage-breadcrumbs">
			<a href="#">고객지원</a> <span> > </span> <a href="#">SPIKE챗봇</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<div class="subpage-main-container">

			<!-- 사이드바 -->
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">고객지원</h3>
				<ul>
					<li><a href="supportSubpage_ars.jsp">ARS 안내</a></li>
					<li><a href="supportSubpage_sms.jsp">문자상담</a></li>
					<li><a href="supportSubpage_chatbot.jsp">스파이크 챗봇</a></li>
					<li><a href="supportSubpage_main.jsp">Q&A</a></li>
					<li><a href="supportSubpage_FAQ.jsp">자주묻는질문</a></li>
				</ul>
			</div>

			<!-- 메인 컨텐츠 영역 -->
			<div class="spike-wrapper">

				<!-- 챗봇 소개 -->
				<section class="spike-introduce">
					<h1>SPIKE 챗봇 소개</h1>
				</section>

				<!-- 슬로건 배너 섹션 -->
				<section class="spike-banner">
					<div class="banner-text">
						<h1>쉽고 빠르게 금융을 관리하세요!</h1>
						<p>SPIKE AI 챗봇과 함께 스마트한 금융 생활을 시작해 보세요.</p>
						<button onclick="location.href='chatbot_start.jsp'"
							class="cta-button">지금 시작하기</button>
					</div>
					<div class="banner-image">
						<img src="assets/img/chatbot/chatbot.png" alt="SPIKE 챗봇 이미지">
					</div>
				</section>

				<!-- 주요 기능 소개 섹션 -->
				<section class="spike-features">
					<h2>스파이크 챗봇 주요 기능</h2>
					<div class="feature-cards">
						<!-- 카드 1: 계좌 조회 -->
						<div class="feature-card">
							<img src="assets/img/chatbot/account.png" alt="계좌 조회">
							<h3>계좌 조회</h3>
							<p>
								간단한 명령어로 잔액과 <br />거래 내역을 확인하세요.
							</p>
						</div>
						<!-- 카드 2: 송금 지원 -->
						<div class="feature-card">
							<img src="assets/img/chatbot/transfer.png" alt="송금 지원">
							<h3>송금 지원</h3>
							<p>
								빠르고 안전하게 <br />송금 요청을 처리합니다.
							</p>
						</div>
						<!-- 카드 3: 투자 정보 제공 -->
						<div class="feature-card">
							<img src="assets/img/chatbot/invest.png" alt="투자 정보">
							<h3>투자 정보 제공</h3>
							<p>
								실시간 주식, 금, 암호화폐 <br />시세를 확인하세요.
							</p>
						</div>
						<!-- 카드 4: 맞춤 금융 추천 -->
						<div class="feature-card">
							<img src="assets/img/chatbot/financial.png" alt="금융 추천">
							<h3>맞춤 금융 추천</h3>
							<p>
								당신에게 필요한 금융 <br />상품을 제안해 드립니다.
							</p>
						</div>
					</div>
				</section>

				<!-- 고객 후기 섹션 -->
				<div class="customer-reviews">
					<h3>고객 후기</h3>
					<div class="reviews-container">
						<div class="review-card">
							<p>
								<br />"SPIKE를 사용하고 나서 금융 관리를 훨씬 더 효율적으로 할 수 있었어요!"
							</p>
							<span>- 김철수, 서울</span>
						</div>
						<div class="review-card">
							<p>
								<br />"간단하고 직관적인 인터페이스 덕분에 누구나 쉽게 사용할 수 있어요."
							</p>
							<span>- 이영희, 부산</span>
						</div>
						<div class="review-card">
							<p>
								<br />
								<br />"보안이 철저해서 안심하고 금융 거래를 할 수 있습니다."
							</p>
							<span>- 박민수, 대구</span>
						</div>
					</div>
				</div>

				<!-- FAQ 섹션 -->
				<br />
				<div class="faq">
					<h3>챗봇 사용 방법</h3>

					<div class="faq-timeline">
						<!-- 타임라인 아이템 1 -->
						<div class="timeline-item">
							<div class="timeline-marker"></div>
							<div class="timeline-content">
								<h4>1단계: 챗봇 실행</h4>
								<p>SPIKE 웹사이트나 앱에서 챗봇 아이콘을 클릭하여 실행하세요.</p>
							</div>
						</div>

						<!-- 타임라인 아이템 2 -->
						<div class="timeline-item">
							<div class="timeline-marker"></div>
							<div class="timeline-content">
								<h4>2단계: 문의 시작</h4>
								<p>챗봇에게 원하는 금융 정보를 자연어로 입력하세요. 예: "내 계좌 잔액 알려줘"</p>
							</div>
						</div>

						<!-- 타임라인 아이템 3 -->
						<div class="timeline-item">
							<div class="timeline-marker"></div>
							<div class="timeline-content">
								<h4>3단계: 답변 확인</h4>
								<p>SPIKE 챗봇이 금융 정보나 관련 자료를 실시간으로 제공합니다.</p>
							</div>
						</div>

						<!-- 타임라인 아이템 4 -->
						<div class="timeline-item">
							<div class="timeline-marker"></div>
							<div class="timeline-content">
								<h4>4단계: 추가 기능 활용</h4>
								<p>송금, 투자 정보 조회 등 다양한 기능을 이용해 보세요.</p>
							</div>
						</div>
					</div>

					<details>
						<summary>보안은 어떻게 보장되나요?</summary>
						<p>최고 수준의 보안 시스템을 적용하여 안전한 금융 서비스를 제공합니다.</p>
					</details>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="include/shortfooter.jsp"%>
	<script src="assets/js/subpage.js"></script>
</body>
</html>

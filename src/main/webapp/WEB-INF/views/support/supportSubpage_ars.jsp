<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ARS 상담 서비스</title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/supportSubpage_ars.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="subpage">
	<%@ include file="include/header.jsp"%>

	<jsp:include page="include/subnav.jsp" />
	<div class="subpageWrapper">
		<div class="subpage-breadcrumbs">
			<a href="#">고객센터</a> <span>></span> <a href="#">ARS 안내</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">고객센터</h3>
				<ul>
					<li><a href="supportSubpage_ars.jsp">ARS 안내</a></li>
					<li><a href="supportSubpage_sms.jsp">문자상담</a></li>
					<li><a href="supportSubpage_chatbot.jsp">스파이크 챗봇</a></li>
					<li><a href="supportSubpage_main.jsp">Q&A</a></li>
					<li><a href="supportSubpage_FAQ.jsp">자주묻는질문</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">
				<h2>ARS 상담</h2>

				<div class="ars-container">
					<div class="ars-menu">
						<h3>
							<i class="fa fa-phone"></i> ARS 상담메뉴 안내
						</h3>
						<div class="ars-info">
							<h4>대표 ARS</h4>
							<p class="phone-numbers">
								<i class="fas fa-phone"></i> 1588-9955 <i class="fas fa-phone"></i>
								1599-9955
							</p>
							<div class="ars-types">
								<p>
									<i class="fas fa-mobile-alt"></i> 1. 디지털 ARS
								</p>
								<p>
									<i class="fas fa-microphone"></i> 2. 말로하는 ARS
								</p>
								<p>
									<i class="fas fa-hand-pointer"></i> 3. 누르는 ARS
								</p>
							</div>
							<p class="service-hours">
								<i class="far fa-clock"></i> 상담시간 : 분실 및 승인 365일 24시간 / 종합 상담 평일
								오전 9시 ~ 오후 6시
							</p>

							<div class="ars-notice">
								<p>
									<i class="fas fa-info-circle"></i> ARS 이용요금은 국내 기준, 유선전화는 시내요금
									기준(3분당 39원/VAT별도), 휴대전화는 해당 통신사 이용요금 기준으로 부과됩니다.
								</p>

								<p>
									<i class="fas fa-headset"></i> 상담원 연결이 지연되는 경우, 연락처를 남겨주시면 상담원이
									전화드립니다.
								</p>

								<p>
									<i class="fas fa-robot"></i> ARS 연결시 디지털 ARS 자동 실행 대상 고객일 경우,
									디지털 ARS로 자동 연결됩니다.
								</p>
							</div>

							<div class="additional-services">
								<h5>
									<i class="fas fa-list-alt"></i> 추가 서비스 안내
								</h5>
								<table>
									<tr>
										<td><i class="fas fa-credit-card"></i> 카드분실신고</td>
										<td>1588-5300</td>
									</tr>
									<tr>
										<td><i class="fas fa-piggy-bank"></i> 금융서비스</td>
										<td>1577-9000</td>
									</tr>
									<tr>
										<td><i class="fas fa-globe"></i> 해외에서</td>
										<td>82-2-6958-9000</td>
									</tr>
									<tr>
										<td><i class="fas fa-money-bill-wave"></i> 카드대금 및 연체</td>
										<td>1599-6300</td>
									</tr>
									<tr>
										<td><i class="fas fa-store"></i> 우리카드 독자가맹점</td>
										<td>1644-9797</td>
									</tr>
									<tr>
										<td><i class="fas fa-hands-helping"></i> 상생금융 지원</td>
										<td>1599-9655</td>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<div class="keypad-container">
						<div class="ars-keypad">
							<h3>ARS 키패드</h3>
							<div class="keypad-grid">
								<div class="key">
									1<span>계좌</span>
								</div>
								<div class="key">
									2<span>카드</span>
								</div>
								<div class="key">
									3<span>대출</span>
								</div>
								<div class="key">
									4<span>금융상품</span>
								</div>
								<div class="key">
									5<span>공인인증</span>
								</div>
								<div class="key">
									6<span>기타</span>
								</div>
								<div class="key">
									7<span>분실신고</span>
								</div>
								<div class="key">
									8<span>상담원</span>
								</div>
								<div class="key">
									9<span>외국어</span>
								</div>
								<div class="key">
									*<span>처음으로</span>
								</div>
								<div class="key">
									0<span>이전으로</span>
								</div>
								<div class="key">
									#<span>다시듣기</span>
								</div>
							</div>
						</div>
						<div class="ars-description">
							<h3>설명</h3>
							<p id="keyDescription"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="include/shortfooter.jsp"%>
	<script src="subpage.js"></script>
	<script src="assets/js/supportSubpage_ars.js"></script>
	<script src="./assets/js/subpage.js"></script>

</body>
</html>


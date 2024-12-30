<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문자 상담 서비스</title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/supportsSubpage_sms.css">
</head>
<body class="subpage">
	<%@ include file="../include/header.jsp"%>

	<jsp:include page="../include/subnav.jsp" />

	<div class="subpageWrapper">
		<div class="subpage-breadcrumbs">
			<a href="#">고객센터</a> <span>></span> <a href="#">문자상담</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<div class="subpage-main-container">
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

			<div class="subpage-content-wrap">
				<%-- 높이 수정 가능 --%>
				<h2>문자 상담</h2>
				<div class="sms-info">
					<div class="sms-description">
						<img src="assets/img/sms.png" alt="SMS 아이콘" class="sms-icon">
						<ul>
							<li>SMS로 문의사항을 작성하시면 곧 1544-0608번으로 전송하시면 문자로 답변을 드리는 편리한
								서비스 입니다.</li>
							<li>서류 안내, 업무점 위치 등 단순한 답변이 가능합니다. (단, 본인확인이 필요한 개인정보관련 내용은
								제공 불가)</li>
							<li>이용 가능 시간 : 평일(영업일) 오전 9시 ~ 오후 6시</li>
							<li>전화 정보이용료 50원 + 문자 메시지 이용료 (건당 30원, 정보 50원)</li>
						</ul>
					</div>

					<div class="sms-steps">
						<div class="step">
							<div class="step-number">Step 01</div>
							<div class="step-content">
								<h4>문의사항 작성 후</h4>
								<p>
									문자로 문의 메세지 전송<br>(1544-0608)
								</p>
							</div>
						</div>
						<div class="step-arrow">→</div>
						<div class="step">
							<div class="step-number">Step 02</div>
							<div class="step-content">
								<h4>문자상담 접수</h4>
								<p>유선으로 문자 안내</p>
							</div>
						</div>
						<div class="step-arrow">→</div>
						<div class="step">
							<div class="step-number">Step 03</div>
							<div class="step-content">
								<h4>유대응 문자 메시지</h4>
								<p>답변 확인</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/shortfooter.jsp"%>
		<script src="./assets/js/subpage.js"></script>
	
</body>
</html>


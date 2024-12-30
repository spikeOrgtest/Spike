<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주묻는질문(FAQ)</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/supportSubpage_FAQ.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/subpage.css">
</head>

<body class="subpage">
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/subnav.jsp"%>
	<%-- /wrap --%>

	<div class="subpageWrapper">
		<%-- 브레드크럼, 경로 표시 필요 없는 페이지면 지워도 됨 --%>
		<div class="subpage-breadcrumbs">
			<a href="customer.jsp">고객센터</a> <span> > </span> <a
				href="supportSubpage_FAQ.jsp">자주묻는질문</a>
		</div>
	</div>

	<div class="subpageWrapper-main">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container">
			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">고객센터</h3>
				<ul>
					<li><a href="supportSubpage_ars.jsp">ARS 안내</a></li>
					<li><a href="supportSubpage_sms.jsp">문자상담</a></li>
					<li><a href="supportSubpage_chatbot.jsp">스파이크 챗봇</a></li>
					<li><a href="supportSubpage_main.jsp">Q&A</a></li>
					<li><a href="supportSubpage_FAQ.jsp">자주묻는질문</a></li>
					<%-- 현재페이지=선택된 메뉴면 배경색 진하게, 백엔드랑 연동할예정 --%>
				</ul>
			</div>

			<%--===============================컨텐츠 랩(여기에 상세 컨텐츠가
								들어감)=================================--%>
			<div class="subpage-content-wrap">
				<div class="faq-container">
					<div class="faq-header">
						<h1>자주 묻는 질문 (FAQ)</h1>
						<p>고객님이 자주 찾으시는 질문과 답변을 모아놓았습니다.</p>
					</div>

					<div class="faq-search">
						<input type="text" placeholder="질문을 입력해주세요" class="form-control"
							id="faqSearch" onkeyup="filterFAQ()">
					</div>

					<div class="faq-category">
						<button class="btn btn-primary" onclick="filterByCategory('전체')">전체</button>
						<button class="btn btn-primary"
							onclick="filterByCategory('계좌 관리')">계좌 관리</button>
						<button class="btn btn-primary" onclick="filterByCategory('전자결제')">전자결제</button>
						<button class="btn btn-primary"
							onclick="filterByCategory('대출 관련')">대출 관련</button>
						<button class="btn btn-primary"
							onclick="filterByCategory('보안 설정')">보안 설정</button>
						<button class="btn btn-primary"
							onclick="filterByCategory('카드 서비스')">카드 서비스</button>
					</div>

					<table class="table table-bordered table-hover" id="faqTable">
						<thead class="table-primary">
							<tr>
								<th>분류</th>
								<th>제목</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr data-category="계좌 관리">
								<td>계좌 관리</td>
								<td><a href="#">[계좌 개설] 온라인으로 계좌를 개설하는 방법</a></td>
								<td>2,132</td>
							</tr>
							<tr data-category="대출 관련">
								<td>대출 관련</td>
								<td><a href="#">대출 신청 시 필요한 서류 안내</a></td>
								<td>1,849</td>
							</tr>
							<tr data-category="보안 설정">
								<td>보안 설정</td>
								<td><a href="#">OTP 인증 설정 방법</a></td>
								<td>3,749</td>
							</tr>
							<tr data-category="카드 서비스">
								<td>카드 서비스</td>
								<td><a href="#">카드 분실 시 조치 방법</a></td>
								<td>4,134</td>
							</tr>
							<tr data-category="전자결제">
								<td>전자결제</td>
								<td><a href="#">인터넷 뱅킹에서 전자 결제하는 방법</a></td>
								<td>2,902</td>
							</tr>
						</tbody>
					</table>

					<div class="pagination">
						<a href="#" class="btn btn-outline-primary">&laquo;</a> <a
							href="#" class="btn btn-outline-primary">1</a> <a href="#"
							class="btn btn-outline-primary">2</a> <a href="#"
							class="btn btn-outline-primary">3</a> <a href="#"
							class="btn btn-outline-primary">&raquo;</a>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../include/shortfooter.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script src="assets/js/supportSubpage_FAQ.js"></script>
		<script src="./assets/js/subpage.js"></script>
	
</body>

</html>
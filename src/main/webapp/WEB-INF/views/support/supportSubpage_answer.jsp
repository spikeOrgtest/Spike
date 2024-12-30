<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>답변 확인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/supportSubpage_answer.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/subpage.css">
</head>

<body class="subpage">
	<%@ include file="include/header.jsp"%>
	<%@ include file="include/subnav.jsp"%>
	<%-- /wrap --%>

	<div class="subpageWrapper">
		<%-- 브레드크럼, 경로 표시 필요 없는 페이지면 지워도 됨 --%>
		<div class="subpage-breadcrumbs">
			<a href="customer.jsp">고객센터</a> <span> > </span> <a
				href="supportSubpage_main.jsp">Q&A</a> <span> > </span> <a
				href="supportSubpage_list.jsp">문의내역</a> <span> > </span> <a
				href="supportSubpage_answer.jsp">답변 확인</a>
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
				<h2>답변보기</h2>

				<!-- 문의 내용 영역 -->
				<div class="card mb-4">
					<div class="card-body">
						<h4 class="card-title">문의 제목: 계좌 오류 문의</h4>
						<p class="card-text">
							<strong>작성일:</strong> 2024-12-18
						</p>
						<p class="card-text">
							<span class="badge bg-danger">답변 대기중</span>
						</p>
						<h5>문의 내용:</h5>
						<p>저는 최근에 계좌에 문제가 생겨, 입금이 제대로 처리되지 않았습니다. 이 문제를 해결하기 위해
							문의드립니다.</p>
					</div>
				</div>

				<!-- 답변 내용 영역 -->
				<div class="card mb-4">
					<div class="card-body bg-light">
						<h5 class="card-title">답변 내용:</h5>
						<p class="card-text">안녕하세요, 고객님. 계좌 오류 문제에 대해 확인해본 결과, 시스템 상의
							오류로 인해 입금이 지연되었습니다. 현재 문제는 해결되었으며, 입금이 정상적으로 처리되었습니다. 추가적인 문의가
							있으시면 언제든지 연락 주세요.</p>
					</div>
				</div>

				<div class="text-end">
					<!-- 목록 버튼 -->
					<a href="supportSubpage_list.jsp" class="btn btn-secondary">목록으로
						돌아가기</a>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="include/shortfooter.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script src="assets/js/supportSubpage_answer.js"></script>
	<script src="./assets/js/subpage.js"></script>

</body>

</html>
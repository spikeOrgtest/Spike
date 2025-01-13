<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의내역</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/supportSubpage_main.css">
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
				href="supportSubpage_main.jsp">Q&A</a>
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
				</ul>
			</div>

			<%--===============================컨텐츠 랩(여기에 상세 컨텐츠가
                                들어감)=================================--%>
			<div class="subpage-content-wrap">
				<h2 class="text-center mb-4">Q&A</h2>

				<!-- Introduction Section -->
				<div class="card mb-5 shadow-lg border-0">
					<div class="row g-0">
						<div
							class="col-md-4 d-flex align-items-center justify-content-center bg-primary text-white">
							<i class="bi bi-question-circle fs-1"></i>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h4 class="card-title text-primary">Q&A란 무엇인가요?</h4>
								<p class="card-text">Q&A는 고객님께서 자주 묻는 질문과 이에 대한 답변을 제공하는
									공간입니다. 궁금하신 사항을 빠르고 간편하게 확인하실 수 있도록 다양한 카테고리별로 질문과 답변을 정리해
									두었습니다.</p>
							</div>
						</div>
					</div>
				</div>

				<!-- Features Section -->

				<div class="row text-center">
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<div class="card-body">
								<i class="bi bi-search fs-1 text-primary"></i>
								<h5 class="card-title mt-3">빠른 검색</h5>
								<p class="card-text">검색 기능을 통해 원하는 답변을 빠르게 찾을 수 있습니다.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<div class="card-body">
								<i class="bi bi-list-ul fs-1 text-success"></i>
								<h5 class="card-title mt-3">카테고리별 정리</h5>
								<p class="card-text">질문과 답변이 주제별로 정리되어 있어 쉽게 찾을 수 있습니다.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<div class="card-body">
								<i class="bi bi-chat-dots fs-1 text-warning"></i>
								<h5 class="card-title mt-3">실시간 상담</h5>
								<p class="card-text">궁금한 점은 SPIKE 챗봇을 통해 실시간으로 문의하실 수 있습니다.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<div class="card-body">
								<i class="bi bi-envelope fs-1 text-info"></i>
								<h5 class="card-title mt-3">문의하기</h5>
								<p class="card-text">특정 질문이 있으신가요? "문의하기"를 통해 직접 질문을 제출할 수
									있습니다.</p>
							</div>
							<a href="supportSubpage_Input.jsp" class="btn btn-primary mt-3">바로가기</a>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<div class="card-body">
								<i class="bi bi-journal-text fs-1 text-secondary"></i>
								<h5 class="card-title mt-3">문의 내역</h5>
								<p class="card-text">과거에 제출한 문의 내용을 확인하고, 진행 상황을 추적할 수 있습니다.</p>
							</div>
							<a href="supportSubpage_list.jsp" class="btn btn-secondary mt-3">바로가기</a>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<div class="card-body">
								<i class="bi bi-question-circle fs-1 text-danger"></i>
								<h5 class="card-title mt-3">자주 묻는 질문</h5>
								<p class="card-text">많은 고객님께서 궁금해하시는 내용을 모아둔 FAQ를 확인해보세요.</p>
							</div>
							<a href="supportSubpage_FAQ.jsp" class="btn btn-danger mt-3">바로가기</a>
						</div>
					</div>
				</div>

				<!-- How to Use Section -->
				<div class="card mt-4">
					<div class="card-body">
						<h4 class="card-title">Q&A 사용 방법</h4>
						<ol>
							<li>상단 검색창을 이용해 키워드로 질문을 검색합니다.</li>
							<li>카테고리 메뉴를 통해 관련 질문을 탐색합니다.</li>
							<li>추가 문의 사항이 있다면, 실시간 상담을 이용해 주세요.</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="include/shortfooter.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script src="assets/js/supportSubpage_main.js"></script>
		<script src="./assets/js/subpage.js"></script>
	
</body>

</html>
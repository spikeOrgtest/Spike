<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의작성</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/supportSubpage_Input.css">
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
				href="supportSubpage_main.jsp">Q&A</a> <span> > </span> <a
				href="supportSubpage_list.jsp">문의내역</a> <span> > </span> <a
				href="supportSubpage_Input.jsp">문의작성</a>
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
				<h2 class="text-center mb-4">문의작성</h2>
				<form id="inquiryForm" action="#" method="POST" class="mt-4"
					novalidate>
					<!-- 유형 선택 -->
					<div class="mb-3">
						<label for="inquiryType" class="form-label">유형 선택</label> <select
							class="form-select" id="inquiryType" required>
							<option value="" selected disabled>유형을 선택하세요</option>
							<option value="account">계좌 관련</option>
							<option value="loan">대출 관련</option>
							<option value="transaction">결제 관련</option>
							<option value="support">고객지원</option>
						</select>
						<div class="invalid-feedback">유형을 선택해주세요.</div>
					</div>

					<!-- 제목 -->
					<div class="mb-3">
						<label for="inquiryTitle" class="form-label">제목</label> <input
							type="text" class="form-control" id="inquiryTitle"
							placeholder="제목을 입력하세요" required>
						<div class="invalid-feedback">제목을 입력해 주세요.</div>
					</div>

					<!-- 내용 -->
					<div class="mb-3">
						<label for="inquiryContent" class="form-label">내용</label>
						<textarea class="form-control" id="inquiryContent" rows="20"
							placeholder="내용을 입력하세요" required></textarea>
						<div class="invalid-feedback">내용을 입력해 주세요.</div>
					</div>

					<!-- 문의하기 버튼 -->
					<div class="text-end">
						<button type="submit" class="btn btn-secondary">문의하기</button>
						<a href="supportSubpage_list.jsp" class="btn btn-secondary">목록으로
							돌아가기</a>
					</div>
				</form>
			</div>

		</div>
	</div>

	<%@ include file="../include/shortfooter.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script src="assets/js/supportSubpage_Input.js"></script>
</body>

</html>
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
<link rel="stylesheet" href="assets/css/supportSubpage_list.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/subpage.css">
</head>

<body class="subpage">
	<%@ include file="include/header.jsp"%>
	<%@ include file="include/subnav.jsp"%>
	<div class="subpageWrapper">
		<%-- 브레드크럼, 경로 표시 필요 없는 페이지면 지워도 됨 --%>
		<div class="subpage-breadcrumbs">
			<a href="customer.jsp">고객센터</a> <span> > </span> <a
				href="supportSubpage_main.jsp">Q&A</a> <span> > </span> <a
				href="supportSubpage_list.jsp">문의내역</a>
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
				<div class="col mb-4">
					<!-- Main Content -->
					<h2 class="my-4">문의내역</h2>

					<div class="table">
						<table class="table table-custom table-hover">
							<thead class="thead-light">
								<tr>
									<th scope="col">문의 번호</th>
									<th scope="col">제목</th>
									<th scope="col">상태</th>
									<th scope="col">작성일</th>
									<th scope="col">답변</th>
								</tr>
							</thead>
							<tbody id="inquiryTable">
								<tr>
									<td>1</td>
									<td>계좌 오류 문의</td>
									<td><span class="atmosphere">답변 대기중</span></td>
									<td>2024-12-18</td>
									<td><a href="#" class="answer">답변보기</a></td>
								</tr>
								<tr>
									<td>2</td>
									<td>결제 오류 문의</td>
									<td><span class="ansuccess">답변 완료</span></td>
									<td>2024-12-17</td>
									<td><a href="#" class="answer">답변보기</a></td>
								</tr>
								<tr>
									<td>3</td>
									<td>송금 지연 문의</td>
									<td><span class="atmosphere">답변 대기중</span></td>
									<td>2024-12-16</td>
									<td><a href="#" class="answer">답변보기</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="text-end">
					<a href="supportSubpage_Input.jsp" class="write">문의하기</a>
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
	<script src="assets/js/supportSubpage_list.js"></script>
</body>

</html>
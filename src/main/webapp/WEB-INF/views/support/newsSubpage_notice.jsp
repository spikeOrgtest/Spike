<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/subpage_notice.css">
</head>
<body class="subpage">
	<%@ include file="include/header.jsp"%>

	<jsp:include page="include/subnav.jsp" />

	<div class="subpageWrapper">
		<!-- 브레드크럼(경로) -->
		<div class="subpage-breadcrumbs">
			<a href="#">고객지원</a> <span> &gt; </span> <a
				href="supportSubpage_notice.jsp">공지사항</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<!-- 사이드바 -->
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

			<!-- 컨텐츠 영역 -->
			<div class="subpage-content-wrap">
				<h2>공지사항</h2>
				<div class="notice-board">
					<table class="notice-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="noticeDetail.jsp?noticeId=1">[필독] 시스템 점검
										안내 (12/25)</a></td>
								<td>관리자</td>
								<td>2024-12-18</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="noticeDetail.jsp?noticeId=2">신규 서비스 출시 안내</a></td>
								<td>관리자</td>
								<td>2024-12-10</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a href="noticeDetail.jsp?noticeId=3">이벤트 당첨자 발표</a></td>
								<td>관리자</td>
								<td>2024-12-01</td>
							</tr>
						</tbody>
					</table>

					<div class="notice-pagination">
						<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a>
						<a href="#">3</a> <a href="#">&gt;</a>
					</div>
				</div>
			</div>

			<!-- //subpage-content-wrap -->

		</div>
	</div>

	<%@ include file="include/shortfooter.jsp"%>
	<script src="assets/js/subpage.js"></script>
</body>
</html>

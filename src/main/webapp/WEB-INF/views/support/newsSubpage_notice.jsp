<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="/css/support/subpage.css">
<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/support/subpage_notice.css">
</head>
<body class="subpage">
	<%@ include file="../include/header.jsp"%>

	<jsp:include page="../include/subnav.jsp" />

	<div class="subpageWrapper">
		<div class="subpage-breadcrumbs">
			<a href="#">고객지원</a> <span> &gt; </span> <a href="supportSubpage_notice.jsp">공지사항</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">SPIKE 소식</h3>
				<ul>
					<li><a href="newsSubpage_bank.jsp">은행소식</a></li>
					<li><a href="newsSubpage_product.jsp">새 상품소식</a></li>
					<li><a href="newsSubpage_job.jsp">채용공고</a></li>
					<li><a href="newsSubpage_notice.jsp">공지사항</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">
				<form method="post" action="noti_list">
					<h2>공지사항</h2>
					<div class="notice-board">
						<table class="notice-table">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty Nlist}">
									<c:forEach var="n" items="${Nlist}">
										<tr>
											<td>${n.notice_no}</td>
											<td><a href="/spike.com/noti_cont?notice_no=${n.notice_no}&state=cont&page=${page}">${n.notice_title}</a></td>
											<td>${n.notice_name}</td>
											<td><fmt:formatDate value="${n.created_date}" pattern="yyyy-MM-dd" /></td>
											<td align="center">${n.notice_hit}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>

					<div id="Nlist_paging">
						<c:choose>
							<c:when test="${empty find_field && empty find_name}">
								<c:if test="${page > 1}">
									<a href="notice?page=${page-1}">[이전]</a>&nbsp;
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}">
										[${a}]
									</c:if>
									<c:if test="${a != page}">
										<a href="notice?page=${a}">[${a}]</a>&nbsp;
									</c:if>
								</c:forEach>

								<c:if test="${page < maxpage}">
									<a href="notice?page=${page+1}">[다음]</a>
								</c:if>
							</c:when>

							<c:otherwise>
								<c:if test="${page > 1}">
									<a href="notice?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}">
										[${a}]
									</c:if>
									<c:if test="${a != page}">
										<a href="notice?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
									</c:if>
								</c:forEach>

								<c:if test="${page < maxpage}">
									<a href="notice?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>

					<div id="nFind_wrap">
						<select name="find_field">
							<option value="notice_title" <c:if test="${find_field == 'notice_title'}">selected</c:if>>제목</option>
							<option value="notice_cont" <c:if test="${find_field == 'notice_cont'}">selected</c:if>>내용</option>
						</select>
						<input type="search" name="find_name" size="14" value="${find_name}" />
						<button type="submit">검색</button>
					</div>

					<div id="Nlist_menu">
						<button type="button" onclick="location='/spike.com/noti_write?page=${page}';">글쓰기</button>
						<c:if test="${(!empty find_field) && (!empty find_name)}">
							<button type="button" onclick="location='/spike.com/notice?page=${page}';">전체목록</button>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../include/shortfooter.jsp"%>
	<script src="/js/subpage.js"></script>
</body>
</html>

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
		<div class="subpage-main-container" style="justify-content: center;">

			<div class="subpage-content-wrap">
				<form method="get" action="/spike.com/notice">
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
								<!--  startrow값을 이용해서 번호계산 -->
								   <c:set var="i" value="${index}" /><!-- 페이지가 1일 경우, 0으로 설정 -->
								   
									<c:forEach var="n" items="${Nlist}">
										<tr>
											<td> ${i} </td>
											
											<td><a href="/spike.com/noti_cont?notice_no=${n.noticeNo}&state=cont&page=${page}">${n.noticeTitle}</a></td>
											<td>${n.noticeName}</td>
											<td><fmt:formatDate value="${n.createdDate}" pattern="yyyy-MM-dd" /></td>
											<td align="center">${n.noticeHit}</td>
											<c:set var="i" value="${i - 1}" />
										</tr>
										
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>

					<div id="Nlist_paging">
						<c:choose>
							<c:when test="${empty findField && empty findName}">
								<c:if test="${page > 1}">
									<a href="/spike.com/notice?page=${page-1}">[이전]</a>&nbsp;
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}">
										[${a}]
									</c:if>
									<c:if test="${a != page}">
										<a href="/spike.com/notice?page=${a}">[${a}]</a>&nbsp;
									</c:if>
								</c:forEach>

								<c:if test="${page < maxpage}">
									<a href="/spike.com/notice?page=${page+1}">[다음]</a>
								</c:if>
							</c:when>

							<c:otherwise>
								<c:if test="${page > 1}">
									<a href="/spike.com/notice?page=${page-1}&findField=${findField}&findName=${findName}">[이전]</a>&nbsp;
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}">
										[${a}]
									</c:if>
									<c:if test="${a != page}">
										<a href="/spike.com/notice?page=${a}&findField=${findField}&findName=${findName}">[${a}]</a>&nbsp;
									</c:if>
								</c:forEach>

								<c:if test="${page < maxpage}">
									<a href="/spike.com/notice?page=${page+1}&findField=${findField}&findName=${findName}">[다음]</a>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>

					<div id="nFind_wrap">
						<select name="findField">
							<option value="notice_title" <c:if test="${findField == 'notice_title'}">selected</c:if>>제목</option>
							<option value="notice_cont" <c:if test="${findField == 'notice_cont'}">selected</c:if>>내용</option>
						</select>
						<input type="search" name="findName" size="14" value="${findName}" />
						<button type="submit">검색</button>
					</div>
                                        
					 <div id="Nlist_menu">
						<c:if test="${not empty sessionScope.User and sessionScope.User.roles == 'ROLE_ADMIN'}">
                           <button type="button" onclick="location='/spike.com/admin/noti_write';">글쓰기</button>
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

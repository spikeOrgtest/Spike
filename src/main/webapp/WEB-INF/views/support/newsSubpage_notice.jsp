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
							<!-- <tr>
								<td>1</td>
								<td><a href="noticeDetail.jsp?noticeId=1">[필독] 시스템 점검
										안내 (12/25)</a></td>
								<td>관리자</td>
								<td>2024-12-18</td>
							</tr>-->
							<c:if test="${!empty Nlist }">
								<c:forEach var="n" items="${Nlist }">
									<tr>
										<td>${n.notice_no }</td>
										<!-- <td onclick="location.href='/spike.com/noti_cont'">${n.notice_title }</td>-->
										
										<td>
										<a href="/spike.com/noti_cont?notice_no=${n.notice_no}&state=cont&page=${page}">${n.notice_title }</a>
										</td>
										<!--  <td onclick="location.href='newSubpage_noticeDetail.jsp?noticeId=${n.notice_no}'"> -->
										<!--  <a href="">${n.notice_title }</a> </td>-->

										<td>${n.notice_name }</td>
										<td><fmt:formatDate value="${n.created_date}"
												pattern="yyyy-MM-dd" /></td>
										<!-- 날짜 포맷 적용 -->
										<!--  <td>${n.created_date }</td> -->
										<td align ="center">${n.notice_hit }</td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>
				</div>

				<%--페이징(쪽나누기) --%>
			
				<div id="Nlist_paging">
					<%--검색전 페이징 --%>
					<c:if test="${(empty find_field) && (empty find_name)}">
						<c:if test="${page <= 1}">
      [이전]&nbsp;
     </c:if>
						<c:if test="${page>1}">
							<a href="notice?page=${page-1}">[이전]</a>&nbsp;
     </c:if>

						<%--쪽번호 출력부분 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a==page}"><${a}></c:if>
							<%--현재 페이지가 선택된 경우 --%>

							<c:if test="${a != page}">
								<%--현재 페이지가 선택 안된 경우 --%>
								<a href="notice?page=${a}">[${a}]</a>&nbsp;
      </c:if>
						</c:forEach>

						<c:if test="${page >= maxpage}">[다음]</c:if>
						<c:if test="${page < maxpage}">
							<a href="notice?page=${page+1}">다음</a>
						</c:if>
					</c:if>

					<%-- 검색후 페이징--%>
					<c:if test="${(!empty find_field) || (!empty find_name)}">
						<c:if test="${page <= 1}">
      [이전]&nbsp;
     </c:if>
						<c:if test="${page>1}">
							<a
								href="notice?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
     </c:if>

						<%--쪽번호 출력부분 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a==page}"><${a}></c:if>
							<%--현재 페이지가 선택된 경우 --%>

							<c:if test="${a != page}">
								<%--현재 페이지가 선택 안된 경우 --%>
								<a
									href="notice?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
      </c:if>
						</c:forEach>

						<c:if test="${page >= maxpage}">[다음]</c:if>
						<c:if test="${page < maxpage}">
							<a
								href="notice?page=${page+1}&find_field=${find_field}&find_name=${find_name}">다음</a>
						</c:if>
					</c:if>
				</div>


				<%--검색폼 --%>
				<div id="nFind_wrap">
					<select name="find_field">
						<option value="notice_title"
							<c:if test="${find_field =='notice_title'}">
      ${'selected'} </c:if>>제목</option>
						<option value="notice_cont"
							<c:if test="${find_field =='notice_cont'}">
      ${'selected'}</c:if>>내용</option>
					</select> <input type="search" name="find_name" size="14"
						value="${find_name}" />
					<button type="submit">검색</button>
				</div>
				
				<div id="Nlist_menu">
					<button type="button" onclick="location='notice?page=${page}';">글쓰기</button>
					<c:if test="${(!empty find_field) && (!empty find_name)}">
						<button type="button" onclick="location='notice?page=${page}';">전체목록</button>
					</c:if>
				</div>
				
			</form>
				</div>
				<!--  <div class="notice-pagination">
						<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a>
						<a href="#">3</a> <a href="#">&gt;</a>
					</div>-->

				<!-- //subpage-content-wrap -->

		</div>
	</div>


	<%@ include file="../include/shortfooter.jsp"%>
	<script src="/js/subpage.js"></script>
</body>
</html>

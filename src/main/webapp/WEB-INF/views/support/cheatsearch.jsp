<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사기 조회 결과</title>
<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/support/cheatsearch.css">
</head>
<%@ include file="../include/header.jsp"%>
<body>
	<div class="subpage-content">
		<h2 style="margin-left: 40px;">사기 조회 결과</h2>
		<table border="1" style="margin-left: 40px;">
			<thead>
				<tr>
					<th>신고 번호</th>
					<th>신고 날짜</th>
					<th>계좌번호</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${paging.content}">
					<c:if test="${empty paging.content}">
						<div class="alert">조회된 데이터가 없습니다.</div>
					</c:if>
					<tr>
						<td>${item.reportId}</td>
						<td><fmt:formatDate value="${item.reportDate}"
								pattern="yy/MM/dd HH:mm:ss" /></td>
						<td>${item.reportValue}</td>
						<td>${item.content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination" style="margin-left: 40px; margin-top: 20px;">
			<c:if test="${currentPage > 0}">
				<a
					href="?detailValue=${param.detailValue}&page=${currentPage - 1}&size=${pageSize}">이전</a>
			</c:if>

			<c:forEach begin="0" end="${totalPages - 1}" var="i">
				<a
					href="?detailValue=${param.detailValue}&page=${i}&size=${pageSize}"
					class="<c:if test='${i == currentPage}'>active</c:if>"> ${i + 1}
				</a>
			</c:forEach>

			<c:if test="${currentPage < totalPages - 1}">
				<a
					href="?detailValue=${param.detailValue}&page=${currentPage + 1}&size=${pageSize}">다음</a>
			</c:if>
		</div>
		<button style="margin-top: 20px; margin-bottom: 20px;" onclick="location.href='/spike.com/support/cheat'">돌아가기</button>
	</div>
	<%@ include file="../include/shortfooter.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 신고 관리</title>

<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/support/subpage.css">
<link rel="stylesheet" href="/css/manager/userManagement.css">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="subpageWrapper">
		<div class="subpage-main-container" style="justify-content: center;">
			<div class="subpage-content">
				<h2 style="margin-left: 40px;">계좌 신고 관리</h2>
				<table border="1" style="margin-left: 40px;">
					<thead>
						<tr>
							<th>신고 번호</th>
							<th>유형</th>
							<th>계좌번호</th>
							<th>신고 날짜</th>
							<th>내용</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
							<c:if test="${empty cheatlist.content}">
								<div class="alert">조회된 데이터가 없습니다.</div>
							</c:if>
						<c:forEach var="item" items="${cheatlist.content}">
							<tr>
								<td>${item.reportId}</td>
								<td>${item.reportType}</td>
								<td>${item.reportValue}</td>
								<td><fmt:formatDate value="${item.reportDate}" pattern="yy/MM/dd HH:mm:ss" /></td>
								<td>${item.content}</td>
								<td  style="color: green; font-weight: bold;">
								<c:choose>
									<c:when test="${fn:trim(item.status) == 'pending'}">
										<a href="/spike.com/admin/cheatDetail?accountId.accountId=${item.accountId.accountId}&reportId=${item.reportId}"  style="color: red">${item.status}</a>
									</c:when>
									<c:otherwise>
										${item.status}
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pagination" style="margin-left: 40px; margin-top: 20px;">
					<c:if test="${currentPage > 0}">
						<a href="?page=${currentPage - 1}&size=${pageSize}" style="margin-right: 10px; color: black;">이전</a>
					</c:if>
					<c:forEach begin="0" end="${totalPages - 1}" var="i">
						<a
							href="?page=${i}&size=${pageSize}"
							class="<c:if test='${i == currentPage}'>active</c:if>" style="margin-right: 10px; color: black;"> ${i + 1}
						</a>
					</c:forEach>

					<c:if test="${currentPage < totalPages - 1}">
						<a
							href="?page=${currentPage + 1}&size=${pageSize}" style="color: black;">다음</a>
					</c:if>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../include/shortfooter.jsp"%>
</body>
</html>
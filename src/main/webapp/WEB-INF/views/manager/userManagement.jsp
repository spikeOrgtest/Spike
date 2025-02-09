<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>

<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/support/subpage.css">
<link rel="stylesheet" href="/css/manager/userManagement.css">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">관리자 페이지</h3>
				<ul>
					<li><a href="/spike.com/ma">대시보드</a></li>
					<li><a href="/spike.com/userManagement">사용자관리</a></li>
					<li><a href="newsSubpage_product.jsp">계좌수정</a></li>
					<li><a href="newsSubpage_product.jsp">거래내역관리</a></li>
					<li><a href="/spike.com/loanManagement">대출관리</a></li>
					<li><a href="newsSubpage_notice.jsp">공지사항관리</a></li>
					<li><a href="newsSubpage_notice.jsp">보안관리</a></li>
				</ul>
			</div>
			<div class="subpage-content">
				<h2 style="margin-left: 40px;">사용자 관리</h2>
				<table border="1" style="margin-left: 40px;">
					<thead>
						<tr>
							<th>사용자 번호</th>
							<th>사용자 ID</th>
							<th>이름</th>
							<th>이메일</th>
							<th>상태</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
							<c:if test="${empty paging.content}">
								<div class="alert">조회된 데이터가 없습니다.</div>
							</c:if>
						<c:forEach var="item" items="${paging.content}">
							<tr>
								<td>${item.userId}</td>
								<td>${item.loginId}</td>
								<td>${item.name}</td>
								<td>${item.emailId}@${item.emailDomain}</td>
								<td>${item.status}</td>
								<td><a href="/spike.com/EditUser?userId=${item.userId}">수정</a></td>
								<td><a href="/spike.com/DeleteUser?userId=${item.userId}"
									onclick="return confirm('삭제 버튼을 누르면 모든 정보가 삭제됩니다.\n그래도 진행하시겠습니까?');">삭제</a></td>
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
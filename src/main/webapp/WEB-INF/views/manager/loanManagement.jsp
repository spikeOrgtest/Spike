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
		<div class="subpage-main-container" style="justify-content: center;">
			
			<div class="subpage-content">
				<h2 style="margin-left: 40px;">대출 관리</h2>
				<table border="1" style="margin-left: 40px;">
					<thead>
						<tr>
							<th>대출 ID</th>
							<th>사용자 ID</th>
							<th>이름</th>
							<th>대출 금액</th>
							<th>대출 상태</th>
							<th>신청 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="loan" items="${loanList}">
							<tr style="cursor:pointer;" onClick="location.href='/spike.com/admin/loanState?loanId=${loan.loanId}'">
								<td>${loan.loanId}</td>
								<td>${loan.owner.loginId}</td>
								<td>${loan.owner.name}</td>
								<td>${loan.loanAmount}</td>
								<td>${loan.loanState}</td>
								<td>${loan.createdDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>			
			
		</div>
	</div>
	<%@ include file="../include/shortfooter.jsp"%>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="subpage-content">
		<h2 style="margin-left: 40px;">사용자 관리</h2>
		<table border="1" style="margin-left: 40px;">
			<thead>
				<tr>
					<th>신고 번호</th>
					<th>유형</th>
					<th>전화번호/계좌번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${detaillist}">
					<tr>
						<td>${item.detailId}</td>
						<td>
						<c:if test="${item.detailType == 'phone'}">전화번호</c:if>
						<c:if test="${item.detailType == 'account'}">계좌번호</c:if>
						</td>
						<td>${item.detailValue}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
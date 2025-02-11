<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색 결과 - SPIKE</title>
<link href="/css/investment/stock_home.css" rel="stylesheet">
<link rel="stylesheet" href="/css/include/include.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<br />
	<div class="container">
		<h2>검색 결과</h2>
		<p>검색어: <strong>${query}</strong></p>
		<table class="stock-table">
			<thead>
				<tr>
					<th>종목명</th>
					<th>현재가</th>
					<th>총 발행 주식</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty searchResults}">
						<c:forEach var="stock" items="${searchResults}">
							<tr>
								<td>
									<a href="/spike.com/stock/${stock.stockId}/order">
										${stock.companyName} (${stock.tickerSymbol})
									</a>
								</td>
								<td>${stock.currentPrice} 원</td>
								<td>${stock.totalShares}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3">검색 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<br />
		<a href="/spike.com/stock/home" class="open-account-button">돌아가기</a>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주식 시장 - SPIKE</title>
<link href="/css/investment/stock_home.css" rel="stylesheet">
<link rel="stylesheet" href="/css/include/include.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<br />
	<div class="button-container">
		<!-- 증권 계좌 개설 버튼 -->
		<a href="/spike.com/securities-account/open"
			class="open-account-button"> 증권 계좌 개설하기 </a>
	</div>
	<div class="button-container">
		<!-- 증권 계좌 관리 버튼 -->
		<a href="/spike.com/securities-account/manage"
			class="open-account-button"> 증권 계좌 관리하기 </a>
	</div>
	<div class="button-container">
		<!-- 내 자산 확인하기 버튼 -->
		<a href="/spike.com/securities-account/my-assets"
			class="open-account-button">내 자산 확인하기</a>
	</div>
	<main class="main-content">
		

		<!-- 실시간 TOP 10 -->
		<div class="stock-list-container">
			<h2>실시간 TOP 10</h2>
			<table class="stock-table">
				<thead>
					<tr>
						<th>순위</th>
						<th>종목</th>
						<th>현재가</th>
						<th>총 발행 주식</th>

					</tr>
				</thead>
				<tbody>
					<!-- DB에서 가져온 데이터를 동적으로 표시 -->
					<c:choose>
						<c:when test="${not empty stockList}">
							<c:forEach var="stock" items="${stockList}" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<!-- 순위 -->
									<td><a href="/spike.com/stock/${stock.stockId}/order">
											${stock.companyName} (${stock.tickerSymbol}) </a></td>
									<!-- 종목 -->
									<td>${stock.currentPrice}\</td>
									<!-- 현재가 -->
									<td>${stock.totalShares}</td>
									<!-- 총 발행 주식 -->

								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">표시할 데이터가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

	</main>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>

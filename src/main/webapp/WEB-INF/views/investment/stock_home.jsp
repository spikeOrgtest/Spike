<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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
    <a href="/spike.com/securities-account/open" class="action-button">증권 계좌 개설</a>
    <a href="/spike.com/securities-account/manage" class="action-button">계좌 관리</a>
    <a href="/spike.com/securities-account/withdraw" class="action-button">출금하기</a>
    <a href="/spike.com/securities-account/my-assets" class="action-button">내 자산 확인</a>
</div>
	

	
	<!-- 검색 폼 -->
	<div class="search-container">
		<form action="/spike.com/stock/search" method="get">
			<input type="text" name="query" placeholder="종목 이름을 검색하세요...">
			<button type="submit">검색</button>
		</form>
	</div>
	
	<main class="main-content">
		<!-- TOP 10 주식 목록 (정렬된 데이터 사용) -->
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
					<c:forEach var="stock" items="${topStocks}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>
								<a href="/spike.com/stock/${stock.stockId}/order">
									${stock.companyName} (${stock.tickerSymbol})
								</a>
							</td>
							<td>${stock.currentPrice} 원</td>
							<td>${stock.totalShares}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<!-- (검색 결과는 별도의 stock_search_results.jsp에서 처리) -->
	</main>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>

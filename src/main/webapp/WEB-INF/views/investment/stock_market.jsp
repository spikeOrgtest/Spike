<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주식 시장 - SPIKE</title>
<link href="/css/investment/stock_market.css" rel="stylesheet">

<!-- Chart.js 및 Font Awesome -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="button-container">
		<!-- 증권 계좌 개설 버튼 -->
		<a href="/spike/securities-account/open" class="open-account-button">
			증권 계좌 개설하기 </a>
	</div>
	<main class="main-content">
		<!-- 주요 경제 지수 -->
		<div class="economic-indices-container">
			<h3>주요 경제 지수</h3>
			<div class="indices">
				<!-- 코스피 -->
				<div class="index-item">
					<div class="index-header">
						<span>코스피 🇰🇷</span>
						<canvas id="kospiChart"></canvas>
					</div>
					<div class="index-data">
						<span class="current-value">2,495.72</span> <span
							class="change positive">+7.08 (0.2%)</span>
					</div>
				</div>
				<!-- 코스닥 -->
				<div class="index-item">
					<div class="index-header">
						<span>코스닥 🇰🇷</span>
						<canvas id="kosdaqChart"></canvas>
					</div>
					<div class="index-data">
						<span class="current-value">718.02</span> <span
							class="change positive">+0.06 (0.00%)</span>
					</div>
				</div>
				<!-- 나스닥 -->
				<div class="index-item">
					<div class="index-header">
						<span>나스닥 🇺🇸</span>
						<canvas id="nasdaqChart"></canvas>
					</div>
					<div class="index-data">
						<span class="current-value">19,864.98</span> <span
							class="change positive">+243.3 (1.2%)</span>
					</div>
				</div>
				<!-- S&P 500 -->
				<div class="index-item">
					<div class="index-header">
						<span>S&P 500 🇺🇸</span>
						<canvas id="sp500Chart"></canvas>
					</div>
					<div class="index-data">
						<span class="current-value">5,975.38</span> <span
							class="change positive">+32.91 (0.6%)</span>
					</div>
				</div>
				<!-- VIX -->
				<div class="index-item">
					<div class="index-header">
						<span>VIX 🇺🇸</span>
						<canvas id="vixChart"></canvas>
					</div>
					<div class="index-data">
						<span class="current-value">16.04</span> <span
							class="change negative">-0.09 (-0.5%)</span>
					</div>
				</div>
			</div>
		</div>

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
						<th>유통 가능한 주식</th>
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
									<td><a href="/spike/stock/${stock.stockCode}/order">
											${stock.companyName} (${stock.tickerSymbol}) </a></td>
									<!-- 종목 -->
									<td>${stock.currentPrice}$</td>
									<!-- 현재가 -->
									<td>${stock.totalShares}</td>
									<!-- 총 발행 주식 -->
									<td>${stock.availableShares}</td>
									<!-- 유통 가능한 주식 -->
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
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${stock.companyName}-주식거래</title>
<link href="/css/investment/stock_order.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<!-- 차트 섹션 -->
		<div class="chart-section">
			<div class="chart-header">
				<h3>${stock.companyName}(${stock.tickerSymbol})</h3>
				<p>시작가: ${stock.initialPrice}&#8361 | 현재가:
					${stock.currentPrice}&#8361</p>
			</div>
			<div class="chart-box">
				<canvas id="candleChart" width="800" height="400"></canvas>
			</div>
		</div>

		<!-- 실시간 시세 섹션 -->
		<div class="details-section">
			<div class="details-header">
				<h3>${stock.companyName}실시간시세</h3>
				<p>전체 발행 주식: ${stock.totalShares}주</p>
			</div>
			<table class="details-table">
				<tr>
					<th>체결가</th>
					<th>체결량 (주)</th>
					<th>등락률</th>
				</tr>
				<tr>
					<td>${stock.currentPrice}&#8361</td>
					<td>1,000</td>
					<td>+1.23%</td>
				</tr>
				<tr>
					<td>${stock.currentPrice}&#8361</td>
					<td>2,500</td>
					<td>-0.89%</td>
				</tr>
			</table>
		</div>

		<!-- 주문 섹션 -->
		<div class="order-section">
			<h3>${stock.companyName}-주문하기</h3>
			<div class="order-type">
				<button id="buy-btn" class="active">구매</button>
				<button id="sell-btn">판매</button>
			</div>

			<!-- 구매 폼 -->
			<form id="buy-form" class="order-form" action="/spike.com/trade/buy"
				method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="hidden" name="stockId"
					value="${stock.stockId}"> <label>구매 가격</label> <input
					type="text" name="price" value="${stock.currentPrice}원"> <label>수량</label>
				<input type="number" name="quantity" value="0">
				<button type="submit">구매하기</button>
			</form>



			<!-- 판매 폼 -->
			<p>디버깅: 판매자 계좌 ID = ${securitiesAccount != null ? securitiesAccount.accountId : '계좌 정보 없음'}</p>

			<form id="sell-form" class="order-form"
				action="/spike.com/listing/sell" method="post"
				style="display: none;">

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				
				<input type="hidden" name="sellerAccountId"
					value="${securitiesAccount.accountId}"> <input
					type="hidden" name="stockId" value="${stock.stockId}"> <label>판매
					가격</label> <input type="text" name="price" placeholder="판매 가격 입력">
				<label>판매 수량</label> <input type="number" name="quantity"
					placeholder="판매 수량 입력">
				<button type="submit">판매하기</button>
			</form>


		</div>

	</div>

	<script>
		document
				.getElementById("buy-btn")
				.addEventListener(
						"click",
						function() {
							document.getElementById("buy-form").style.display = "block";
							document.getElementById("sell-form").style.display = "none";
						});

		document
				.getElementById("sell-btn")
				.addEventListener(
						"click",
						function() {
							document.getElementById("buy-form").style.display = "none";
							document.getElementById("sell-form").style.display = "block";
						});
	</script>
</body>
</html>

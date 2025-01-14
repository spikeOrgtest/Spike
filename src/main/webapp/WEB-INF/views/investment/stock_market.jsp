<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주식 시장 - SPIKE</title>
<link href="/css/investment/stock_market.css" rel="stylesheet">



<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>

 <!-- 차트 인용 CDN -->

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<script src="/Project_SPIKE/assets/js/chart.js"></script>

</head>
<body>
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
			<div class="tabs">
				<button class="tab active" data-tab="domestic">국내</button>
				<button class="tab" data-tab="global">미국</button>
			</div>
			<div class="filters">
				<button class="filter active">거래량</button>
				<button class="filter">상승</button>
				<button class="filter">하락</button>
			</div>
			<table class="stock-table">
				<thead>
					<tr>
						<th>순위</th>
						<th>종목</th>
						<th>현재가</th>
						<th>거래량 · 대금</th>
						<th>시가총액</th>
						<th>즐겨찾기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><img src="/assets/img/kodex.png" alt="KODEX 로고"
							class="stock-logo"> KODEX 200선물인버스2X</td>
						<td>2,385 <span class="change positive">(+0.00%)</span></td>
						<td>101,170,565 <span>237억</span></td>
						<td>1조 733억</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>2</td>
						<td><img src="/assets/img/mdstec.png" alt="MDS테크 로고"
							class="stock-logo"> MDS테크</td>
						<td>1,332 <span class="change positive">(+21.06%)</span></td>
						<td>70,300,169 <span>1235억</span></td>
						<td>1,235억</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>3</td>
						<td><img src="/assets/img/samsung.png" alt="삼성전자 로고"
							class="stock-logo"> 삼성전자</td>
						<td>70,000 <span class="change positive">(+1.20%)</span></td>
						<td>53,722,824 <span>2조 266억</span></td>
						<td>350조</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>4</td>
						<td><img src="/assets/img/apple.png" alt="애플 로고"
							class="stock-logo"> 애플</td>
						<td>150,000 <span class="change negative">(-0.50%)</span></td>
						<td>48,339,489 <span>1조 2000억</span></td>
						<td>200조</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>5</td>
						<td><img src="/assets/img/lg.png" alt="LG전자 로고"
							class="stock-logo"> LG전자</td>
						<td>100,000 <span class="change positive">(+0.80%)</span></td>
						<td>40,117,115 <span>9500억</span></td>
						<td>35조</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>6</td>
						<td><img src="/assets/img/naver.png" alt="네이버 로고"
							class="stock-logo"> 네이버</td>
						<td>200,000 <span class="change positive">(+2.00%)</span></td>
						<td>25,000,000 <span>1조 500억</span></td>
						<td>50조</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>7</td>
						<td><img src="/assets/img/kakao.png" alt="카카오 로고"
							class="stock-logo"> 카카오</td>
						<td>95,000 <span class="change positive">(+0.70%)</span></td>
						<td>20,000,000 <span>8500억</span></td>
						<td>15조</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>8</td>
						<td><img src="/assets/img/tesla.png" alt="테슬라 로고"
							class="stock-logo"> 테슬라</td>
						<td>800,000 <span class="change positive">(+3.50%)</span></td>
						<td>10,000,000 <span>3조</span></td>
						<td>800조</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>9</td>
						<td><img src="/assets/img/hyundai.png" alt="현대차 로고"
							class="stock-logo"> 현대차</td>
						<td>180,000 <span class="change negative">(-1.00%)</span></td>
						<td>5,000,000 <span>1조</span></td>
						<td>40조</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
					<tr>
						<td>10</td>
						<td><img src="/assets/img/sk.png" alt="SK 로고"
							class="stock-logo"> SK하이닉스</td>
						<td>130,000 <span class="change positive">(+0.60%)</span></td>
						<td>3,500,000 <span>6000억</span></td>
						<td>30조</td>
						<td><i class="fas fa-star"></i></td>
					</tr>
				</tbody>
			</table>
			<button class="more-button">더 보기</button>
		</div>
	</main>
</body>
</html>

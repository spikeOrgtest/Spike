<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Gold - SPIKE</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link href="assets/css/include.css" rel="stylesheet">
<link href="assets/css/mygold.css" rel="stylesheet">
<script src="assets/js/gold.js" defer></script>
</head>
<body>

	<jsp:include page="include/header.jsp" />

	<main class="main">
		<div class="grid-container">
			<div class="grid-item gold-price">
				<h2>현재 순금 시세</h2>
				<!-- 금 시세 정보 -->
				<p id="gold-price">내가 살 때:523,000원</p>
				<p id="gold-price">내가 팔 때:450,000원</p>
				<p>
					<span class="positive">+2.5%</span> (지난주 대비)
				</p>


				<!-- 환율 정보 -->
				<h3>환율 정보</h3>
				<ul>
					<li>USD: ₩1,250 <span class="negative">-0.5%</span></li>
					<li>EUR: ₩1,400 <span class="positive">+0.3%</span></li>
				</ul>

				<!-- 금 투자 심리지표 -->
				<h3>금 투자 심리지표</h3>
				<div class="sentiment-gauge">
					<canvas id="sentimentChart"></canvas>
					<p>
						현재 심리 상태: <span id="sentiment-status">탐욕 (75%)</span>
					</p>
				</div>
			</div>

			<!-- 2. 나의 금 보유 현황 섹션 -->
			<div class="grid-item my-gold">
				<h2>나의 금 보유 현황</h2>
				<p>
					<strong>총 보유량:</strong> 200g
				</p>
				<p>
					<strong>총 가치:</strong> ₩15,000,000
				</p>

				<!-- 보유 상품 세분화 -->
				<div class="gold-details">
					<div class="gold-item">
						<h3>골드바 10g</h3>
						<p>보유량: 5개</p>
						<p>가치: ₩3,750,000</p>
					</div>
					<div class="gold-item">
						<h3>골드바 50g</h3>
						<p>보유량: 3개</p>
						<p>가치: ₩11,250,000</p>
					</div>
					<div class="gold-item">
						<h3>순금반지 (3.75g)</h3>
						<p>보유량: 2개</p>
						<p>가치: ₩562,500</p>
					</div>
				</div>
			</div>

			<!-- 3. 추천 금 상품 섹션 -->
			<div class="grid-item recommended-gold">
				<h2>추천 금 상품</h2>
				<div class="gold-product">
					<h3>골드바 10g</h3>
					<p>₩750,000</p>
					<a href="#" class="btn">구매하기</a>
				</div>
				<div class="gold-product">
					<h3>골드바 100g</h3>
					<p>₩7,500,000</p>
					<a href="#" class="btn">구매하기</a>
				</div>
				<div class="gold-product">
					<h3>골드바 1kg</h3>
					<p>₩75,000,000</p>
					<a href="#" class="btn">구매하기</a>
				</div>
			</div>
		</div>

	</main>

	<jsp:include page="include/footer.jsp" />
</body>
</html>
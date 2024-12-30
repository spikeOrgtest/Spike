<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Crypto Dashboard</title>
<link href="assets/css/include.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/mycrypto.css">
</head>
<body>

	<jsp:include page="../include/header.jsp" />

	<!-- 메인 콘텐츠 -->
	<div class="container">
		<!-- Card 1: 주요지표 -->
		<div class="card half">
			<h3>주요지표</h3>
			<p>
				<strong>Bitcoin (BTC):</strong> ₩135,678,296.15
			</p>
			<p>
				24시간 변화량: <span style="color: green;">+2.5%</span>
			</p>
			<p>
				<strong>Ethereum (ETH):</strong> ₩4,630,932.26
			</p>
			<p>
				24시간 변화량: <span style="color: red;">-1.2%</span>
			</p>
		</div>

		<!-- Card 2: 현재 보유 코인 -->
		<div class="card half">
			<h3>현재 보유 코인</h3>
			<p>
				<strong>Bitcoin (BTC):</strong> 0.1 BTC → ₩13,567,829.62
			</p>
			<p>
				<strong>Ethereum (ETH):</strong> 2 ETH → ₩9,261,864.52
			</p>
			<hr>
			<p>
				<strong>총 보유 가치:</strong> ₩22,829,694.14
			</p>
		</div>

		<!-- Card 3: 코인시장 -->
		<div class="card full" id="coin-market">
			<h3>코인시장</h3>
			<div id="crypto-cards">
				<!-- Crypto Prices Section -->
			</div>
		</div>
	</div>



	<!-- 수정된 JavaScript 경로 -->
	<script src="assets/js/crypto.js"></script>
	<script>
        // crypto.js 데이터를 동적으로 삽입
        const marketDataDiv = document.getElementById("crypto-cards");

        cryptoData.forEach((crypto) => {
            const cryptoCard = document.createElement("div");
            cryptoCard.classList.add("crypto-card");
            cryptoCard.innerHTML = `
                <h5>${crypto.name} (${crypto.ticker})</h5>
                <p><strong>₩${crypto.price.toLocaleString()}</strong></p>
                <p>24시간 변화량: <span style="color: ${crypto.change.includes('+') ? 'green' : 'red'};">${crypto.change}</span></p>
            `;
            marketDataDiv.appendChild(cryptoCard);
        });
    </script>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>
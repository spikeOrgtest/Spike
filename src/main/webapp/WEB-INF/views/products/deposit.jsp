<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SPIKE 예금</title>
<link rel="stylesheet" href="../assets/css/savings.css" />
<link rel="stylesheet" href="../assets/css/include.css"> 
</head>
<body>
	
	<jsp:include page="../include/pheader.jsp" />

	<nav class="top-menu">
		<div class="container">
			<a href="products.jsp" class="logo">SPIKE</a>
			<ul>
				<li><a href="deposit.jsp">예금</a></li>
				<li><a href="savings.jsp">적금</a></li>
				<li><a href="loan.jsp">대출</a></li>
				<li><a href="card.jsp">카드</a></li>
				<li><a href="newmember.jsp">계좌 개설</a></li>
			</ul>
		</div>
	</nav>
		
	<main>
        <section class="hero">
            <div class="container">
                <div class="carousel">
                    <div class="carousel-item active">
                        <h1>SPIKE 예금 상품</h1>
                        <p>목표를 향한 첫걸음, SPIKE 예금과 함께 시작하세요.</p>
                    </div>
                    <div class="carousel-item">
                        <h1>특별 적금 상품</h1>
                        <p>더 높은 금리로 더 빠르게 목표 달성!</p>
                    </div>
                    <div class="carousel-item">
                        <h1>청년 저축 적금</h1>
                        <p>청년들의 미래를 위한 특별한 혜택!</p>
                    </div>
                </div>
                <div class="carousel-controls">
                    <button class="prev">&lt;</button>
                    <button class="next">&gt;</button>
                </div>
				<p id="carouselDescription"></p>
				<button class="btn">자세히 보기</button>
            </div>
        </section>
        <section class="products">
            <div class="container">
                <h2>특별 예금 상품</h2>
                <div class="product-grid" id="productGrid">
                    <a href="Subpage_D1.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 예금</h3>
                            <p>많은 이자를 원한다면 SPIKE 예금으로 시작해보세요.</p>
                            <ul class="card-features">
                                <li>최대 연 5% 금리!</li>
                                <li>자유로운 입출금 가능</li>
                                <li>만기 자동 연장</li>
                            </ul>
                        </div>
                    </a>
                    <a href="Subpage_D2.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>IRP (Individual Retirement Pension)</h3>
                            <p>목표 달성을 위한 최고의 선택, 드림 적금과 함께하세요.</p>
                            <ul class="card-features">
                                <li>목표 금액 설정 가능</li>
                                <li>목표 달성 시 특별 금리 혜택</li>
                                <li>자동 이체 기능 지원</li>
                            </ul>
                        </div>
                    </a>
                    <a href="Subpage_D3.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>1+1 예금</h3>
                            <p>더욱 풍성하게, 플러스 적금으로 미래를 준비하세요.</p>
                            <ul class="card-features">
                                <li>매월 추가 금리 적립</li>
                                <li>우대 금리 적용</li>
                                <li>만기 시 특별 경품 제공</li>
                            </ul>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        <section class="products-2">
            <div class="container">
                <h2>예금 상품 목록</h2>
                <div class="product-grid" id="productGrid">
                    <a href="Subpage_D4.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>정기 예금</h3>
                            <p>종자돈 모으기는 예금으로 준비하세요.</p>
                            <ul class="card-features">
                                <li>최대 연 5% 금리!</li>
                                <li>자유로운 입출금 가능</li>
                                <li>만기 자동 연장</li>
                            </ul>
                        </div>
                    </a>
                    <a href="Subpage_D5.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>퇴직연금예금</h3>
                            <p>은퇴 후 최고의 선택, 퇴직연금예금과 함께하세요.</p>
                            <ul class="card-features">
                                <li>목표 금액 설정 가능</li>
                                <li>목표 달성 시 특별 금리 혜택</li>
                                <li>자동 이체 기능 지원</li>
                            </ul>
                        </div>
                    </a>
                    <a href="Subpage_D6.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>평생가족 예금</h3>
                            <p>SPIKE와 함께, 가족처럼!</p>
                            <ul class="card-features">
                                <li>매월 추가 금리 적립</li>
                                <li>우대 금리 적용</li>
                                <li>만기 시 특별 경품 제공</li>
                            </ul>
                        </div>
                    </a>
                </div>
            </div>
        </section>
		
	</main>
	<jsp:include page="../include/pfooter.jsp"/>
	<script src="../assets/js/savings.js"></script>
</body>
</html>


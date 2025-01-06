<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SPIKE 적금</title>
<link rel="stylesheet" href="../assets/css/savings.css" />
<link rel="stylesheet" href="../assets/css/include.css"> 
<script src="https://unpkg.com/lucide@latest"></script>
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
                        <h1>SPIKE 대출 상품</h1>
                        <p>목표를 향한 첫걸음, SPIKE 대출과 함께 시작하세요.</p>
                    </div>
                    <div class="carousel-item">
                        <h1>특별 적금 상품</h1>
                        <p>더 높은 금리로 더 빠르게 목표 달성!</p>
                    </div>
                    <div class="carousel-item">
                        <h1>청년 전용 대출</h1>
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
                <h2>특별 대출 상품</h2>
                <div class="product-grid" id="productGrid">
                    <a href="Subpage_L1.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 학자금 대출</h3>
                            <p>공부만하기도 바쁜 학생들을 위한 대출!</p>
                            <ul class="card-features">
                                <li>최대 연 5% 금리!</li>
                                <li>자유로운 입출금 가능</li>
                                <li>만기 자동 연장</li>
                            </ul>
                        </div>
                    </a>
                    <a href="Subpage_L2.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 비상금 대출</h3>
                            <p>급전이 필요할 때 언제든지! 누구나!</p>
                            <ul class="card-features">
                                <li>목표 금액 설정 가능</li>
                                <li>목표 달성 시 특별 금리 혜택</li>
                                <li>자동 이체 기능 지원</li>
                            </ul>
                        </div>
                    </a>
                    <a href="Subpage_L3.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 직장인 대출</h3>
                            <p>더욱 풍성하게, 직장인 대출로 미래를 준비하세요.</p>
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
                <h2>대출 상품 목록</h2>
                <div class="product-grid" id="productGrid">
                    <a href="Subpage_L4.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 대출</h3>
                            <p>대출이 필요할 때는 SPIKE!</p>
                            <ul class="card-features">
                                <li>최대 연 5% 금리!</li>
                                <li>자유로운 입출금 가능</li>
                                <li>만기 자동 연장</li>
                            </ul>
                        </div>
                    </a>
                    <a href="Subpage_L5.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>주택담보 대출</h3>
                            <p>내 집마련 을 위한 최고의 선택!</p>
                            <ul class="card-features">
                                <li>목표 금액 설정 가능</li>
                                <li>목표 달성 시 특별 금리 혜택</li>
                                <li>자동 이체 기능 지원</li>
                            </ul>
                        </div>
                    </a>
                    <a href="Subpage_L6.jsp" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>소상공인 대출</h3>
                            <p>자영업자들을 위한 대출 상품!</p>
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


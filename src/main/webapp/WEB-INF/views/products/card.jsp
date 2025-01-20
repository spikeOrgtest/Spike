<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SPIKE 카드</title>
<link rel="stylesheet" href="../../css/product/savings.css" />
<link rel="stylesheet" href="../../css/include/include.css"> 
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
                        <h1>SPIKE 카드 상품</h1>
                        <p>목표를 향한 첫걸음, SPIKE 적금과 함께 시작하세요.</p>
                    </div>
                    <div class="carousel-item">
                        <h1>특별 카드 상품</h1>
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
                <h2>특별 카드 상품</h2>
                <div class="product-grid" id="productGrid">
                    <a href="card/subpage_c1" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 청년 카드</h3>
                            <img src="../../images/product/YOUTHCARD.png" width="50%" height="75%"/>
                        </div>
                    </a>
                    <a href="card/subpage_c2" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 플래티넘 카드</h3>
                            <img src="../../images/product/PLATINUMCARD.png" width="50%" height="75%"/>
                        </div>
                    </a>
                    <a href="card/subpage_c3" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 디지털 카드</h3>
                            <img src="../../images/product/DIGITALCARD.png" width="50%" height="75%"/>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        <section class="products-2">
            <div class="container">
                <h2>카드 상품 목록</h2>
                <div class="product-grid" id="productGrid">
                    <a href="card/subpage_c4" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 카드</h3>
                            <img src="../../images/product/SPIKECARD.png" width="50%" height="75%"/>
                        </div>
                    </a>
                    <a href="card/subpage_c5" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE TRAVEL 카드</h3>
                            <img src="../../images/product/TRAVELCARD.jpg" width="50%" height="75%"/>
                        </div>
                    </a>
                    <a href="card/subpage_c6" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>플러스 카드</h3>
                            <img src="../../images/product/PLUSCARD.png" width="50%" height="75%"/>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        
    </main>
	<jsp:include page="../include/pfooter.jsp"/>
	<script src="../../../js/savings.js"></script>
</body>
</html>


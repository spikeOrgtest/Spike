<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SPIKE</title>
<link rel="stylesheet" href="assets/css/product.css">
<link rel="stylesheet" href="assets/css/include.css"> 

</head>
<body>

	<jsp:include page="include/header.jsp" />

	<nav class="top-menu">
		<div class="container">
			<a href="products.jsp" class="logo">SPIKE</a>
			<ul>
				<li><a href="./products/deposit.jsp">예금</a></li>
				<li><a href="./products/savings.jsp">적금</a></li>
				<li><a href="./products/loan.jsp">대출</a></li>
				<li><a href="./products/card.jsp">카드</a></li>
				<li><a href="./products/newmember.html">계좌 개설</a></li>
			</ul>
		</div>
	</nav>

	<main>
		<section class="carousel">
			<div class="container">
				<h1 id="carouselTitle"></h1>
				<div class="carousel-controls">
					<button class="prev">&lt;</button>
					<button class="next">&gt;</button>
				</div>
				<p id="carouselDescription"></p>
				<button class="btn">자세히 보기</button>
			</div>
		</section>

		<section class="products bg-gray">
			<div class="container">
				<h2>
					SPIKE의 <span class="highlight">추천 상품</span>을 소개합니다.
				</h2>
				<div class="product-grid" id="regularProducts"></div>
			</div>
		</section>

		<section class="products">
			<div class="container">
				<h2>
					<span class="highlight">이달의 상품</span>
				</h2>
				<div class="product-grid" id="monthlyProducts"></div>
			</div>
		</section>

		<section class="search bg-blue">
			<div class="container">
				<h2>상품 검색</h2>
				<div class="search-bar">
					<input type="text" placeholder="원하는 상품을 검색하세요">
					<button class="search-btn">
						<svg viewBox="0 0 24 24" class="icon">
                            <path
								d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
					</button>
				</div>
			</div>
		</section>

		<section class="icon-menu bg-gray">
			<div class="container">
				<a href="./products/deposit.jsp" class="icon-item">
					<div class="icon-circle">
						<svg viewBox="0 0 24 24" class="icon">
                            <path d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
					</div> <span>예금</span>
				</a>
				<a href="./products/savings.jsp" class="icon-item">
					<div class="icon-circle">
						<svg viewBox="0 0 24 24" class="icon">
                            <path d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
					</div> <span>적금</span>
				</a>
				 <a href="./products/loan.jsp" class="icon-item">
					<div class="icon-circle">
						<svg viewBox="0 0 24 24" class="icon">
                            <path d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
					</div> <span>대출</span>
				</a> <a href="./products/card.jsp" class="icon-item">
					<div class="icon-circle">
						<svg viewBox="0 0 24 24" class="icon">
                            <path d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
					</div> <span>카드</span>
				</a> <a href="newmember.html" class="icon-item">
					<div class="icon-circle">
						<svg viewBox="0 0 24 24" class="icon">
                            <path d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
					</div> <span>계좌개설</span>
				</a>
			</div>
		</section>
		
		<jsp:include page="include/footer.jsp"/>

	<script src="assets/js/product.js"></script>
</body>
</html>
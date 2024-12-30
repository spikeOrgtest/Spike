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
            </div>
        </section>
        <section class="products">
            <div class="container">
                <h2>특별 카드 상품</h2>
                <div class="product-grid" id="productGrid">
                    <a href="#" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 청년 카드</h3>
                            <p>사회 초년생인 당신을 위한 카드!</p>
                            <ul class="card-features">
                                <li>학업, 첫 직장 생활을 위한 특별한 혜택</li>
                                <li>다양한 생활 할인과 적립 혜택 제공</li>
                                <li>초저금리로 신용카드 한도 지원, 부담 없이 시작!</li>
                            </ul>
                        </div>
                    </a>
                    <a href="#" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 플래티넘 카드</h3>
                            <p>스페셜한 당신을 위한 카드!</p>
                            <ul class="card-features">
                                <li>고급 레스토랑 및 쇼핑몰에서의 특별 할인</li>
                                <li>프리미엄 서비스와 VIP 전용 혜택 제공</li>
                                <li>해외 여행 시, 공항 라운지 이용과 면세 혜택까지!</li>
                            </ul>
                        </div>
                    </a>
                    <a href="#" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 디지털 카드</h3>
                            <p>최강 온라인 혜택!</p>
                            <ul class="card-features">
                                <li>인기 온라인 쇼핑몰에서 최대 10% 할인</li>
                                <li>다양한 디지털 콘텐츠 구독 서비스 특별 혜택</li>
                                <li>실시간 온라인 결제 알림, 보안 강화를 통한 안전한 거래</li>
                            </ul>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        <section class="products-2">
            <div class="container">
                <h2>카드 상품 목록</h2>
                <div class="product-grid" id="productGrid">
                    <a href="#" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE 카드</h3>
                            <p>혜택은 풍성하게, 수수료는 적게!</p>
                            <ul class="card-features">
                                <li>기본 적립 1% + 다양한 제휴 혜택</li>
                                <li>연회비 부담 없고, 해외 이용 수수료 ZERO</li>
                                <li>월별, 연간 한도 내에서 추가 할인 혜택 제공</li>
                            </ul>
                        </div>
                    </a>
                    <a href="#" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>SPIKE AIR 카드</h3>
                            <p>여행을 좋아하는 당신을 위한 최고의 선택!</p>
                            <ul class="card-features">
                                <li>항공권 할인 및 여행지에서의 특별 혜택</li>
                                <li>호텔 예약 시 최대 15% 할인 제공</li>
                                <li>해외 여행 시, 무료 여행자 보험 제공</li>
                            </ul>
                        </div>
                    </a>
                    <a href="#" class="product-card">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <h3>플러스 카드</h3>
                            <p>포인트 적립 플러스! 혜택 플러스!</p>
                            <ul class="card-features">
                                <li>모든 결제에 대해 포인트 2배 적립</li>
                                <li>특별 이벤트 시 더 많은 포인트 보너스 제공</li>
                                <li>적립한 포인트로 쇼핑, 음식, 여행 등 다양한 사용처 제공</li>
                            </ul>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        <section class="bgPhoto">
            <div class="inner">
                <div class="copyArea">
                    <p class="lg">금융상품에 대해 더 궁금하신가요?</p>
                    <p class="mb hiddenMb">SPIKE 금융전문가에게 문의해보세요. 정확하고 친절하게 안내해 드릴게요.</p>
                    <p class="mb visibleMb">빠르고 친절하게 안내해 드릴게요.</p>
                    <p class="sm">(평일 오전 9시 ~ 오후 5시)</p>
                    <p>1588-0000</p>
                </div>
            </div>
        </section>
    </main>
	<jsp:include page="../include/pfooter.jsp"/>
	<script src="../assets/js/savings.js"></script>
</body>
</html>


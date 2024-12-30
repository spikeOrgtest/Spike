<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Investment Opportunities - SPIKE</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
	<link href="assets/css/include.css" rel="stylesheet">
	<link href="assets/css/investment.css" rel="stylesheet">


</head>
<body>
    
    <jsp:include page="../include/header.jsp"/>

    <!-- 메인 콘텐츠 -->
    <main class="main">
        <section id="investment" class="investment">
            <div class="container">
            <br/>
                <!-- 주식 카드 -->
                <div class="card" id="stocks">
                    <i class="fas fa-chart-line"></i>
                    <div class="card-content">
                        <h2>주식</h2>
                        <p>주식은 높은 수익 가능성을 가진 대표적인 투자 자산입니다.</p>
                        <button class="cta-button" onclick="location.href='mystocks.jsp'">더 알아보기</button>
                    </div>
                </div>
                <!-- 금 카드 -->
                <div class="card" id="gold">
                    <i class="fas fa-coins"></i>
                    <div class="card-content">
                        <h2>금</h2>
                        <p>금은 안전한 투자 자산으로 경제 불확실성 속에서 빛납니다.</p>
                        <button class="cta-button" onclick="location.href='mygold.jsp'">더 알아보기</button>
                    </div>
                </div>
                <!-- 암호화폐 카드 -->
                <div class="card" id="cryptocurrency">
                    <i class="fab fa-bitcoin"></i>
                    <div class="card-content">
                        <h2>암호화폐</h2>
                        <p>암호화폐는 탈중앙화된 새로운 투자 수단으로 각광받고 있습니다.</p>
                        <button class="cta-button" onclick="location.href='mycrypto.jsp'">더 알아보기</button>
                    </div>
                </div>
            </div>
        </section>
    </main>
        <jsp:include page="../include/footer.jsp"/>
    
</body>
</html>

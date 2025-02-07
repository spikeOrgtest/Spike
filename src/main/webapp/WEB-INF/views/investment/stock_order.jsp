<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                <p>시작가: ${stock.initialPrice}&#8361; | 현재가: ${stock.currentPrice}&#8361;</p>
            </div>
            <div class="chart-box">
                <canvas id="candleChart" width="800" height="400"></canvas>
            </div>
        </div>

        <!-- 판매 주문 목록 섹션 시작 -->
        <div class="listing-section">
            <div class="listing-header">
                <h3>${stock.companyName}판매 주문</h3>
                <p>전체 발행 주식: ${stock.totalShares}주</p>
            </div>
            <table class="listing-table">
                <thead>
                    <tr>
                        <th>판매가격</th>
                        <th>수량</th>
                        <th>판매자 계좌</th>
                        <th>구매</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty saleOrders}">
                        <tr>
                            <td colspan="4">현재 판매 주문이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:forEach var="order" items="${saleOrders}">
                        <!-- 현재 페이지의 주식과 일치하는 매물만 출력 -->
                        <c:if test="${order.stock.stockId == stock.stockId}">
                            <tr>
                                <td>${order.price}&#8361;</td>
                                <td>${order.quantity}</td>
                                <td>${order.seller.accountId}</td>
                                <td>
                                    <!-- 전체 구매 폼: 매물에 등록된 수량 전체 구매 -->
                                    <form action="/spike.com/listing/buy" method="post" style="display:inline;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="buyerAccountId" value="${securitiesAccount.accountId}" />
                                        <input type="hidden" name="listingId" value="${order.id}" />
                                        <input type="hidden" name="quantity" value="${order.quantity}" />
                                        <button type="submit">전체 구매</button>
                                    </form>
                                    <!-- 부분 구매 폼: 사용자가 원하는 수량 입력 -->
                                    <form action="/spike.com/listing/buy" method="post" style="display:inline; margin-left:10px;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="buyerAccountId" value="${securitiesAccount.accountId}" />
                                        <input type="hidden" name="listingId" value="${order.id}" />
                                        <input type="number" name="quantity" min="1" max="${order.quantity}" placeholder="수량" style="width:60px;" />
                                        <button type="submit">부분 구매</button>
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- 판매 주문 목록 섹션 끝 -->

        <!-- 주문 섹션 -->
        <div class="order-section">
            <h3>${stock.companyName}-주문하기</h3>
            <div class="order-type">
                <button id="buy-btn" class="active">구매</button>
                <button id="sell-btn">판매</button>
            </div>

            <!-- 기존 구매 폼 (필요에 따라 유지 또는 제거) -->
            <form id="buy-form" class="order-form" action="/spike.com/trade/buy" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="stockId" value="${stock.stockId}">
                <label>구매 가격</label>
                <input type="text" name="price" value="${stock.currentPrice}원">
                <label>수량</label>
                <input type="number" name="quantity" value="0">
                <button type="submit">구매하기</button>
            </form>

            <!-- 판매 폼 -->
            <p>디버깅: 판매자 계좌 ID = ${securitiesAccount != null ? securitiesAccount.accountId : '계좌 정보 없음'}</p>
            <form id="sell-form" class="order-form" action="/spike.com/listing/sell" method="post" style="display: none;">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="sellerAccountId" value="${securitiesAccount.accountId}">
                <input type="hidden" name="stockId" value="${stock.stockId}">
                <label>판매 가격</label>
                <input type="text" name="price" placeholder="판매 가격 입력">
                <label>판매 수량</label>
                <input type="number" name="quantity" placeholder="판매 수량 입력">
                <button type="submit">판매하기</button>
            </form>
        </div>
    </div>

    <script>
        document.getElementById("buy-btn").addEventListener("click", function() {
            document.getElementById("buy-form").style.display = "block";
            document.getElementById("sell-form").style.display = "none";
        });
        document.getElementById("sell-btn").addEventListener("click", function() {
            document.getElementById("buy-form").style.display = "none";
            document.getElementById("sell-form").style.display = "block";
        });
    </script>
</body>
</html>

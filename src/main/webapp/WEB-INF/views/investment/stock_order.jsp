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

        <!-- 판매 주문 목록 섹션 -->
        <table class="listing-table">
            <thead>
                <tr>
                    <th>판매가격</th>
                    <th>수량</th>
                    <th>판매자 계좌</th>
                    <th>취소</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${saleOrders}">
                    <c:if test="${order.stock.stockId == stock.stockId}">
                        <tr>
                            <td>${order.price}&#8361;</td>
                            <td>${order.quantity}</td>
                            <td>${order.seller.accountId}</td>
                            <td>
                                <!-- 취소 버튼 -->
                                <c:if test="${order.seller.accountId == securitiesAccount.accountId}">
                                    <form action="/spike.com/listing/cancel" method="post" style="display: inline;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="sellerAccountId" value="${securitiesAccount.accountId}" />
                                        <input type="hidden" name="listingId" value="${order.id}" />
                                        <button type="submit">취소</button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>

        <!-- 주문 섹션 -->
        <div class="order-section">
            <h3>${stock.companyName}-주문하기</h3>
            <div class="order-type">
                <button id="buy-btn" class="active">구매</button>
                <button id="sell-btn">판매</button>
            </div>

            <!-- 구매 폼 -->
            <form id="buy-form" class="order-form" action="/spike.com/listing/buy" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="buyerAccountId" value="${securitiesAccount.accountId}" />
                <input type="hidden" id="selected-listingId" name="listingId" value="" />
                <!-- 추가된 숨겨진 인풋 -->
                <input type="hidden" id="selected-listings" name="selectedListings" value="" />
                <input type="hidden" id="selected-listingQuantities" name="selectedListingQuantities" value="" />
                <input type="hidden" name="stockId" value="${stock.stockId}" />
                
                <label>구매 가격 (1주당 가격)</label>
                <input type="number" id="buy-price" name="price" placeholder="구매 가격 입력" min="1" required>
                
                <p>
                    <strong>구매 가능 주식 수:</strong> <span id="available-quantity">0</span>주
                </p>
                
                <label>구매 수량</label>
                <input type="number" id="buy-quantity" name="quantity" min="1" placeholder="구매 수량 입력" required>
                
                <p>
                    <strong>총 구매액:</strong> <span id="total-price">0</span>원
                </p>
                
                <button type="submit">구매하기</button>
            </form>

            <!-- 판매 폼 -->
            <div class="sell-info">
                <p>
                    <strong>보유 주식 수:</strong> ${ownedQuantity}주
                </p>
                <p>
                    <strong>판매 중인 주식 수:</strong> ${listedQuantity}주
                </p>
                <p>
                    <strong>판매 가능 수량:</strong> ${ownedQuantity - listedQuantity}주
                </p>
            </div>
            <form id="sell-form" class="order-form" action="/spike.com/listing/sell" method="post" style="display: none;">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="sellerAccountId" value="${securitiesAccount.accountId}">
                <input type="hidden" name="stockId" value="${stock.stockId}">
                <label>판매 가격</label>
                <input type="text" name="price" placeholder="판매 가격 입력">
                <label>판매 수량</label>
                <input type="number" name="quantity" min="1" max="${ownedQuantity - listedQuantity}" placeholder="판매 수량 입력">
                <button type="submit">판매하기</button>
            </form>
        </div>
    </div>

    <script>
        // 구매폼 / 판매폼 전환
        document.getElementById("buy-btn").addEventListener("click", function() {
            document.getElementById("buy-form").style.display = "block";
            document.getElementById("sell-form").style.display = "none";
        });
        document.getElementById("sell-btn").addEventListener("click", function() {
            document.getElementById("buy-form").style.display = "none";
            document.getElementById("sell-form").style.display = "block";
        });
    </script>

    <script>
        // 구매 로직

        // 판매 주문 데이터 가져오기
        let saleOrders = [
            <c:forEach var="order" items="${saleOrders}">
            {
                listingId: ${order.id}, 
                price: ${order.price},
                quantity: ${order.quantity}
            },
            </c:forEach>
        ];

        // 가격이 낮은 순으로 정렬
        saleOrders.sort((a, b) => a.price - b.price);

        // 구매 가격 입력 시 처리
        document.getElementById("buy-price").addEventListener("input", function() {
            let price = parseFloat(this.value);
            let availableQuantity = 0;
            let selectedListings = [];

            // 입력한 가격 이하의 매물만 선택하여 구매 가능 주식 수량 계산
            for (let order of saleOrders) {
                if (order.price <= price) {
                    availableQuantity += order.quantity;
                    selectedListings.push(order);
                }
            }

            document.getElementById("available-quantity").textContent = availableQuantity;
            document.getElementById("buy-quantity").max = availableQuantity;

            // 선택된 매물 리스트 JSON 변환하여 hidden input에 저장
            document.getElementById("selected-listings").value = JSON.stringify(selectedListings);
        });

        // 구매 수량 입력 시 처리 (총 구매액 계산 및 매물 ID/수량 저장)
        document.getElementById("buy-quantity").addEventListener("input", function() {
            let quantity = parseInt(this.value);
            let totalPrice = 0;
            let remainingQuantity = quantity;
            let selectedListings = JSON.parse(document.getElementById("selected-listings").value || "[]");

            let selectedListingIds = []; // 구매할 매물 ID 리스트
            let selectedListingQuantities = {}; // 매물별 구매 수량 저장

            // 저렴한 매물부터 순차적으로 구매
            for (let order of selectedListings) {
                if (remainingQuantity <= 0) break;

                let buyFromOrder = Math.min(order.quantity, remainingQuantity);
                totalPrice += buyFromOrder * order.price;
                remainingQuantity -= buyFromOrder;

                // 구매 대상 매물 ID 및 수량 저장
                selectedListingIds.push(order.listingId);
                selectedListingQuantities[order.listingId] = buyFromOrder;
            }

            document.getElementById("total-price").textContent = totalPrice.toLocaleString();
            document.getElementById("selected-listingId").value = selectedListingIds.join(",");
            document.getElementById("selected-listingQuantities").value = JSON.stringify(selectedListingQuantities);
        });
    </script>
</body>
</html>

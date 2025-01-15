<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${stock.companyName} - 주식 거래</title>
    <link href="/css/investment/stock_trade.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- 차트 섹션 -->
        <div class="chart-section">
            <div class="chart-header">
                <h3>${stock.companyName} (${stock.tickerSymbol})</h3>
                <p>시작가: ${stock.initialPrice}$ | 현재가: ${stock.currentPrice}$</p>
            </div>
            <div class="chart-box">
                <canvas id="candleChart" width="800" height="400"></canvas>
            </div>
        </div>

        <!-- 실시간 시세 섹션 -->
        <div class="details-section">
            <div class="details-header">
                <h3>${stock.companyName} 실시간 시세</h3>
                <p>전체 발행 주식: ${stock.totalShares}</p>
            </div>
            <table class="details-table">
                <tr>
                    <th>체결가</th>
                    <th>체결량 (주)</th>
                    <th>등락률</th>
                </tr>
                <tr>
                    <td>${stock.currentPrice}원</td>
                    <td>1,000</td>
                    <td>+1.23%</td>
                </tr>
                <tr>
                    <td>${stock.currentPrice}원</td>
                    <td>2,500</td>
                    <td>-0.89%</td>
                </tr>
            </table>
        </div>

        <!-- 주문 섹션 -->
        <div class="order-section">
            <h3>${stock.companyName} - 주문하기</h3>
            <div class="order-type">
                <button class="active">구매</button>
                <button>판매</button>
            </div>
            <div class="order-options">
                <label>주문 유형</label>
                <select>
                    <option>지정가</option>
                    <option>시장가</option>
                </select>
            </div>
            <div class="price-input">
                <label>구매 가격</label>
                <input type="text" value="${stock.currentPrice}원">
            </div>
            <div class="amount-input">
                <label>수량</label>
                <input type="number" value="0">
            </div>
            <div class="summary">
                <p>미수거래 (현금 30%)</p>
                <p>구매 가능 금액: 0$</p>
                <p>총 주문 금액: 0$</p>
            </div>
            <button class="buy-btn">구매하기</button>
        </div>
    </div>
</body>
</html>

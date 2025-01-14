<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주식 거래</title>
    <link href="/css/investment/stock_trade.css" rel="stylesheet">



</head>
<body>
    <div class="container">
        <!-- 차트 섹션 -->
        <div class="chart-section">
            <div class="chart-header">
                <h3>차트</h3>
                <p>시작 고가 저가 종가</p>
            </div>
            <div class="chart-box">
                <canvas id="candleChart" width="800" height="400"></canvas>
            </div>
        </div>

        <!-- 실시간 시세 섹션 -->
        <div class="details-section">
            <div class="details-header">
                <h3>일별 · 실시간 시세</h3>
                <input type="text" placeholder="실시간">
            </div>
            <table class="details-table">
                <tr>
                    <th>체결가</th>
                    <th>체결량 (주)</th>
                    <th>등락률</th>
                </tr>
                <tr>
                    <td>55,400원</td>
                    <td>4,234</td>
                    <td>0.00%</td>
                </tr>
                <tr>
                    <td>55,400원</td>
                    <td>3,713</td>
                    <td>0.00%</td>
                </tr>
                <tr>
                    <td>55,400원</td>
                    <td>61</td>
                    <td>-0.89%</td>
                </tr>
            </table>
        </div>

        <!-- 주문 섹션 -->
        <div class="order-section">
            <h3>주문하기</h3>
            <div class="order-type">
                <button class="active">구매</button>
                <button>판매</button>
                <button>대기</button>
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
                <input type="text" value="55,400원">
            </div>
            <div class="amount-input">
                <label>수량</label>
                <input type="number" value="0">
            </div>
            <div class="summary">
                <p>미수거래 (현금 30%)</p>
                <p>구매 가능 금액: 0원</p>
                <p>총 주문 금액: 0원</p>
            </div>
            <button class="buy-btn">구매하기</button>
        </div>
    </div>

    <script>
        // 랜덤 데이터 생성
        function generateRandomCandlestickData() {
            const data = [];
            let basePrice = 55500;
            for (let i = 0; i < 30; i++) {
                const open = basePrice + Math.random() * 100 - 50;
                const close = basePrice + Math.random() * 100 - 50;
                const high = Math.max(open, close) + Math.random() * 50;
                const low = Math.min(open, close) - Math.random() * 50;
                basePrice = close;
                data.push({ open, high, low, close });
            }
            return data;
        }

        // 차트 그리기
        function drawCandlestickChart(canvasId, data) {
            const canvas = document.getElementById(canvasId);
            const ctx = canvas.getContext("2d");
            const chartWidth = canvas.width;
            const chartHeight = canvas.height;
            const margin = 50;
            const candleWidth = (chartWidth - margin * 2) / data.length;
            const maxPrice = Math.max(...data.map(d => d.high));
            const minPrice = Math.min(...data.map(d => d.low));

            // 배경 및 축 그리기
            ctx.clearRect(0, 0, chartWidth, chartHeight);
            ctx.fillStyle = "#ffffff";
            ctx.fillRect(0, 0, chartWidth, chartHeight);

            ctx.strokeStyle = "#ddd";
            ctx.beginPath();
            ctx.moveTo(margin, margin);
            ctx.lineTo(margin, chartHeight - margin);
            ctx.lineTo(chartWidth - margin, chartHeight - margin);
            ctx.stroke();

            // 가격 레이블
            ctx.fillStyle = "#000";
            ctx.textAlign = "right";
            ctx.textBaseline = "middle";
            for (let i = 0; i <= 5; i++) {
                const y = margin + ((chartHeight - margin * 2) / 5) * i;
                const price = maxPrice - ((maxPrice - minPrice) / 5) * i;
                ctx.fillText(price.toFixed(2), margin - 10, y);
            }

            // 캔들 그리기
            data.forEach((d, i) => {
                const x = margin + i * candleWidth + candleWidth / 4;
                const yOpen = margin + ((maxPrice - d.open) / (maxPrice - minPrice)) * (chartHeight - margin * 2);
                const yClose = margin + ((maxPrice - d.close) / (maxPrice - minPrice)) * (chartHeight - margin * 2);
                const yHigh = margin + ((maxPrice - d.high) / (maxPrice - minPrice)) * (chartHeight - margin * 2);
                const yLow = margin + ((maxPrice - d.low) / (maxPrice - minPrice)) * (chartHeight - margin * 2);

                const isBullish = d.close > d.open;
                ctx.fillStyle = isBullish ? "#2ecc71" : "#e74c3c";
                ctx.strokeStyle = isBullish ? "#2ecc71" : "#e74c3c";

                // 고가-저가 선
                ctx.beginPath();
                ctx.moveTo(x + candleWidth / 4, yHigh);
                ctx.lineTo(x + candleWidth / 4, yLow);
                ctx.stroke();

                // 시가-종가 박스
                ctx.fillRect(
                    x,
                    Math.min(yOpen, yClose),
                    candleWidth / 2,
                    Math.abs(yClose - yOpen)
                );
            });
        }

        // 차트 데이터 생성 및 렌더링
        const candlestickData = generateRandomCandlestickData();
        drawCandlestickChart("candleChart", candlestickData);
    </script>
</body>
</html>

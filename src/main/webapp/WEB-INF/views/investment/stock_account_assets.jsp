<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${pageTitle}</title>
    <link href="/css/investment/stock_account_assets.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- 자산 현황 섹션 -->
        <div class="account-summary">
            <div class="summary-title">${pageTitle}</div>
            <div class="info-row">
                <span class="label">계좌 번호:</span>
                <span class="value">${accountNumber}</span>
            </div>
            <div class="info-row">
                <span class="label">총 자산:</span>
                <span class="value">${totalAssets} 원</span>
            </div>
            <div class="info-row">
                <span class="label">보유 현금:</span>
                <span class="value">${availableBalance} 원</span>
            </div>
            <div class="info-row">
                <span class="label">투자 중인 금액:</span>
                <span class="value">${investedAmount} 원</span>
            </div>
            <div class="info-row">
                <span class="label">수익:</span>
                <span class="value">${profit} 원</span>
            </div>
        </div>
		
		<br/>
        <!-- 보유 주식 내역 섹션 -->
        <h2>보유 주식 내역</h2>
        <table>
            <thead>
                <tr>
                    <th>종목명</th>
                    <th>보유 수량</th>
                    <th>현재 가격</th>
                    <th>평가 금액</th>
                    <th>수익률</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="stock" items="${stockList}">
                    <tr>
                        <td>${stock.name}</td>
                        <td>${stock.quantity} 주</td>
                        <td>${stock.currentPrice} 원</td>
                        <td>${stock.totalValue} 원</td>
                        <td>${stock.profitRate}%</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>

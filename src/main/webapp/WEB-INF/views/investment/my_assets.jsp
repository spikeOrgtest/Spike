<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 자산 확인하기</title>
<link href="/css/investment/my_assets.css" rel="stylesheet">
<link rel="stylesheet" href="/css/include/include.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="container">
		<h2>내 자산 확인하기</h2>

		<!-- 예수금 보유량 -->
		<section class="account-balance">
			<h3>예수금 보유량</h3>
			<p>
				예수금: <strong>${availableBalance} 원</strong>
			</p>
		</section>

		<!-- 보유 주식 현황 -->
		<section class="stock-holdings">
			<h3>보유 주식 현황</h3>
			<table>
				<thead>
					<tr>
						<th>종목명</th>
						<th>보유 주식 수</th>
						<th>현재가</th>
						<th>주식별 총 보유 금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="holding" items="${stockHoldings}">
						<tr>
							<td>${holding.stock.companyName}
								(${holding.stock.tickerSymbol})</td>
							<td>${holding.quantity}주</td>
							<td>${holding.stock.currentPrice}원</td>
							<td><fmt:formatNumber
									value="${holding.quantity * holding.stock.currentPrice}"
									pattern="#,###" /> 원</td>

						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3"><strong>총 보유 주식 금액</strong></td>
						<td><strong>${totalStockValue} 원</strong></td>
					</tr>
				</tfoot>
			</table>
		</section>

		<!-- 거래 내역 -->
		<section class="transaction-history">
			<h3>거래 내역</h3>
			<table>
				<thead>
					<tr>
						<th>거래일자</th>
						<th>종목명</th>
						<th>거래 유형</th>
						<th>수량</th>
						<th>거래 가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="transaction" items="${transactionList}">
						<tr>
							<td>${transaction.transactionTime}</td>
							<td>${transaction.stock.companyName}
								(${transaction.stock.tickerSymbol})</td>
							<td><c:choose>
									<c:when
										test="${transaction.buyer.accountId == currentAccountId}">
                    구매
                  </c:when>
									<c:otherwise>
                    판매
                  </c:otherwise>
								</c:choose></td>
							<td>${transaction.quantity}주</td>
							<td>${transaction.price}원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>

	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>

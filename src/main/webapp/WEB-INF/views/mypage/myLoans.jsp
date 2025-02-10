<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 대출 관리</title>
    <link rel="stylesheet" href="/css/include/include.css">
    <style>
        .loan-container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
        }
        .loan-item {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
        }
        .loan-info {
            margin-bottom: 10px;
        }
        .repay-form {
            margin-top: 10px;
            padding-top: 10px;
            border-top: 1px solid #eee;
        }
        .repay-btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .repay-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <%@ include file="../include/header.jsp"%>
    
    <div class="loan-container">
        <h2>내 대출 목록</h2>
        
        <c:forEach var="loan" items="${loans}">
            <div class="loan-item">
                <div class="loan-info">
                    <p><strong>대출 상품:</strong> ${loan.productType}</p>
                    <p><strong>대출 금액:</strong> <fmt:formatNumber value="${loan.loanAmount}" type="number"/>원</p>
                    <p><strong>남은 금액:</strong> 
                        <c:choose>
                            <c:when test="${loan.remainingAmount != null}">
                                <fmt:formatNumber value="${loan.remainingAmount}" type="number"/>원
                            </c:when>
                            <c:when test="${loan.loanState eq '완료'}">
                                <fmt:formatNumber value="${loan.loanAmount}" type="number"/>원
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </p>
                    <p><strong>상태:</strong> ${loan.loanState}</p>
                    <p><strong>생성일:</strong> ${loan.createdDate}</p>
                </div>
                
                <%-- eq 대신 == 사용하고 공백 주의해서 수정 --%>
                <c:if test="${loan.loanState eq '완료' && loan.remainingAmount gt 0}">
                    <div class="repay-form">
                        <form action="/spike.com/repayLoan" method="POST" onsubmit="return validateRepayment(this)">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" name="loanId" value="${loan.loanId}" />
                            <input type="number" name="amount" placeholder="상환할 금액" required 
                                   max="${loan.remainingAmount}" />
                            <button type="submit" class="repay-btn">상환하기</button>
                        </form>
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>

    <script>
    function validateRepayment(form) {
        var amount = form.amount.value;
        var max = form.amount.getAttribute('max');
        
        if (amount <= 0) {
            alert('상환 금액은 0보다 커야 합니다.');
            return false;
        }
        
        if (amount > max) {
            alert('남은 대출금액보다 많은 금액을 상환할 수 없습니다.');
            return false;
        }
        
        return confirm('정말 상환하시겠습니까?');
    }
    </script>
    
    <%@ include file="../include/footer.jsp"%>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이체 성공</title>
    <link rel="stylesheet" type="text/css" href="/css/transfer/transfer_success.css">
</head>
<body>
<%-- 세션의 Data 속성 없이 뒤로가기로 뷰페이지를 렌더링한 경우 예외처리(transfer_ok와 같은 방식) --%>
	<c:if test="${empty sessionScope.Data}">
    <script>
        alert("송금 정보가 만료되었습니다. 다시 시도해 주세요.");
        window.location.href = "/spike.com/transfer";
    </script>
	</c:if>
	
    <div class="container">
        <p class="success-message">이체가 성공적으로 완료되었습니다!</p>
        
        <div class="details">
        <%--
        
            <p><strong>출금 계좌:</strong> <c:out value="${withdrawAccount}" /></p>
            <p><strong>입금 계좌:</strong> <c:out value="${depositAccount}" /></p>
            <p><strong>이체 금액:</strong> <c:out value="${amount}" /> 원</p>
            <p><strong>이체 메모:</strong> <c:out value="${memo}" /></p>
            <p><strong>거래 일시:</strong> <c:out value="${transactionDate}" /></p>
         --%>
            <p><strong>출금 계좌:</strong> 921-12-8888</p>
            <p><strong>입금 계좌:</strong> 123-21-3245</p>
            <p><strong>이체 금액:</strong> 10,000 원</p>
            <p><strong>이체 메모:</strong> 메모내용</p>
            <p><strong>거래 일시:</strong> 2025-02-05</p>
        </div>

        <a href="/spike.com/transfer" class="btn">계속 이체하기</a>
        <a href="/spike.com" class="btn">메인으로 돌아가기</a>
        
    </div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPIKE! 번개처럼 빠른 송금</title>
<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/transfer/transfer_ok.css">
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
	<%-- 세션의 Data 속성 없이 뒤로가기로 뷰페이지를 렌더링한 경우 예외처리 --%>
	<c:if test="${empty sessionScope.Data}">
    <script>
        alert("송금 정보가 만료되었습니다. 다시 시도해 주세요.");
        window.location.href = "/spike.com/transfer";
    </script>
	</c:if>

	<div id="transferBody">
		<div id="transferWrapper">
		<div id="infoWrapper">
			<p>입금은행: SPIKE</p>
			<p>받으시는 분: <c:out value="${Data.ownerName}" /></p>
			<p>계좌번호: <c:out value="${Data.toAccount}" /></p>
			<p>이체 금액: <c:out value="${Data.amount}" />원</p>
			<p>이체 메모: <c:out value="${Data.memo}"/> </p>
		</div>
		
		<div id="shieldWrapper" data-status="${Data.ownerStatus}">
		<p>SPIKE SHIELD - 클릭하여 안전한 계좌인지 확인하세요</p>
		<div id="imgWrapper">
		<img alt="" src="/images/transfer/shield.png" onclick="shield();">
		</div>
		</div>

			<form action="/spike.com/transfer_ok" method="post" onsubmit="return validate();">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" id="accountPassword" value="${Data.accountPassword}"/>
				<p>계좌 비밀번호 확인</p>
				<input type="password" id="inputPassword" name="inputPassword"/>
				<div class="buttons">
					<button type="submit" class="confirm">송금하기</button>
					<button type="button" onclick="transfer_cancel();">취소</button>
				</div>
			</form>
		</div>
	</div>



	<jsp:include page="../include/shortfooter.jsp" />
	<script src="/js/transfer/transfer_ok.js"></script>
</body>
</html>
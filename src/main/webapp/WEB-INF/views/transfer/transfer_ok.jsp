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

	<div id="transferBody">
		<div id="transferWrapper">
			<p>받으시는 분:<c:out value="${Data.ownerName}" /></p>
			<p>
				이체 금액:
				<c:out value="${Data.amount}" />
				원
			</p>
			<p>
				계좌번호:
				<c:out value="${Data.toAccount}" />
			</p>

			<form action="/spike.com/transfer" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<input type="password"/>
				<div class="buttons">
					<button type="submit" class="confirm" onclick="">확인</button>
					<button type="button">취소</button>
				</div>
			</form>
		</div>
	</div>



	<jsp:include page="../include/shortfooter.jsp" />
<script src="/js/transfer/transfer_ok.js"></script>
</body>
</html>
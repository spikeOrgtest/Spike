<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%-- 폼태그를 사용하지 않으므로 meta태그에 EL로 csrf헤더,토큰 할당 --%>
<meta name="_csrf_header" content="${_csrf.headerName }">
<meta name="_csrf" content="${_csrf.token }">
<title>이체 성공</title>
<link rel="stylesheet" type="text/css"
	href="/css/transfer/transfer_success.css">
</head>
<body>

	<%-- 세션의 Data 속성 없이 뒤로가기로 뷰페이지를 렌더링한 경우 예외처리(transfer_ok와 같은 방식) --%>
	<c:if test="${empty sessionScope.Data}">
		<script>
        alert("송금 정보가 만료되었습니다. 이체/송금 페이지로 이동합니다.");
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
			<p><strong>입금은행:</strong> SPIKE</p>
			<p><strong>받으시는 분:</strong> ${Data.ownerName}</p>
			<p><strong>계좌번호:</strong> ${Data.toAccount}</p>
			<p><strong>이체 금액:</strong> <fmt:formatNumber value="${Data.amount}" type="number"/> 원</p>
			<p><strong>이체 메모:</strong> ${Data.memo}</p>


		</div>

		<a href="/spike.com/transfer" class="btn">계속 이체하기</a> <a
			href="/spike.com" class="btn">메인으로 돌아가기</a>
			

	</div>
	
	<script>
	document.addEventListener("DOMContentLoaded", function(){
		//csrf 토큰을 포함해서 ajax요청. get/spike.com/transfer_clear
	    const csrfHeader = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
    	const csrfToken = document.querySelector('meta[name="_csrf"]').getAttribute('content');

    	fetch("/spike.com/transfer_clear",
    			{
				method: "POST",
				headers: {
					[csrfHeader]: csrfToken //js의 key 부분에 변수를 사용하려면 []로 감싸줘야 하는 것 유의(사용하지 않으면 "csrfHeader"가 키이름이 됨)
					}
    	})
    	.then()
    	.catch(); //fetch요청의 응답은 promise, 필요시 then이나 catch로 추가처리 가능
	})
	</script>
	 
</body>
</html>

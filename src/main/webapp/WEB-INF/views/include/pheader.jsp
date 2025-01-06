<%@ page contentType="text/html; charset=UTF-8"%>
<%--
<base href="${pageContext.request.contextPath}/">
 --%>

<%-- 헤더 시작 --%>
<div class="top-bar">
	<div class="header-container">
		<a href="login.jsp">로그인</a> <a href="newsSubpage_notice.jsp">공지사항</a> <a
			href="supportSubpage_FAQ.jsp">FAQ</a> <a href="#board">게시판</a>
	</div>
</div>
<header class="main-header">
	<div class="header-container">

		<a href="${pageContext.request.contextPath}/index.jsp" class="logo"><img alt="로고"
			src="${pageContext.request.contextPath}/assets/img/newlogo.png"></a>
		<nav>
			<ul>
				<li class="dropdown"><a href="mypageMain.jsp">마이페이지</a>
					<ul class="header-dropdown-menu">
						<li><a href="#">회원정보</a></li>
						<li><a href="#">계좌조회</a></li>
						<li><a href="#">자산조회</a></li>
						
					</ul></li>

				<li class="dropdown"><a href="transfer.jsp">이체/송금</a>
				
				<li class="dropdown"><a href="../products.jsp">금융/투자</a>
					<ul class="header-dropdown-menu">
						<li><a href="../products/deposit.jsp">예금</a></li>
						<li><a href="../products/savings.jsp">적금</a></li>
						<li><a href="../products/loan.jsp">대출</a></li>
						<li><a href="../products/card.jsp">카드</a></li>
						<li><a href="../investments.jsp">투자</a></li>
					</ul></li>

				<li class="dropdown"><a href="support.jsp">고객센터</a>
					<ul class="header-dropdown-menu">
						<li><a href="newsSubpage_bank.jsp">Spike소식</a></li>
						<li><a href="supportSubpage_ars.jsp">고객지원</a></li>
					</ul></li>
				
				<li class="dropdown"><a href="mini.jsp" style="font: 25px;">mini</a>
					<%--
               <ul class="dropdown-menu">
                     <li><a href="#">ARS 안내</a></li>
                     <li><a href="#">스파이크 챗봇</a></li>
                     <li><a href="#">소객의 소리</a></li>
                     <li><a href="#">상담</a></li>
                  </ul>
                --%></li>
			</ul>
		</nav>
	</div>
</header>
<%-- 헤더 끝 --%>

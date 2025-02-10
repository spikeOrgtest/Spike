<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/css/support/subpage.css">
<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/manager/manager.css">
<!--  <link rel="stylesheet" href="/css/support/newSubpage_noticeDetail.css">-->

</head>
<body>
<%@ include file="../include/header.jsp"%>




<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">관리자 페이지</h3>
				<ul>
					<li><a href="/spike.com/ma">대시보드</a></li>
					<li><a href="/spike.com/userManagement">사용자관리</a></li>
					<li><a href="newsSubpage_product.jsp">계좌수정</a></li>
					<li><a href="newsSubpage_product.jsp">거래내역관리</a></li>
					<li><a href="/spike.com/admin/loanManagement">대출관리</a></li>
					<li><a href="newsSubpage_notice.jsp">공지사항관리</a></li>
					<li><a href="newsSubpage_notice.jsp">보안관리</a></li>
				</ul>
			</div>
		<div class="subpage-main-container" style="justify-content: center;">
			
<div class="Alldash">
<div class="All-box1">
<!--  ---------------------------------------------- -->

<div class="dashboard1-box">
<div class="dashboard1">
  <h2><strong><a href="visit">오늘의 방문자수</a></strong></h2> 
  <div id="board1">
    <p>${tolog}명</p>
    
    </div>
   </div>
  </div>

<div class="dashboard1-box">
<div class="dashboard1">
  <h2><strong>신규 회원가입</strong></h2> <!-- 오늘 가입한 신규 회원 수 -->
  <div id="board1">
    <p>${newmember}</p>
    </div>
   </div>
  </div>
</div>

<div class="All-box2">

<div class="dashboard1-box">           
<div class="dashboard1">
  <h2><strong>오늘의 거래 건수</strong></h2> <!-- 오늘 거래 건수 -->
  <div id="board1">
    <p>${allTransaction}건</p>
    </div>
   </div>
  </div>


<div class="dashboard1-box">
<div class="dashboard1">
  <h2><strong>오늘의 대출 신청</strong></h2> <!-- 오늘 가입한 신규 회원 수 -->
  <div id="board1">
    <p>{allLoanId}건</p>
    </div>
   </div>
  </div>
  </div>
  
  
<div class="All-box3">

<div class="dashboard6-box">
<div class="dashboard6">
  <h2><strong>전체통계</strong></h2> <!-- 오늘 가입한 신규 회원 수 -->
  <div id="board1">
    <p>총 가입자 수: ${allvisit}명</p>
    <p>총 대출 금액: 5.312.049.840원</p>
    <p>총 거래액: <fmt:formatNumber value="${allamount}" type="currency" currencySymbol="₩" pattern="#,###" />원</p>
    </div>
   </div>
  </div>
</div>

</div>

    </div> <!--  subpage-main-container 클래스 -->
</div> <!-- subpageWrapper 클래스 -->

  <%@ include file="../include/shortfooter.jsp"%>
  <script src="/js/subpage.js"></script>

</body>
</html>
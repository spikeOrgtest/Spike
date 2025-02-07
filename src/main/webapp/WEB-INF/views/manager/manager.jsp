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

<%-- 헤더 시작 --%>
<div class="header-wrapper">
    <div class="top-bar">
        <div class="header-container">
            <c:choose>
                <c:when test="${sessionScope.User.name == null}">
                    <a href="javascript:location='/spike.com/login';">로그인</a>
                </c:when>
                <c:otherwise>
                    <a href="javascript:location='/spike.com/logout';">로그아웃</a>
                </c:otherwise>
            </c:choose>

            <a href="newsSubpage_notice.jsp">공지사항</a>
            <a href="supportSubpage_FAQ.jsp">FAQ</a>
            <a href="#board">게시판</a>
        </div>
    </div>
    <header class="main-header">
        <div class="header-container">
            <div class="UserInfo">
                <a href="spike.com" class="logo"><img alt="로고" src="/images/newlogo.png"></a>
                <c:choose>
                    <c:when test="${sessionScope.User.name == null}">
                        <!-- 로그인 전 -->
                    </c:when>
                    <c:otherwise>
                        <h5>${sessionScope.User.name}님 환영합니다.</h5>

                        <c:if test="${not empty sessionScope.remainingTime}">
                            <div>
                                <h5>세션 남은 시간:
                                    <span id="timeDisplay"> 
                                        <!-- 여기에 실시간으로 갱신되는 시간이 표시됨 -->
                                    </span>
                                </h5>
                            </div>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
            <nav>
                <ul>
                    <li class="dropdown"><a href="/spike.com/mypage/main">마이페이지</a>
                        <ul class="header-dropdown-menu">
                            <li><a href="mypageEdit.jsp">회원정보</a></li>
                            <li><a href="mypageinquiry.jsp">계좌조회</a></li>
                            <li><a href="mypageproperty.jsp">자산조회</a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="transfer.jsp">이체/송금</a></li>
                    <li class="dropdown"><a href="products.jsp">금융/투자</a>
                        <ul class="header-dropdown-menu">
                            <li><a href="products/deposit.jsp">예금</a></li>
                            <li><a href="products/savings.jsp">적금</a></li>
                            <li><a href="products/loan.jsp">대출</a></li>
                            <li><a href="products/card.jsp">카드</a></li>
                            <li><a href="investments.jsp">투자</a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="support.jsp">고객센터</a>
                        <ul class="header-dropdown-menu">
                            <li><a href="newsSubpage_bank.jsp">Spike소식</a></li>
                            <li><a href="supportSubpage_ars.jsp">고객지원</a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="mini.jsp" style="font: 25px;">mini</a></li>
                </ul>
            </nav>
        </div>
    </header>
</div>
<%-- 헤더 끝 --%>

<%-- subnav 시작 
<div class="subpageWrapper">--%>
	<%-- 서브페이지 래퍼 --%>
	<%-- 서브네비바 --%>
	<%-- <div class="subpage-navigation-bar">
		<ul>
			<li><a href="newsSubpage_bank.jsp">SPIKE 소식</a></li>
			<li><a href="supportSubpage_ars.jsp">고객지원</a></li>
		</ul>
		<div class="subpage-search">
			<input type="text" placeholder="검색어를 입력하세요" />
			<button type="button">검색</button>
		</div>
	</div>
</div>--%>
<%-- subnav 끝 --%>


<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">관리자 페이지</h3>
				<ul>
					<li><a href="/spike.com/ma">대시보드</a></li>
					<li><a href="/spike.com/userManagement">사용자관리</a></li>
					<li><a href="newsSubpage_product.jsp">계좌수정</a></li>
					<li><a href="newsSubpage_product.jsp">거래내역관리</a></li>
					<li><a href="newsSubpage_job.jsp">대출관리</a></li>
					<li><a href="newsSubpage_notice.jsp">공지사항관리</a></li>
					<li><a href="newsSubpage_notice.jsp">보안관리</a></li>
				</ul>
			</div>

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
  <h2><strong>오늘의 거래 회원</strong></h2> <!-- 오늘 거래한 회원 수 -->
  <div id="board1">
    <p>1582명</p>
    </div>
   </div>
  </div>


<div class="dashboard1-box">
<div class="dashboard1">
  <h2><strong>오늘의 대출 신청</strong></h2> <!-- 오늘 가입한 신규 회원 수 -->
  <div id="board1">
    <p>38건</p>
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
    <p>총 거래액: ${allamount}원</p>
    </div>
   </div>
  </div>
</div>

</div>


<%-- 헤더 스크립트 시작 --%>

<script type="text/javascript">
// 세션에서 전달받은 remainingTime을 가져오는데, 값이 없으면 기본값 0 설정
var remainingTime = ${sessionScope.remainingTime != null ? sessionScope.remainingTime : -1}; 

// 세션 값이 없으면 타이머를 시작하지 않음
if (remainingTime >= 0) {
    // 시간 업데이트 함수
    function updateTimeDisplay() {
        var minutes = Math.floor(remainingTime / 60);  // 분 계산
        var seconds = remainingTime % 60;  // 초 계산
        document.getElementById("timeDisplay").innerText = minutes + "분 " + seconds + "초";  // 실시간으로 업데이트
    }
	
	updateTimeDisplay();

    // 타이머 실행 (1초마다 1초씩 감소)
    var timer = setInterval(function() {
        if (remainingTime > 0) {
            remainingTime--;  // 1초씩 감소
            updateTimeDisplay();  // 화면에 갱신된 시간 표시
        } else {
            clearInterval(timer);  // 남은 시간이 0이 되면 타이머를 멈춤
            alert("장시간 사용하지 않아 자동으로 로그아웃됩니다..");  // 시간 만료 알림
            location.href = '/spike.com/logout';  // 세션 종료 후 로그아웃 페이지로 리다이렉트
            // 세션 만료 처리 (예: 자동 로그아웃)
        }
    }, 1000);  // 1초마다 실행
} 
</script>

<%-- 헤더 스크립트 끝 --%>

    </div> <!--  subpage-main-container 클래스 -->
</div> <!-- subpageWrapper 클래스 -->

  <%@ include file="../include/shortfooter.jsp"%>
  <script src="/js/subpage.js"></script>

</body>
</html>
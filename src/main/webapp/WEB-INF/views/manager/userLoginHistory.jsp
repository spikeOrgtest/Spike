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
<link rel="stylesheet" href="/css/support/subpage_notice.css">
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
<!--  헤더 끝 --> 

<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">관리자 페이지</h3>
				<ul>
				    <li><a href="newsSubpage_bank.jsp">대시보드</a></li>
					<li><a href="newsSubpage_bank.jsp">사용자관리</a></li>
					<li><a href="newsSubpage_product.jsp">계좌수정</a></li>
					<li><a href="newsSubpage_product.jsp">거래내역관리</a></li>
					<li><a href="newsSubpage_job.jsp">대출관리</a></li>
					<li><a href="newsSubpage_notice.jsp">공지사항관리</a></li>
					<li><a href="newsSubpage_notice.jsp">보안관리</a></li>
				</ul>
			</div>

<div class="subpage-content-wrap">
				<form method="get" action="/spike.com/notice">
					<h2>로그인 기록</h2>
					<div class="notice-board">
						<table class="notice-table">
							<thead>
								<tr>
									<th>로그인 시간 기록</th>
									
								</tr>
							</thead>
							<thead>
					  <c:forEach var = "item" items="${LHlist}">
						<tr>
							<td>${item.allTime}</td>
						</tr>
						</c:forEach>
						</thead>
							<tbody>
								<c:if test="${!empty Nlist}">
								<!--  startrow값을 이용해서 번호계산 -->
								   <c:set var="i" value="${index}" /><!-- 페이지가 1일 경우, 0으로 설정 -->
								   
									<c:forEach var="n" items="${Nlist}">
										<tr>
											<td> ${i} </td>
											
											<td><a href="/spike.com/noti_cont?notice_no=${n.notice_no}&state=cont&page=${page}">${n.notice_title}</a></td>
											<td>${n.notice_name}</td>
											<td><fmt:formatDate value="${n.created_date}" pattern="yyyy-MM-dd" /></td>
											<td align="center">${n.notice_hit}</td>
											<c:set var="i" value="${i - 1}" />
										</tr>
										
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>

					<div id="Nlist_paging">
						<c:choose>
							<c:when test="${empty find_field && empty find_name}">
								<c:if test="${page > 1}">
									<a href="/spike.com/notice?page=${page-1}">[이전]</a>&nbsp;
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}">
										[${a}]
									</c:if>
									<c:if test="${a != page}">
										<a href="/spike.com/notice?page=${a}">[${a}]</a>&nbsp;
									</c:if>
								</c:forEach>

								<c:if test="${page < maxpage}">
									<a href="/spike.com/notice?page=${page+1}">[다음]</a>
								</c:if>
							</c:when>

							<c:otherwise>
								<c:if test="${page > 1}">
									<a href="/spike.com/notice?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
									<c:if test="${a == page}">
										[${a}]
									</c:if>
									<c:if test="${a != page}">
										<a href="/spike.com/notice?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
									</c:if>
								</c:forEach>

								<c:if test="${page < maxpage}">
									<a href="/spike.com/notice?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>

					<div id="nFind_wrap">
						<select name="find_field">
							<option value="notice_title" <c:if test="${find_field == 'notice_title'}">selected</c:if>>제목</option>
							<option value="notice_cont" <c:if test="${find_field == 'notice_cont'}">selected</c:if>>내용</option>
						</select>
						<input type="search" name="find_name" size="14" value="${find_name}" />
						<button type="submit">검색</button>
					</div>

					<!--  <div id="Nlist_menu">
						<button type="button" onclick="location='/spike.com/noti_write?page=${page}';">글쓰기</button>
						<c:if test="${(!empty find_field) && (!empty find_name)}">
							<button type="button" onclick="location='/spike.com/notice?page=${page}';">전체목록</button>
						</c:if>
					</div> -->
				</form>
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
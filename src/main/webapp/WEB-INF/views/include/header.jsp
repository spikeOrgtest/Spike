<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>




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
                <a href="/spike.com" class="logo"><img alt="로고" src="/images/newlogo.png"></a>
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

                    <li class="dropdown"><a href="/spike.com/transfer">이체/송금</a></li>
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

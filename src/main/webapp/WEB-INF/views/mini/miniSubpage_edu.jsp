<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>금융 교육</title>
<link rel="stylesheet" href="../css/support/subpage.css">
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/mini/edu.css">
</head>

<body class="subpage">
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/subnav.jsp"%>

	<div class="subpageWrapper">
		<%-- 서브페이지 래퍼 --%>
	</div>

	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">Education</h3>
				<ul>
					<li><a href="mini">mini home</a></li>
					<li><a href="quiz">O/X Quiz</a></li>
					<li><a href="edu">Education</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">
				<div class="quiz-wrapper">
					<div class="quiz-container">
						<h1 class="quiz-title">mini와 함께하는 금융교육 </h1>
						

				<section class="main-intro">
         <div class="intro-content">
            <h1>청소년 금융 교육 사이트</h1>
            <p>이곳에서 청소년들이 금융 지식을 배우고 실생활에 적용할 수 있는 방법을 배워보세요.</p>
            <a
               href="https://www.econedu.go.kr/user/econeEduChnnel/econeEduChnnel/dtl?p_chnel_open_req_sn=COR24060000000025"
               target="_blank" class="btn-main">청소년 금융 교육 사이트 방문하기</a>
         </div>
      </section>

      <!-- 검색 섹션 -->
      <section class="search-section">
         <div class="search-bar-wrapper">
            <form action="https://www.econedu.go.kr/index" method="GET" class="search-bar">
               <input type="text" name="query" placeholder="교육 자료를 검색하세요" required>
               <button type="submit">검색</button>
            </form>
         </div>
         <div class="keyword" id="srchKeyword">
            <span class="tit"> "추천" 키워드</span> 
            <a href="https://www.econedu.go.kr/user/playEcon/currEconTermDoc/menu/list" class="links">경제 사전</a> 
            <a href="https://www.econedu.go.kr/user/findEcon/findEcon1/dtlGrp?p_player_type=FIND&p_conts_grp_id=CS0000004575&serchmenu=1" class="links">경제 읽기</a> 
            <a href="https://www.econedu.go.kr/user/findEcon/findEcon1/dtlGrp?p_conts_grp_id=CS0000004577&serchmenu=1" class="links">쉬운 경제</a> 
            <a href="https://www.econedu.go.kr/user/findEcon/findEcon1/dtlGrp?p_conts_grp_id=CS0000004627&serchmenu=1" class="links">정책 방향</a>
         </div>
      </section>


      <!-- 퀴즈 사이트 연결 배너 -->
      <section class="banner-section">
         <a href="quiz" target="_blank"> <img
            src="../images/mini/edu_banner.jpg" alt="퀴즈 푸는 사이트 배너"
            class="quiz-banner">
         </a>
      </section>


      <!-- 자주하느느 질문  -->
      <section id="faq" class="faq-section">
         <h2>자주하는 질문</h2>
         <div class="faq-container">
            <div class="faq-item">
               <h3>금융 교육 자료는 어떻게 이용하나요?</h3>
               <p>상단 검색창에서 원하는 주제를 검색하거나 주요 링크를 통해 자료를 확인할 수 있습니다.</p>
            </div>
            <div class="faq-item">
               <h3>금융 퀴즈는 어디서 참여하나요?</h3>
               <p>'금융 기초 배우기' 페이지에서 금융 퀴즈에 참여하여 학습하고 포인트를 적립하세요.</p>
            </div>
            <div class="faq-item">
               <h3>청소년을 위한 금융 상품은 어떤 것이 있나요?</h3>
               <p>저희 사이트에서는 청소년을 위한 적금 상품과 예산 관리 도구를 추천하고 있습니다.</p>
            </div>

            <div class="faq-item">
               <h3>금융 교육을 어디서 시작할 수 있나요?</h3>
               <p>저희 사이트에서는 '금융 기초 배우기' 섹션에서 기본적인 금융 교육을 시작할 수 있습니다. 다양한 학습
                  자료와 퀴즈를 통해 점진적으로 금융 지식을 쌓아가세요.</p>
            </div>
         </div>
      </section>
   </div>

				


					</div>
				</div>
			</div>
		</div>


	<%@ include file="../include/shortfooter.jsp"%>





</body>
</html>

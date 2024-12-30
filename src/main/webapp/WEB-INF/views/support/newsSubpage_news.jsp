<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SPIKE 뉴스</title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/newsSubpage.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 추가 -->
</head>
<body class="subpage">
   <%@ include file="../include/header.jsp"%>

   <div class="subpageWrapper">
      <%-- 서브페이지 래퍼 --%>

      <%-- 서브네비바 --%>
      <div class="subpage-navigation-bar">
         <a href="#">홈</a><a href="#">SPIKE 소식</a><a href="#">뉴스</a>
      </div>

   </div>

   <div class="subpageWrapper">
      <%-- 브레드크럼, 경로 표시 필요 없는 페이지면 지워도 됨 --%>
      <div class="subpage-breadcrumbs">
         <a href="#">SPIKE 소식</a> <span> > </span> <a href="#">뉴스</a>
      </div>
   </div>

   <div class="subpageWrapper">
      <%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
      <div class="subpage-main-container">
         <%-- 사이드바 --%>
         <div class="subpage-sidebar">
            <h3 class="subpage-sidebar-title">SPIKE 소식</h3>
            <ul>
               <li><a href="401">은행소식</a></li>
               <li><a href="402">새상품소식</a></li>
               <li><a href="403">채용공고</a></li>
               <li><a href="#" class="active">뉴스</a></li>
               <li><a href="exchangeRateSubpage.jsp">환율</a></li>
            </ul>
         </div>

         <%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
         <div class="subpage-content-wrap">
            <h2>SPIKE 뉴스</h2>
            <div class="news-list">
               <article class="news-item">
                  <img src="assets/img/news/koreabank.png" alt="Spike 본사 오픈" class="news-image">
                  <h3>종합금융플랫폼 Spike, 강남과 서초에 본사 오픈</h3>
                  <p class="news-date">게시일: 2024년 3월 15일</p>
                  <p>종합금융플랫폼 Spike가 강남과 서초 두 곳에 새롭게 본사를 오픈했습니다. 이번 확장으로 고객님들께 더욱 가까이에서 편리한 서비스를 제공할 수 있게 되었습니다.</p>
                  
                  <!-- 숨겨진 추가 내용 -->
                  <div class="extra-content" style="display: none;">
                     <p>이번 본사 오픈은 SPIKE의 확장 전략의 일환으로, 강남과 서초 지역 내 고객들에게 더 나은 서비스를 제공하기 위한 조치입니다. 고객님의 다양한 요구에 더욱 빠르고 효율적으로 대응할 수 있게 될 것입니다.</p>
                  </div>
                  <a href="javascript:void(0)" class="read-more">더 보기</a>
               </article>

               <article class="news-item">
                  <img src="assets/img/news/finance.jpg" alt="실시간 금융 정보 서비스" class="news-image">
                  <h3>실시간 금융 정보 서비스 확대</h3>
                  <p class="news-date">게시일: 2024년 3월 10일</p>
                  <p>Spike에서 이제 환율부터 금시세까지 실시간 금융 정보를 확인하실 수 있습니다. 더욱 빠르고 정확한 정보로 고객님의 투자를 돕겠습니다.</p>

                  <!-- 숨겨진 추가 내용 -->
                  <div class="extra-content" style="display: none;">
                     <p>실시간 금융 정보 서비스를 통해 고객은 실시간 환율 및 금시세를 빠르게 확인하고, 변동성 있는 금융 시장에서 신속한 결정을 내릴 수 있습니다. 이 서비스는 특히 투자를 하는 분들에게 큰 도움이 될 것입니다.</p>
                  </div>
                  <a href="javascript:void(0)" class="read-more">더 보기</a>
               </article>

               <article class="news-item">
                  <img src="assets/img/news/system.jpg" alt="시스템 정기 점검" class="news-image">
                  <h3>시스템 정기 점검 안내</h3>
                  <p class="news-date">게시일: 2024년 3월 5일</p>
                  <p>매주 수요일 AM 00:00 ~ AM 00:30 동안 시스템 정기 점검이 진행됩니다. 해당 시간 동안 일부 서비스 이용이 제한될 수 있음을 알려드립니다.</p>

                  <!-- 숨겨진 추가 내용 -->
                  <div class="extra-content" style="display: none;">
                     <p>시스템 점검은 서비스 안정성과 보안 강화를 위해 정기적으로 이루어지고 있습니다. 점검 동안에는 일부 서비스에 접근할 수 없을 수 있으니 양해 부탁드립니다.</p>
                  </div>
                  <a href="javascript:void(0)" class="read-more">더 보기</a>
               </article>
            </div>
         </div>
      </div>
   </div>

   <%@ include file="../include/shortfooter.jsp"%>
   <script src="assets/js/subpage.js"></script>

   <!-- jQuery를 이용한 더보기 기능 추가 -->
   <script>
      $(document).ready(function(){
         $(".read-more").click(function(){
            var extraContent = $(this).prev(".extra-content");
            var linkText = $(this);
            
            // 내용 토글
            extraContent.toggle();

            // "더 보기" 버튼 텍스트 토글
            if (extraContent.is(":visible")) {
                linkText.text("닫기");
            } else {
                linkText.text("더 보기");
            }
         });
      });
   </script>

</body>
</html>

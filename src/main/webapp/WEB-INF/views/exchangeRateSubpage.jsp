<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SPIKE 환율 정보</title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/exchangerate_subpage.css">
</head>
<body class="subpage">
   <%@ include file="include/header.jsp"%>

   <div class="subpageWrapper">
      <%-- 서브페이지 래퍼 --%>

      <%-- 서브네비바 --%>
      <div class="subpage-navigation-bar">
         <a href="#">홈</a><a href="#">SPIKE 소식</a><a href="#">환율</a>
      </div>

   </div>
   <%-- /wrap --%>

   <div class="subpageWrapper">
      <%-- 브레드크럼, 경로 표시 필요 없는 페이지면 지워도 됨 --%>
      <div class="subpage-breadcrumbs">
         <a href="#">SPIKE 소식</a> <span> > </span> <a href="#">환율</a>
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
               <li><a href="newsSubpage.jsp">뉴스</a></li>
               <li><a href="#" class="active">환율</a></li>
            </ul>
         </div> 

         <%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
         <div class="subpage-content-wrap">
            <h2>SPIKE 환율 정보</h2>
            <div class="exchange-rate-table">
               <table>
                  <thead>
                     <tr>
                        <th>통화</th>
                        <th>매매기준율</th>
                        <th>전일대비</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>미국 달러 (USD)</td>
                        <td>1,324.50</td>
                        <td class="rate-up">▲ 2.50</td>
                     </tr>
                     <tr>
                        <td>유로 (EUR)</td>
                        <td>1,456.32</td>
                        <td class="rate-down">▼ 1.68</td>
                     </tr>
                     <tr>
                        <td>일본 엔 (JPY)</td>
                        <td>8.9234</td>
                        <td class="rate-up">▲ 0.0566</td>
                     </tr>
                     <tr>
                        <td>중국 위안 (CNY)</td>
                        <td>183.24</td>
                        <td class="rate-down">▼ 0.76</td>
                     </tr>
                  </tbody>
               </table>
            </div>

            <div class="exchange-info">
               <h3>환율 정보 안내</h3>
               <p>위 환율 정보는 매일 오전 9시 30분에 업데이트됩니다. 실제 거래 시 적용되는 환율은 창구 또는 온라인 뱅킹에서 확인해 주시기 바랍니다.</p>
            </div>

            <div class="exchange-calculator">
               <h3>환율 계산기</h3>
               <form>
                  <div class="form-group">
                     <label for="amount">금액</label>
                     <input type="number" id="amount" name="amount" placeholder="환전할 금액을 입력하세요">
                  </div>
                  <div class="form-group">
                     <label for="currency">통화 선택</label>
                     <select id="currency" name="currency">
                        <option value="USD">미국 달러 (USD)</option>
                        <option value="EUR">유로 (EUR)</option>
                        <option value="JPY">일본 엔 (JPY)</option>
                        <option value="CNY">중국 위안 (CNY)</option>
                     </select>
                  </div>
                  <button type="submit" class="btn-calculate">계산하기</button>
               </form>
            </div>
         </div>
      </div>
   </div>
   
   <%@ include file="include/shortfooter.jsp"%>
   <script src="assets/js/subpage.js"></script>
</body>
</html>
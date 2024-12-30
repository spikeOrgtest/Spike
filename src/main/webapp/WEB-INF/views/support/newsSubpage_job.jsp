<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="assets/css/job.css">
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
</head>
<body class="subpage">
	<%@ include file="include/header.jsp"%>

	<jsp:include page="include/subnav.jsp"/>

	<div class="subpageWrapper">
		<%-- 브레드크럼, 경로 표시 필요 없는 페이지면 지워도 됨 --%>
		<div class="subpage-breadcrumbs">
			<%--
			<a href="#"><img src="assets/img/job/icon_home.gif" /></a>
			 --%>
			
			<a href="#">소식</a> <span> > </span> <a href="#">채용공고</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container">
																				<%-- 경계 확인용, 스타일 지우고 사용 --%>

			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">SPIKE 소식</h3>
				<ul>
					<li><a href="newsSubpage_bank.jsp">은행소식</a></li>
					<li><a href="newsSubpage_product.jsp">새 상품소식</a></li>
					<li><a href="newsSubpage_job.jsp">채용공고</a></li>  <%-- 현재페이지=선택된 메뉴면 배경색 진하게, 백엔드랑 연동할예정 --%>
					<li><a href="newsSubpage_notice.jsp">공지사항</a></li>
				</ul>
			</div>
           
           
			<%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
			<section class= postAll>
			
			 <tr><td colspan="8"><h1>채용공고</h1></td></tr>
			 <table class ="post_table">
			 <tr class ="ps_headline">
			  <td class="ps_num"><strong>채용분야</strong></td>
			  <td class="ps_title"><strong>제목</strong></td>
			  <td class="ps_count1"><strong>진행기간</strong></td>
			  <td class="ps_count2"><strong>담당부서</strong></td>
			  <td class="ps_hit"><strong>조회수</strong></td>
			 </tr> 
			 
			 <tr>
			  <td class="ps_num">공지사항</td>
              <td class="ps_title">프론트엔드 개발자-상시모집</td>
              <td class="ps_count1">-</td>
              <td class="ps_count2">-</td>
              <td class="ps_hit">87</td>
             </tr>
             
			 <tr>
			  <td class="ps_num">공지사항</td>
              <td class="ps_title">백엔드 개발자 -2025년 SPIKE은행 동계 체험형 청년인턴 채용 서류합격자 발표 / 안내기간 2월1일</td>
              <td class="ps_count1">2024-12-20 ~ 2025-1-25</td>
              <td class="ps_count2">-</td>
              <td class="ps_hit">268</td>
             </tr>
             
			 <tr>
			  <td class="ps_num">공지사항</td>
              <td class="ps_title">기획팀 - </td>
              <td class="ps_count1">-</td>
              <td class="ps_count2">-</td>
              <td class="ps_hit">109</td>
             </tr>
			 
	       <br/>
	       <%--
	        <table class ="post_bt">
	          <tr>
               <td><button onclick="location.href='write.html'">글쓰기</button></td>
              </tr>
	        </table>
	        --%>
	        </table>
	        <div class ="ps_tap">
             	<a href="#" class="left_f">
             	<img src ="assets/img/job/leftfull.gif" alt="처음페이지"></a>	  
             	<a href="#" class="left_one">
             	<img src ="assets/img/job/lefts.gif" alt="이전페이지"></a>	  
             	<a href="#" class="pages">
             	<strong>1</strong></a>
             	<a href="#" class="rights_one">
             	<img src ="assets/img/job/rights.gif" alt="다음페이지"></a>	  
             	<a href="#" class="right_f">
             	<img src ="assets/img/job/rightfull.gif" alt="마지막페이지"></a>	  
			 </div>
			 
			 <div class="ex-box">
			 <h3>신규지원자</h3>
			 <p>상단의 채용공고에 모집공고가 있을 경우 희망하는 모집공고를 선택합니다.</p>
			 <p>지원서를 작성하신 후 "지원서저장"을 클릭하십시오.</p>
			 <br>
			 <h3>상시채용에 지원서를 이미 등록하신 분도 공개채용에 지원하실 수 있습니다</h3>
			 <p>지원을 희망하는 모집공고를 선택합니다</p>
			 <p>이미 등록된 지원서를 불러온 후 희망직무 등 변경사항 수정 후 "지원서저장"을 클릭하십시오.</p>
			 </div>
			 
			</table>
	        
	        </section>
	</div>
	</div>
	
	<%@ include file="include/shortfooter.jsp"%>
	<script src="assets/js/job.js"></script>
</body>
</html>

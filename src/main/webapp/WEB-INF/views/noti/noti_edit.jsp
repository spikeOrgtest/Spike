<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사용자 자료실 입력폼 </title>
<link rel="stylesheet" type="text/css" href="../css/noti/noti.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/noti/noti.js"></script>

<link rel="stylesheet" href="/css/support/subpage.css">
<link rel="stylesheet" href="/css/include/include.css">

</head>
<body class="subpage">
    <%@ include file="../include/header.jsp"%>

	<jsp:include page="../include/subnav.jsp" />
	
	<div class="subpageWrapper">
		<!-- 브레드크럼(경로) -->
		<div class="subpage-breadcrumbs">
			<a href="#">고객지원</a> <span> &gt; </span> <a
				href="supportSubpage_notice.jsp">공지사항</a>
		</div>
	</div>
	
	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<!-- 사이드바 -->
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">SPIKE 소식</h3>
				<ul>
					<li><a href="newsSubpage_bank.jsp">은행소식</a></li>
					<li><a href="newsSubpage_product.jsp">새 상품소식</a></li>
					<li><a href="newsSubpage_job.jsp">채용공고</a></li>
					<%-- 현재페이지=선택된 메뉴면 배경색 진하게, 백엔드랑 연동할예정 --%>
					<li><a href="newsSubpage_notice.jsp">공지사항</a></li>
				</ul>
			</div>
	
 <div id="noti_wrap">
  <form method="post" action="noti_write_ok" onsubmit="return write_check();" enctype="multipart/form-data">
   <%-- 파일 첨부되는 자료실 기능을 만들기 위해서 필요한 코드)
      1. 폼태그내에 enctype="multipart/form-data"속성을 꼭 지정해야 한다.
      2. method=post방식으로 설정해야 한다.
    --%>
    <table id="noti_t">
     <tr>
      <th>글쓴이</th>
      <td>
       <input name="notice_name" id="notice_name" size="50" style="height: 40px; font-size: 18px;" value="${n.notice_name}"/> <%-- type속성을 생략하면 기본값이 한줄 입력필드인 text이다. --%>
      </td>
     </tr>
     <tr>
      <th>제목</th>
      <td><input name="notice_title" id="notice_title" size="50" style="height: 40px; font-size: 18px;" value="${n.notice_title}"/></td>
     </tr>
     <!-- <tr>
      <th>비밀번호</th>
      <td><input type="password" name="bbs_pwd" id="bbs_pwd" size="14" /></td>
     </tr> -->
     <tr>
      <th>글내용</th>
      <td><textarea name="notice_cont" id="notice_cont" rows="20" cols="50" style="font-size: 18px;" >${n.notice_cont}</textarea></td>
     </tr>
     <tr>
      <th>파일첨부</th>
      <td><input type="file" name="uploadFile" />${n.notice_file}</td>
     </tr>
    </table>
    <div id="noti_menu">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
     <button type="submit">입력</button>
    
     <button type="Reset" onclick="location.href='/spike.com/noti_cont?notice_no=${n.notice_no}&state=cont&page=${page}'">취소</button>
     <button type="button" onclick="location='/spike.com/notice?page=${page}';">목록</button>
    </div>
    
  </form>
 </div>
 
 </div>
 </div>
 
  <%@ include file="../include/shortfooter.jsp"%>
	<script src="../js/support/subpage.js"></script>
 
</body>
</html>

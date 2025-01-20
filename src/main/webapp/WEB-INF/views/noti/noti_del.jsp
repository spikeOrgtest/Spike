<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 상세</title>
<link rel="stylesheet" href="/css/support/subpage.css">
<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/support/newSubpage_noticeDetail.css">
</head>
<body class="subpage">
	<%@ include file="../include/header.jsp"%>

	<jsp:include page="../include/subnav.jsp" />

	<div class="subpageWrapper">

		<div class="subpage-breadcrumbs">
			<a href="#">소식</a> <span> > </span> <a href="#">은행소식</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container2">
			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">SPIKE 소식</h3>
				<ul>
					<li><a href="newsSubpage_bank.jsp">은행소식</a></li>
					<li><a href="newsSubpage_product.jsp">새 상품소식</a></li>
					<li><a href="newsSubpage_job.jsp">채용공고</a></li>
					<li><a href="newsSubpage_notice.jsp">공지사항</a></li>
				</ul>
			</div>



			<!-- 공지사항 상세 페이지 내용 -->
			<div class="notice-container">
				<h2>삭제 확인</h2>

				<div class="notice-content">
					${n.notice_cont}
				</div>

				<!-- DB 연결을 위한 자리 -->
				<div class="db-placeholder" style="display: none;">
					<%-- 여기에 데이터베이스 연결 코드 또는 데이터 바인딩 코드를 추가하세요. --%>
					<%-- 예: String noticeTitle = resultSet.getString("title"); --%>
				</div>
				
				<div class = "button-Allcon">
				  <div class="button-container" style="text-align: center; margin-top: 20px;">
        <a href="/spike.com/notice">목록</a>
    </div>
     
				  <div class="button-container2" style="text-align: center; margin-top: 20px;">
        <a href="/spike.com/noti_cont?notice_no=${n.notice_no }&state=edit&page=${page}">수정</a>
    </div>
				  <div class="button-container3" style="text-align: center; margin-top: 20px;">
        <a href="/spike.com/noti_cont?notice_no=${n.notice_no }&state=del&page=${page}">삭제</a>
    </div>
    </div>
    
    
				
			</div>
		</div>
	</div>



	<%@ include file="../include/shortfooter.jsp"%>
</body>
</html>

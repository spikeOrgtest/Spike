<%@ page contentType="text/html; charset=UTF-8"%>
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
				<h2>[공지] 중국건설은행과의 금융거래 일시중단 안내 (12/21)</h2>

				<div class="notice-info">
					<span><strong>등록일:</strong> 2024.12.20</span>

				</div>

				<div class="notice-content">
					항상 우리은행을 이용해 주시는 고객님께 감사드립니다. 
					중국건설은행 서울지점의 시스템 작업에 따라 해당 기관과의 
					금융거래가 일시 중단될 예정입니다. <br>
					<strong>■ 중단 일시</strong> 
					2024.12.21(토) 10:00~17:00 (총 7시간)<br>
					<strong>■ 중단 업무</strong>
					중국건설은행으로의 이체 등 금융거래 이용에 유의해 주시기 바랍니다. 
					감사합니다.
				</div>

				<div class="attachments">
					<strong>첨부파일</strong>
					<ul>
						<li>없음</li>
					</ul>
				</div>

				<!-- DB 연결을 위한 자리 -->
				<div class="db-placeholder" style="display: none;">
					<%-- 여기에 데이터베이스 연결 코드 또는 데이터 바인딩 코드를 추가하세요. --%>
					<%-- 예: String noticeTitle = resultSet.getString("title"); --%>
				</div>

				  <div class="button-container" style="text-align: center; margin-top: 20px;">
        <a href="newsSubpage_notice.jsp">목록</a>
    </div>
				
			</div>
		</div>
	</div>



	<%@ include file="../include/shortfooter.jsp"%>
</body>
</html>

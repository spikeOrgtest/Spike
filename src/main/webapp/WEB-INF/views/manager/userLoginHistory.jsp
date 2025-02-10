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

<%@ include file="../include/header.jsp"%>


<div class="subpageWrapper">
		<div class="subpage-main-container" style="justify-content: center;" >

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
					  <c:forEach var = "item" items="${LHlist.content}">
						<tr>
							<td>${item.allTime}</td>
						</tr>
						</c:forEach>
						</thead>
							
						</table>
						
						<!-- 페이지 네비게이션 -->
<div>
    <c:if test="${LHlist.hasPrevious()}">
        <a href="?userId=${userId}&page=${LHlist.number }&size=${LHlist.size}">이전</a>
    </c:if>

    <c:forEach begin="1" end="${LHlist.totalPages }" var="i">
        <a href="?userId=${userId}&page=${i}&size=${LHlist.size}">${i }</a>
    </c:forEach>

    <c:if test="${LHlist.hasNext()}">
        <a href="?userId=${userId}&page=${LHlist.number +2}&size=${LHlist.size}">다음</a>
    </c:if>
</div>
						
					</div>
				</form>
			</div>
    

    </div> <!--  subpage-main-container 클래스 -->
</div> <!-- subpageWrapper 클래스 -->

  <%@ include file="../include/shortfooter.jsp"%>
  <script src="/js/subpage.js"></script>

</body>
</html>
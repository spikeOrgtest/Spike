<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@ include file="../include/adminheader.jsp"%>


	<div class="subpageWrapper">
		<div class="subpage-main-container" justify-content: center;">

			<!-- ================================== -->


			<div class="subpage-content-wrap">
				<form method="get" action="/spike.com/notice">
					<h2>오늘의 방문자</h2>
					<div class="notice-board">
						<table class="notice-table">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>핸드폰번호</th>
									<th>주소</th>
									<th>생년월일</th>
									<th>로그인기록</th>
								</tr>
							</thead>
							<thead>
								<c:forEach var="item" items="${Todaylist.content}">
									<tr>
										<td>${item.loginId}</td>
										<td>${item.name}</td>
										<td>${item.phone}</td>
										<td>${item.jibunAddress}</td>
										<td>${item.birthDate}</td>
										<!-- <td><a href="/spike.com/ma">${item.lastLogin}</a></td> -->
										<td><a
											href="/spike.com/userLoginHistory?userId=${item.userId}">${item.lastLogin}</a></td>
									</tr>
								</c:forEach>
							</thead>

						</table>
					</div>

					<div>

						<c:if test="${Todaylist.hasPrevious()}">
							<a href="?page=${Todaylist.number }&size=${Todaylist.size}">이전</a>
						</c:if>

						<c:forEach begin="1" end="${Todaylist.totalPages }" var="i">
							<a href="?page=${i}&size=${Todaylist.size}">${i }</a>
						</c:forEach>

						<c:if test="${Todaylist.hasNext()}">
							<a href="?page=${Todaylist.number +2}&size=${Todaylist.size}">다음</a>
						</c:if>
					</div>

				</form>
			</div>

		</div>
		<!--  subpage-main-container 클래스 -->
	</div>
	<!-- subpageWrapper 클래스 -->

	<%@ include file="../include/shortfooter.jsp"%>
	<script src="/js/subpage.js"></script>

</body>
</html>
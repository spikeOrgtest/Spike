<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 수정</title>

<link rel="stylesheet" href="/css/include/include.css">
<link rel="stylesheet" href="/css/support/subpage.css">
<link rel="stylesheet" href="/css/manager/EditUser.css">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">관리자 페이지</h3>
				<ul>
					<li><a href="/spike.com/ma">대시보드</a></li>
					<li><a href="/spike.com/userManagement">사용자관리</a></li>
					<li><a href="newsSubpage_product.jsp">계좌수정</a></li>
					<li><a href="newsSubpage_product.jsp">거래내역관리</a></li>
					<li><a href="newsSubpage_job.jsp">대출관리</a></li>
					<li><a href="newsSubpage_notice.jsp">공지사항관리</a></li>
					<li><a href="newsSubpage_notice.jsp">보안관리</a></li>
				</ul>
			</div>
			<div class="subpage-content">
				<h2 style="margin-left: 50px;">사용자 수정</h2>
				<form action="UpdateUser" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<c:forEach var="item" items="${list}">
						<div class="form-group">
							<label for="user_id">사용자 번호</label> <input type="text"
								id="user_id" name="user_id" value="${item.user_id}" readonly>
						</div>

						<div class="form-group">
							<label for="loginId">사용자 ID</label> <input type="text"
								id="loginId" value="${item.loginId}" readonly>
						</div>

						<div class="form-group">
							<label for="name">이름</label> <input type="text" id="name"
								value="${item.name}" readonly>
						</div>

						<div class="form-group">
							<label for="birth_date">생년월일</label> <input type="text"
								id="birth_date" name="birth_date" value="${item.birth_date}"
								readonly>
						</div>

						<div class="form-group">
							<label for="email_id">이메일</label> <input type="text"
								id="email_id" value="${item.email_id}@${item.email_domain}"
								readonly>
						</div>

						<div class="form-group">
							<label for="phone">핸드폰</label> <input type="text" id="phone"
								value="${item.phone}" readonly>
						</div>

						<div class="form-group">
							<label for="postcode">주소</label> <input type="text"
								id="postcode" value="${item.postcode}" placeholder="우편번호"
								readonly>
						</div>
						<div class="form-group">
							<input type="text" id="roadAddress" value="${item.roadAddress}"
								placeholder="도로명주소" readonly>
						</div>
						<div class="form-group">
							<input type="text" id="jibunAddress" value="${item.jibunAddress}"
								placeholder="지번주소" readonly>
						</div>
						<div class="form-group">
							<input type="text" id="detailAddress"
								value="${item.detailAddress}" placeholder="상세주소" readonly>
						</div>

						<div class="form-group">
							<label for="is_minor">미성년자 여부</label> <input type="text"
								id="is_minor" name="is_minor" value="${item.is_minor}">
						</div>

						<div class="form-group">
							<label for="status">상태</label> <input type="text" id="status"
								name="status" value="${item.status}">
						</div>
					</c:forEach>

					<div class="form-buttons">
						<button type="submit" class="submit-btn">수정</button>
						<button type="reset" class="reset-btn">취소</button>
					</div>
				</form>

			</div>

		</div>
	</div>
	<%@ include file="../include/shortfooter.jsp"%>
</body>
</html>
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
<link rel="stylesheet" href="/css/manager/loanState.css">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="subpageWrapper">
		<div class="subpage-main-container" style="justify-content: center;">

			<div class="subpage-content">
				<h2 style="margin-left: 50px;">사용자 정보</h2>
				<!-- 사용자 정보 섹션 - forEach 제거 -->
				<form action="UpdateUser" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<label for="userId">사용자 번호</label> <input type="text" id="userId"
							name="userId" value="${user.userId}" readonly autocomplete="off">
					</div>
					<div class="form-group">
						<label for="loginId">사용자 ID</label> <input type="text"
							id="loginId" name="loginId" value="${user.loginId}" readonly
							autocomplete="off">
					</div>

					<div class="form-group">
						<label for="userName">이름</label> <input type="text" id="userName"
							name="name" value="${user.name}" readonly autocomplete="off">
					</div>

					<div class="form-group">
						<label for="birthDate">생년월일</label> <input type="text"
							id="birthDate" name="birthDate" value="${user.birthDate}"
							readonly autocomplete="off">
					</div>

					<div class="form-group">
						<label for="email">이메일</label> <input type="text" id="email"
							value="${user.emailId}@${user.emailDomain}" readonly
							autocomplete="off">
					</div>

					<div class="form-group">
						<label for="userPhone">핸드폰</label> <input type="text"
							id="userPhone" name="phone" value="${user.phone}" readonly
							autocomplete="off">
					</div>

					<div class="form-group">
						<label for="userPostcode">주소</label> <input type="text"
							id="userPostcode" name="postcode" value="${user.postcode}"
							placeholder="우편번호" readonly autocomplete="off">
					</div>
					<div class="form-group">
						<label for="userRoadAddress">도로명주소</label> <input type="text"
							id="userRoadAddress" name="roadAddress"
							value="${user.roadAddress}" readonly autocomplete="off">
					</div>
					<div class="form-group">
						<label for="userJibunAddress">지번주소</label> <input type="text"
							id="userJibunAddress" name="jibunAddress"
							value="${user.jibunAddress}" readonly autocomplete="off">
					</div>
					<div class="form-group">
						<label for="userDetailAddress">상세주소</label> <input type="text"
							id="userDetailAddress" name="detailAddress"
							value="${user.detailAddress}" readonly autocomplete="off">
					</div>

					<div class="form-group">
						<label for="userIsMinor">미성년자 여부</label> <select id="userIsMinor"
							name="isMinor" disabled>
							<option value="${user.isMinor}" selected>${user.isMinor}(현재
								상태)</option>
						</select>
					</div>

					<div class="form-group">
						<label for="userStatus">상태</label> <select id="userStatus"
							name="status" disabled>
							<option value="${user.status}" selected>${user.status}(현재
								상태)</option>
						</select>
					</div>
				</form>

				<!-- 대출 정보 섹션 -->
				<h2 style="margin-left: 50px;">대출 신청 정보</h2>
				<div class="loan-item">
					<div class="form-group">
						<label for="loanAmount">대출 금액</label> <input type="text"
							id="loanAmount" name="loanAmount" value="${loan.loanAmount}"
							readonly autocomplete="off">
					</div>
					<div class="form-group">
						<label for="loanState">대출 상태</label> <input type="text"
							id="loanState" name="loanState" value="${loan.loanState}"
							readonly autocomplete="off">
					</div>

					<c:if test="${loan.loanState eq '대기 중'}">
						<div class="button-group">
							<!-- 수락 버튼 -->
							<form id="acceptLoanForm" action="/spike.com/admin/acceptLoan"
								method="POST" style="display: inline-block;">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="userId"
									value="${loan.owner.userId}" /> <input type="hidden"
									name="loanId" value="${loan.loanId}" /> <input type="hidden"
									name="loanAmount" value="${loan.loanAmount}" />
								<button type="submit" class="submit-btn">수락</button>
							</form>

							<!-- 거절 버튼 -->
							<form id="rejectLoanForm" action="/spike.com/admin/rejectLoan"
								method="POST" style="display: inline-block;">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="loanId"
									value="${loan.loanId}" />
								<button type="submit" class="reject-btn">거절</button>
							</form>

							<!-- 목록 버튼 -->
							<form id="listForm" style="display: inline-block;">
								<button type="button" class="list-btn"
									onclick="location.href='/spike.com/admin/loanManagement'">목록</button>
							</form>
						</div>
					</c:if>



				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/shortfooter.jsp"%>
	<script src="/js/manager/loanstate.js"></script>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/findId.css">
</head>
<body>
	<div class="content">
		<div class="findId">
			<div class="find-container">
				<h2>아이디 찾기</h2>
				<form name="s" action="findId_ok" method="post" class="findId-form"
					 id="findIdForm">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <label for="name">이름</label>
					<div class="input-container">
						<div class="input-name">
							<input type="text" name="name" id="name" placeholder="이름을 입력하세요">
							<span class="error-message" id="nameError" style="color:red;"></span>
						</div>
					</div>

					<label for="phone">핸드폰 번호</label>
					<div class="input-container">

						<div class="input-phone">
							<select name="phone01" id="phone01">
								<c:forEach var="p" items="${phone}">
									<option value="${p}">${p}</option>
								</c:forEach>
							</select> - <input type="text" name="phone02" id="phone02" size="4"
								maxlength="4"> - <input type="text"
								name="phone03" id="phone03" size="4" maxlength="4" >
						</div>
								<span class="error-message" id="phoneError" style="color:red;"></span>
					</div>
						<button type="reset" onclick="$('#name').focus();">취소</button>
						<button type="submit" class="findId-btn">아이디 찾기</button>
				</form>

			</div>
		</div>
	</div>
</body>
<script>
document.getElementById('findIdForm').addEventListener('submit', function(e) {
    let isValid = true;


    document.getElementById('nameError').textContent = '';
    document.getElementById('phoneError').textContent = '';

    // 이름 필드 검증
    const name = document.getElementById('name').value;
    if (name === '') {
        document.getElementById('nameError').textContent = '이름을 입력해주세요';
        document.getElementById('name').focus();
        isValid = false;
    }

    // 전화번호 필드 검증
    if (isValid) {
        const phone01 = document.getElementById('phone01').value;
        const phone02 = document.getElementById('phone02').value;
        const phone03 = document.getElementById('phone03').value;
        const phoneRegex = /^[0-9]{4}$/;

        if (phone02 === '' || phone03 === '') {
            document.getElementById('phoneError').textContent = '핸드폰 번호를 입력해주세요';
            document.getElementById('phone02').focus();
            isValid = false;
        } else if (!phoneRegex.test(phone02) || !phoneRegex.test(phone03)) {
            document.getElementById('phoneError').textContent = '핸드폰 번호가 올바르지 않습니다';
            document.getElementById('phone02').focus();
            isValid = false;
        }
    }


    if (!isValid) {
        e.preventDefault();
    }
});
</script>
</html>
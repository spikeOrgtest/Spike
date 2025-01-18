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
<script>
function id_check() {
    if($.trim($("#name").val()) == "") {  // #name을 jQuery로 선택
        alert("이름을 입력하세요");
        $("#name").val("").focus();  // jQuery로 value 설정 후 focus
        return false;  // 잘못된 'retrun'을 'return'으로 수정
    }
    
    if($.trim($("#phone").val()) == "") {  // #phone을 jQuery로 선택
        alert("핸드폰 번호를 입력하세요");
        $("#phone").val("").focus();  // jQuery로 value 설정 후 focus
        return false;  // 잘못된 'retrun'을 'return'으로 수정
    }
}

</script>
</head>
<body>
	<div class="content">
		<div class="findId">
			<div class="find-container">
				<h2>아이디 찾기</h2>
				<form name="s" action="findId_ok" method="post" class="findId-form"
					onsubmit="return id_chekc();">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <label for="name">이름</label>
					<div class="input-container">
						<div class="input-name">
							<input type="text" name="name" id="name" placeholder="이름을 입력하세요"
								required>
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
								maxlength="4" required> - <input type="text"
								name="phone03" id="phone03" size="4" maxlength="4" required>
						</div>
					</div>
						<button type="reset" onclick="$('#name').focus();">취소</button>
						<button type="submit" class="findId-btn">아이디 찾기</button>
				</form>

			</div>
		</div>
	</div>
</body>
</html>
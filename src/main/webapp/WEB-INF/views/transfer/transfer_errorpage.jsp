<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<%-- 송금과정 서버단 에러처리 담당할 페이지 --%>
	<%-- 에러메시지 출력 후 특정 페이지로 리다이렉션 or 뒤로가기 --%>
	<script>
        alert("${errorMessage}");
        if(${not empty redirectionURL}) window.location.href = "${redirectionURL}";
        else history.back();
	</script>
</body>
</html>
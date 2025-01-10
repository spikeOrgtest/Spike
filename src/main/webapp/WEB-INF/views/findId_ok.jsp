<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<link rel="stylesheet" type="text/css" href="./css/member.css" />
<link rel="stylesheet" href="../css/findId_ok.css">
</head>
<body>
	<div id="OK_wrap">
		<h2>아이디 검색 결과</h2>
		<table id="OK_t">
			<tr>
				<th colspan="2">${find_name} 님의</th>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${find_id}</td>
			</tr>
		</table>
		<div id="OK_menu">
			<button type="button" onclick="self.close();">닫기</button>
		</div>
	</div>
</body>
</html>
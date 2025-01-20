<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Point 확인</title>
<link rel="stylesheet" href="../css/support/subpage.css">
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/mini/point.css">
<!-- Font Awesome 아이콘 라이브러리 추가 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
</head>

<body class="subpage">
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/subnav.jsp"%>

	<div class="subpageWrapper">
		<!-- 서브페이지 래퍼 -->
		<div class="subpage-main-container">
			<!-- 사이드바 -->
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">Spike Mini Quiz</h3>
				<ul>
					<li><a href="minisubpage_Quiz.jsp">OX Quiz</a></li>
					<li><a href="miniSubpage_quiz_shop.jsp">Point Shop</a></li>
					<li><a href="myPointPage.jsp">My Point</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">
				<!-- My Point 배너 -->
				<div class="banner">
					<i class="fas fa-wallet banner-icon"></i>
					<!-- Font Awesome 아이콘 사용 -->
					<span>My Point 확인</span>
				</div>

				<div class="my-point-container">
					<!-- 포인트 확인 -->
					<div class="point-box">
						<h3>내 포인트</h3>
						<div class="icon">
							<i class="fas fa-coins"></i>
						</div>
						<p id="pointDisplay">0</p>
					</div>

					<!-- 맞춘 퀴즈 갯수 확인 -->
					<div class="quiz-box">
						<h3>맞춘 퀴즈 갯수</h3>
						<div class="icon">
							<i class="fas fa-check-circle"></i>
						</div>
						<p>0/0</p>
					</div>
				</div>

				<!-- 추가적인 섹션: 예시로 다른 퀴즈나 관련 정보 표시 -->
				<div class="quiz-ranking">
					<h3>퀴즈 랭킹</h3>
					<table>
						<thead>
							<tr>
								<th>순위</th>
								<th>사용자</th>
								<th>맞춘 퀴즈 수</th>
								<th>총 포인트</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>홍길동 <span class="rank-icon"><i
										class="fas fa-star"></i></span></td>
								<td>18/20</td>
								<td>1,250 P</td>
							</tr>
							<tr>
								<td>2</td>
								<td>김철수 <span class="rank-icon"><i
										class="fas fa-star"></i></span></td>
								<td>17/20</td>
								<td>1,100 P</td>
							</tr>
							<tr>
								<td>3</td>
								<td>이영희 <span class="rank-icon"><i
										class="fas fa-star"></i></span></td>
								<td>16/20</td>
								<td>1,000 P</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
	
	

	<%@ include file="../include/shortfooter.jsp"%>
</body>

<script>
window.onload = function () {
    // 서버에 점수 요청하기
    fetch('/spike.com/quiz/mypoint') // 컨트롤러 서버에 요청 보내기 
        .then(response => response.json()) // 서버에서 온 응답을 텍스트로 변환
        .then(data => {
            // 점수를 화면에 보여주기
            const pointElement = document.getElementById('pointDisplay');
            if (pointElement) {
                pointElement.innerText = data+" P";
            } else {
                console.error('pointDisplay 요소를 찾을 수 없습니다.');
            }
        })
        .catch(error => {
            // 에러가 생기면 알림
        	console.error('요청중 에러발생');
        });
};
</script>
</html>

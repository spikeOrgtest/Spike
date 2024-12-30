<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/quiz.css">

</head>
<body class="subpage">
	<%@ include file="include/header.jsp"%>

	<div class="subpageWrapper">
		<%-- 서브페이지 래퍼 --%>

		<%-- 서브네비바 --%>
		<div class="subpage-navigation-bar"></div>

	</div>
	<%-- /wrap --%>



	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container">

			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">Spike Mini</h3>
				<ul>
					<li><a href="minisubpage_Quiz.jsp">OX 퀴즈</a></li>
					<li><a href=".jsp">포인트 확인</a></li>
					<li><a href=".jsp">뭐가 필요하지?</a></li>

				</ul>
			</div>

			<%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
			<div class="subpage-content-wrap">
			
			<div class="subpageWrapper">
			<img alt="gif" src="assets/img/gif/quiz.gif" width="480" height="270">
			</div>
			
			
				<div class="quiz-wrapper">
					<div class="quiz-container">
						<h1 class="quiz-title">OX 퀴즈</h1>
						<p class="quiz-instruction">나오는 질문에 O, X를 선택해주세요. 질문에 대한 답을
							바로바로 확인하며 쉽고 빠르게 자신의 금융지식을 테스트 해볼 수 있습니다.</p>

						<div class="quiz-question">
							<h2>Q1. 보험금은 보험계약자만 받을 수 있다.</h2>

							<div class="quiz-options">
								<button class="quiz-option" onclick="showResult(true)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false)">
									<div class="quiz-letter">X</div>
									<div class="quiz-text">그렇지 않아요</div>
								</button>
							</div>

						</div>
						
						<div class="quiz-buttons">
							<button class="quiz-check-answer">정답확인</button>
							<button class="quiz-next-question">다음문제</button>
						</div>

						<div class="quiz-result" id="quiz-result">
							<!-- 결과 메시지가 여기에 표시됩니다. -->
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>




	<%@ include file="include/shortfooter.jsp"%>
	<script src="assets/js/subpage.js"></script>
	<script>
		function showResult(isCorrect) {
			const resultDiv = document.getElementById('quiz-result');
			if (isCorrect) {
				resultDiv.innerHTML = '<p class="quiz-result-correct">정답입니다!</p>';
			} else {
				resultDiv.innerHTML = '<p class="quiz-result-wrong">오답입니다!</p>';
			}
		}
	</script>
</body>
</html>

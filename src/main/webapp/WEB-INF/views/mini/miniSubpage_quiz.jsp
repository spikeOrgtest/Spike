<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OX 퀴즈</title>
<link rel="stylesheet" href="../css/support/subpage.css">
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/mini/quiz.css">
</head>

<body class="subpage">
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/subnav.jsp"%>

	<div class="subpageWrapper">
		<%-- 서브페이지 래퍼 --%>

		<%-- 서브네비바 --%>
	</div>
	<%-- /wrap --%>

	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container">

			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">Spike Mini Quiz</h3>
				<ul>
					<li><a href="minisubpage_Quiz.jsp">OX Quiz</a></li>
					<li><a href="miniSubpage_quiz_shop.jsp">Point Shop</a></li>
					<li><a href=".jsp">My Point</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">

				<div class="subpageWrapper">
					<img alt="gif" src="../images/mini/quiz.gif" width="450"
						height="300">
				</div>

				<div class="quiz-wrapper">
					<div class="quiz-container">

						<h1 class="quiz-title">OX 퀴즈</h1>

						<!-- 퀴즈 소개 페이지 -->
						<div class="quiz-question active" id="quiz1">
							<h2>
								나오는 질문에 O, X를 선택해주세요. <br /> 질문에 대한 답을 바로바로 확인하며, <br /> 쉽고 빠르게
								자신의 '금융지식'을 <br /> 테스트 해볼 수 있습니다.
							</h2>

							<button class="quiz-next-question" onclick="nextQuestion(2)">문제
								풀기</button>
							<div class="quiz-result" id="quiz-result-1"></div>
						</div>

						<!-- 첫 번째 문제 -->
						<div class="quiz-question" id="quiz2">
							<h2>Q1. 신용카드는 대출이 가능하다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(3)">다음문제</button>
							<div class="quiz-result" id="quiz-result-2"></div>
						</div>

						<!-- 두 번째 문제 -->
						<div class="quiz-question" id="quiz3">
							<h2>Q2. 예금은 원금을 보장한다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(4)">다음문제</button>
							<div class="quiz-result" id="quiz-result-3"></div>
						</div>

						<!-- 세 번째 문제 -->
						<div class="quiz-question" id="quiz4">
							<h2>Q3. 대출 금리는 경제 상황에 따라 변할 수 있다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(5)">다음문제</button>
							<div class="quiz-result" id="quiz-result-4"></div>
						</div>

						<!-- 네 번째 문제 -->
						<div class="quiz-question" id="quiz5">
							<h2>Q4. 적금은 정해진 기간 동안 돈을 맡기는 방식이다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(6)">다음문제</button>
							<div class="quiz-result" id="quiz-result-5"></div>
						</div>

						<!-- 5 번째 문제 -->
						<div class="quiz-question" id="quiz6">
							<h2>Q5. 보험금은 사고가 발생해야 받는다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(7)">다음문제</button>
							<div class="quiz-result" id="quiz-result-6"></div>
						</div>

						<!-- 6 번째 문제 -->
						<div class="quiz-question" id="quiz7">
							<h2>Q6. 신용 점수는 대출을 받을 때 중요한 요소다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(8)">다음문제</button>
							<div class="quiz-result" id="quiz-result-7"></div>
						</div>

						<!-- 7 번째 문제 -->
						<div class="quiz-question" id="quiz8">
							<h2>Q7. 카드 대출은 높은 금리가 적용될 수 있다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(9)">다음문제</button>
							<div class="quiz-result" id="quiz-result-8"></div>
						</div>

						<!-- 8 번째 문제 -->
						<div class="quiz-question" id="quiz9">
							<h2>Q8. 상속세는 상속을 받을 때 부과된다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(10)">다음문제</button>
							<div class="quiz-result" id="quiz-result-9"></div>
						</div>

						<!-- 9 번째 문제 -->
						<div class="quiz-question" id="quiz10">
							<h2>Q9. 예금 보험공사는 예금자의 돈을 보호한다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(11)">다음문제</button>
							<div class="quiz-result" id="quiz-result-10"></div>
						</div>

						<!-- 10 번째 문제 -->
						<div class="quiz-question" id="quiz11">
							<h2>Q10. 은행 대출은 신용 평가를 바탕으로 승인된다.</h2>
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
							<button class="quiz-next-question" onclick="nextQuestion(1)">다시
								시작</button>
							<div class="quiz-result" id="quiz-result-11"></div>
						</div>

						<!-- 점수 표시 영역 -->
						<div id="quiz-score"></div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/shortfooter.jsp"%>
	<script>
		// 현재 문제 번호를 추적하는 전역 변수
		let currentQuestion = 1;

		// 점수를 추적하는 변수
		let score = 0;

		// 정답 확인 함수
		function showResult(isCorrect) {
			let resultElement = document.getElementById('quiz-result-'
					+ currentQuestion);

			// 정답이면 점수 +1
			if (isCorrect) {
				score += 1; // 점수 증가
				resultElement.innerHTML = '<p class="quiz-result-correct">정답입니다!</p>';
			} else {
				resultElement.innerHTML = '<p class="quiz-result-wrong">오답입니다!</p>';
			}

			// 점수 표시 (결과 영역에 점수도 함께 표시)
			let scoreElement = document.getElementById('quiz-score');
			if (scoreElement) {
				scoreElement.innerHTML = '<p>현재 점수: ' + score + '</p>';
			}
		}

		// 다음 문제로 넘어가는 함수
		function nextQuestion(questionNumber) {
			// 현재 문제 숨기기
			document.getElementById('quiz' + currentQuestion).classList
					.remove('active');

			// 새로운 문제 번호로 현재 문제 업데이트
			currentQuestion = questionNumber;

			// 새로운 문제 표시하기
			document.getElementById('quiz' + currentQuestion).classList
					.add('active');
		}
	</script>

</body>
</html>

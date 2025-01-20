<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
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
	</div>

	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">Spike Mini Quiz</h3>
				<ul>
					<li><a href="minisubpage_Quiz.jsp">OX Quiz</a></li>
					<li><a href="miniSubpage_quiz_shop.jsp">Point Shop</a></li>
					<li><a href=".jsp">My Point</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">
				<div class="quiz-wrapper">
					<div class="quiz-container">
						<h1 class="quiz-title">OX 퀴즈</h1>

						<!-- 퀴즈 문제들 -->
						<div class="quiz-question active" id="quiz1">
							<h2>
								나오는 질문에 O, X를 선택해주세요. <br /> 질문에 대한 답을 바로바로 확인하며, <br /> 쉽고
								빠르게 자신의 '금융지식'을 <br /> 테스트 해볼 수 있습니다.
							</h2>

							<button class="quiz-next-question" onclick="nextQuestion(2)">문제 풀기</button>
							<div class="quiz-result" id="quiz-result-1"></div>
						</div>

						<!-- 첫 번째 문제 -->
						<div class="quiz-question" id="quiz2">
							<h2>Q1. 신용카드는 대출이 가능하다.</h2>
							<div class="quiz-options">
								<button class="quiz-option" onclick="showResult(true, 2)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 2)">
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
								<button class="quiz-option" onclick="showResult(true, 3)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 3)">
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
								<button class="quiz-option" onclick="showResult(true, 4)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 4)">
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
								<button class="quiz-option" onclick="showResult(true, 5)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 5)">
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
								<button class="quiz-option" onclick="showResult(true, 6)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 6)">
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
								<button class="quiz-option" onclick="showResult(true, 7)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 7)">
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
								<button class="quiz-option" onclick="showResult(true, 8)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 8)">
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
								<button class="quiz-option" onclick="showResult(true, 9)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 9)">
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
								<button class="quiz-option" onclick="showResult(true, 10)">
									<div class="quiz-letter">O</div>
									<div class="quiz-text">그래요</div>
								</button>
								<button class="quiz-option" onclick="showResult(false, 10)">
									<div class="quiz-letter">X</div>
									<div class="quiz-text">그렇지 않아요</div>
								</button>
							</div>
							<button class="quiz-next-question" onclick="nextQuestion(11)">다음문제</button>
							<div class="quiz-result" id="quiz-result-10"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/shortfooter.jsp"%>

<script>
    let currentQuestion = 1;
    let score = 0;
    const userId = 12345; // 로그인한 사용자의 user_id로 변경 필요

    // 문제를 넘기는 함수
    function nextQuestion(questionNumber) {
        const currentQuiz = document.getElementById('quiz' + currentQuestion);
        if (currentQuiz) {
            currentQuiz.classList.remove('active');
        }

        const nextQuiz = document.getElementById('quiz' + questionNumber);
        if (nextQuiz) {
            nextQuiz.classList.add('active');
        }

        currentQuestion = questionNumber;
    }

    // 정답을 선택하고 결과를 표시하는 함수
    function showResult(isCorrect, questionNumber) {
        let resultElement = document.getElementById('quiz-result-' + questionNumber);

        if (isCorrect) {
            score += 100; // 1문제 맞추면 100포인트
            resultElement.innerHTML = '<p class="quiz-result-correct">정답입니다!</p>';
        } else {
            resultElement.innerHTML = '<p class="quiz-result-wrong">오답입니다!</p>';
        }

        // 백엔드에 점수 전송 (포인트)
        sendPointsToBackend(isCorrect);
    }

    // 점수를 백엔드에 전송하는 함수
    function sendPointsToBackend(isCorrect) {
        fetch('/update-score', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                user_id: userId, // 로그인한 사용자의 ID
                quiz_id: currentQuestion, // 현재 퀴즈 ID
                answered_correctly: isCorrect ? 'Y' : 'N', // 정답 여부
                earned_points: isCorrect ? 100 : 0, // 100 포인트 또는 0
            }),
        })
        .then(response => response.json())
        .then(data => {
            console.log('포인트 업데이트 성공:', data);
        })
        .catch(error => {
            console.error('포인트 업데이트 실패:', error);
        });
    }
</script>



</body>
</html>

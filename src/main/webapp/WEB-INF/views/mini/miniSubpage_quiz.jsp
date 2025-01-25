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
				<h3 class="subpage-sidebar-title">O/X Quiz</h3>
				<ul>
					<li><a href="mini">mini home</a></li>
					<li><a href="quiz">O/X Quiz</a></li>
					<li><a href="shop">Point Shop</a></li>
					<li><a href="point">My Point</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">
				<h1 class="quiz-title">
					<span class="text-blue">O</span> <span class="text-black">/</span>
					<span class="text-red">X</span> <span class="text-black"> 퀴즈</span>
				</h1>

				<div class="quiz-wrapper">
					<div class="quiz-container">
						<div class="quiz_start">
							

							<!-- 퀴즈 문제 시작 -->
							
							<div class="quiz-question active" id="quiz1">
							<h1> O/X Quiz</h1>
								<h2>
									나오는 질문에 O, X를 선택해주세요. <br /> 질문에 대한 답을 바로바로 확인하며, <br /> 쉽고
									빠르게 자신의 '금융지식'을 <br /> 테스트 해볼 수 있습니다.
								</h2>

								<button class="quiz-next-question" onclick="nextQuestion(2)">문제
									풀기</button>
								<div class="quiz-result" id="quiz-result-1"></div>
							</div>
						</div>
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
							<button class="quiz-next-question" onclick="showScoreSlide()">정답
								확인</button>
							<div class="quiz-result" id="quiz-result-6"></div>
						</div>

						<!-- 정답 확인 슬라이드 -->
						<div id="score-slide" class="score-slide">
							<p id="correct-answers">맞춘 문제: 0개</p>
							<p id="total-points">획득한 포인트: 0점</p>
							<!-- My Point 페이지로 넘어가는 버튼 -->
							<button class="quiz-next-question"
								onclick="window.location.href='point'">My Point</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/shortfooter.jsp"%>

	<script>
    // 초기 상태 정의
    let currentQuestion = 1;  // 현재 퀴즈 번호
    let correctCount = 0;      // 맞춘 문제 수
    let totalPoints = 0;       // 획득한 포인트

 // 문제를 넘기는 함수
    function nextQuestion(questionNumber) {
        // 현재 문제 숨기기
        const currentQuiz = document.getElementById('quiz' + currentQuestion);
        if (currentQuiz) {
            currentQuiz.classList.remove('active');
        }

        // 다음 문제 표시
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
            correctCount += 1; // 맞춘 문제 수 증가
            totalPoints += 100; // 100 포인트 추가
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

    // 정답과 맞춘 문제 수 슬라이드로 보여주는 함수
    function showScoreSlide() {
        // 점수와 맞춘 문제 수 업데이트
        document.getElementById('correct-answers').textContent = '맞춘 문제: ' + correctCount + '개';
        document.getElementById('total-points').textContent = '획득한 포인트: ' + totalPoints + '점';

        // 퀴즈 숨기기
        for (let i = 1; i <= 5; i++) {
            const quiz = document.getElementById('quiz' + i);
            if (quiz) {
                quiz.classList.remove('active');
            }
        }

        // 슬라이드 애니메이션 효과
        const scoreSlide = document.getElementById('score-slide');
        scoreSlide.classList.add('show');  // show 클래스를 추가하여 슬라이드 표시
    }

</script>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OX 퀴즈</title>
<link rel="stylesheet" href="../css/support/subpage.css">
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/mini/quiz.css">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

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
					<li><a href="minisub">mini home</a></li>
					<li><a href="quiz">O/X Quiz</a></li>
					<li><a href="shop">Point Shop</a></li>
					<li><a href="point">My Point</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">
				<h1 class="quiz-title">
					<span class="quiz-banner">OX 퀴즈</span>
				</h1>


				<div class="quiz-wrapper">
					<div class="quiz-container">
						<div class="quiz_start">


							<!-- 퀴즈 문제 시작 -->

							<div class="quiz-question active" id="quiz1">
								<h1>Quiz Start</h1>
								<h2>
									질문에 대해 O 또는 X를 선택해 주세요. <br /> 각 문제에 대한 답은 한 번만 선택할 수 있습니다. <br />
									문제를 맞출 때마다 100포인트가 지급됩니다. <br /> 준비가 되셨다면 아래 버튼을 눌러 시작하세요!
								</h2>


								<button class="quiz-start-button" onclick="startQuiz(2)">문제
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
							<div class="score-item">
								<i class="fas fa-check-circle score-icon"></i>
								<p id="correct-answers">
									맞춘 문제: <span id="correct-count">0개</span>
								</p>
							</div>
							<div class="score-item">
								<i class="fas fa-coins score-icon"></i>
								<p id="total-points">
									획득한 포인트: <span id="point-count">0점</span>
								</p>
							</div>
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
    let currentQuestion;  // 현재 퀴즈 번호
    let correctCount;      // 맞춘 문제 수
    let totalPoints;       // 획득한 포인트

 // 퀴즈 시작 함수
    function startQuiz(questionNumber) {
        // '문제 풀기' 버튼을 숨깁니다.
        const startButton = document.querySelector('.quiz-start-button');
        if (startButton) {
            startButton.style.display = 'none';  // 문제 풀기 버튼 숨김
        }

        // 현재 슬라이드 숨기고 첫 번째 문제 슬라이드 표시
        const currentQuiz = document.querySelector('.quiz-question.active');
        if (currentQuiz) {
            currentQuiz.classList.remove('active');  // 현재 문제 슬라이드 숨기기
        }

        // 첫 번째 문제 슬라이드 활성화
        const quiz = document.getElementById('quiz' + questionNumber);
        if (quiz) {
            quiz.classList.add('active');  // 첫 번째 문제 슬라이드 활성화
        }

        // 퀴즈 번호 갱신
        currentQuestion = questionNumber;
    }

    // 문제를 넘기는 함수 (정답을 선택했는지 확인)
    function nextQuestion(questionNumber) {
        const currentQuiz = document.getElementById('quiz' + currentQuestion);
        const resultElement = document.getElementById('quiz-result-' + currentQuestion);
        
        // 정답을 선택하지 않은 경우 경고창 띄우기
        if (!resultElement.dataset.answered) {
            alert("정답을 선택해주세요!");
            return;  // 정답을 선택하지 않으면 함수 종료
        }
        
        // 현재 문제 숨기기
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
        let quizOptions = document.querySelectorAll(`#quiz${questionNumber} .quiz-option`);

        // 이미 선택한 경우 경고 메시지 띄우고 함수 종료
        if (resultElement.dataset.answered === "true") {
            alert("이미 정답을 선택하였습니다!");
            return;
        }

        if (isCorrect) {
            correctCount += 1; // 맞춘 문제 수 증가
            totalPoints += 100; // 100 포인트 추가
            resultElement.innerHTML = '<p class="quiz-result-correct">정답입니다!</p>';
        } else {
            resultElement.innerHTML = '<p class="quiz-result-wrong">오답입니다!</p>';
        }

        // 정답 선택 후 모든 버튼 비활성화
        quizOptions.forEach(button => {
            button.disabled = true;
        });

        // 정답 선택 상태 저장
        resultElement.dataset.answered = "true";

        // 백엔드에 점수 전송 (포인트)
        sendPointsToBackend(isCorrect);
    }

    // 점수를 백엔드에 전송하는 함수
    function sendPointsToBackend(isCorrect) {
        const header = document.querySelector('meta[name="_csrf_header"]').content;
        const token = document.querySelector('meta[name="_csrf"]').content;
        
        fetch('/spike.com/update-score', {
            method: 'POST',
            headers: {
                'header': header,
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token
            },
            body: JSON.stringify({
                quizId: currentQuestion, // 현재 퀴즈 ID
                answeredCorrectly: isCorrect ? 'Y' : 'N', // 정답 여부
                earnedPoints: isCorrect ? 100 : 0, // 100 포인트 또는 0
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
    
 	    
    window.onload = function() {
    	currentQuestion = 1;
    	correctCount = 0;
    	totalPoints = 0;
        
    }
    	
    	
</script>

</body>
</html>

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
    // 페이지가 로드될 때 퀴즈 목록을 불러오는 함수
    window.onload = function() {
        loadQuizzes();  // 퀴즈 목록을 불러오는 함수 호출
    };

    // 서버에서 퀴즈 목록을 가져오는 함수
    function loadQuizzes() {
        // '/spike.com/quizlist' URL로 GET 요청을 보냄
        fetch('/spike.com/quizlist')
            .then(response => response.json())  // 응답을 JSON으로 변환
            .then(data => {
                const quizzes = data;  // 서버에서 받은 퀴즈 목록
                let quizContainer = document.getElementById("quiz-container");  // 퀴즈를 표시할 HTML 요소

                // 받아온 퀴즈 데이터를 하나씩 처리해서 화면에 표시
                quizzes.forEach(quiz => {
                    const quizElement = document.createElement("div");
                    quizElement.classList.add('quiz-question');
                    quizElement.innerHTML = `
                        <h2>${quiz.question}</h2>
                        <div class="quiz-options">
                            <button class="quiz-option" onclick="submitAnswer(${quiz.quizId}, 'O')">
                                <div class="quiz-letter">O</div>
                                <div class="quiz-text">그래요</div>
                            </button>
                            <button class="quiz-option" onclick="submitAnswer(${quiz.quizId}, 'X')">
                                <div class="quiz-letter">X</div>
                                <div class="quiz-text">그렇지 않아요</div>
                            </button>
                        </div>
                    `;
                    quizContainer.appendChild(quizElement);  // 새로운 퀴즈 문제를 화면에 추가
                });
            })
            .catch(error => console.error("퀴즈 로드 실패:", error));  // 오류 발생 시 콘솔에 오류 메시지 출력
    }

    // 사용자가 퀴즈를 풀었을 때 답을 제출하는 함수
    function submitAnswer(quizId, userAnswer) {
        fetch('/spike.com/quiz/attempt', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'  // 폼 데이터 형식으로 전송
            },
            body: `userId=1&quizId=${quizId}&userAnswer=${userAnswer}`  // 사용자 ID, 퀴즈 ID, 사용자 답안을 서버로 전송
        })
        .then(response => response.text())  // 서버에서 받은 메시지를 텍스트로 처리
        .then(message => alert(message))  // 받은 메시지를 알림창으로 표시
        .catch(error => console.error("퀴즈 제출 실패:", error));  // 오류 발생 시 콘솔에 오류 메시지 출력
    }
</script>


<div id="quiz-container"></div>
<div id="quiz-score"></div>

<div id="quiz-container"></div>
<div id="quiz-score"></div>



</body>
</html>

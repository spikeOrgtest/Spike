<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome! Spike mini</title>
<link rel="stylesheet" href="../css/support/subpage.css">
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/mini/submain.css">
<!-- FontAwesome CDN -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

</head>

<body class="subpage">
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/subnav.jsp"%>

	<div class="subpageWrapper">
		<div class="subpage-main-container">
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">Spike! mini</h3>
				<ul>
					<li><a href="mini">mini home</a></li>
					<li><a href="quiz">O/X Quiz</a></li>
					<li><a href="edu">Education</a></li>
				</ul>
			</div>

			<div class="subpage-content-wrap">
				<div class="quiz-wrapper">
					<div class="quiz-container">
						<h1 class="quiz-title">Spike! mini</h1>

						<!-- OX 퀴즈 소개 배너 -->
						<!-- OX 퀴즈 소개 배너 -->
						<div class="banner banner-quiz">
							<img src="https://img.icons8.com/color/96/idea.png" alt="퀴즈 아이콘"
								class="banner-icon">
							<div class="banner-text">
								<h2>O/X퀴즈 도전!</h2>
								<p>재미있게 O/X퀴즈를 풀고 포인트를 쌓아보세요!</p>
								<a href="quiz" class="banner-btn">바로가기</a>
							</div>
						</div>


						<!-- 금융 교육 소개 배너 -->
						<div class="banner banner-education"
							onclick="handleBannerClick(this)">
							<img src="https://img.icons8.com/color/96/pencil.png"
								alt="연필 아이콘" class="banner-icon">
							<div class="banner-text">
								<h2>금융 교육</h2>
								<p>쉽고 재미있는 금융 상식을 배워보세요!</p>
								<a href="edu" class="banner-btn">바로가기</a>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/shortfooter.jsp"%>

	<script>
function handleBannerClick(element) {
    element.classList.add('banner-clicked');
    setTimeout(() => {
        element.classList.remove('banner-clicked');
    }, 300); // 애니메이션 지속시간 (300ms)
}
</script>

</body>
</html>

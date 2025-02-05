<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>spike mini</title>
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/mini/mini.css">
</head>

<body>
	<%@ include file="../include/header.jsp"%>

	<main class="main">
		<div id="miniCont">
			<!-- mini_main Section -->
			<section id="mini_main" class="mini_main section">

				<div class="mini_container">
					<div class="mini_container_img" data-aos="zoom-out"
						data-aos-delay="100">
						<img src="../images/mini/mini_main.gif" class="img-fluid animated"
							alt="mini 메인">
					</div>
					<div class="mini_container_text" data-aos="fade-in">
						<h2>스 - 하!</h2>
						<p>
							나의 첫 은행!<br /> 잘 부탁해!<br /> 스파이크 mini
						</p>
					</div>
				</div>
			</section>
			<!-- /mini_main Section -->

			<!-- 가로선 추가 -->
			<div class="divider"></div>


			<!-- mini Title -->
			<section>
				<div class="mini_title">
					<h2>spike mini를 소개합니다.</h2>
				</div>
			</section>


			<!-- mini_intro 시작 -->

			<!-- mini_intro1 -->

			<section id="mini_intro" class="mini_intro section">
				<div class="mini_intro_container">
					<div class="mini_intro1">
						<div class="intro1_img" data-aos="zoom-out" data-aos-delay="100">
							<img src="../images/mini/sign_up.gif" class="img-fluid"
								alt="회원가입">
						</div>
						<div class="intro1_text" data-aos="fade-up" data-aos-delay="100">
							<h3>30초면 가능한 간편한 회원가입!</h3>
							<p class="intro_text1">
								미성년자라도 30초면 손쉽게 <br /> 회원가입이 가능합니다!
							</p>
						</div>
					</div>
				</div>
			</section>

			<!-- mini_intro2 -->
			<section id="mini_intro" class="mini_intro section">
				<div class="mini_intro_container">
					<div class="mini_intro2">
						<div class="intro2_img" data-aos="zoom-out" data-aos-delay="100">
							<img src="../images/mini/저금통.gif" class="img-fluid" alt="저금통">
						</div>
						<div class="intro2_text" data-aos="fade-up" data-aos-delay="100">
							<h3>명절 용돈! 부모님 은행은 그만~ </h3>
							<p class="intro_text2">
								 나만의 은행에 보관할 수 있어요! <br /> 입금과 출금이
								간편해요!
							</p>
						</div>
					</div>
				</div>
			</section>


			<!-- mini_intro1 -->
			<section id="mini_intro" class="mini_intro section">
				<div class="mini_intro_container">
					<div class="mini_intro1">
						<div class="intro1_img" data-aos="zoom-out">
							<img src="../images/mini/지갑.gif" class="img-fluid" alt="지갑">
						</div>
						<div class="intro1_text" data-aos="fade-up">
							<h3>퀴즈 풀고 용돈 벌자!</h3>
							<p class="intro_text1">
								쉬운 경제 퀴즈 풀고,<br /> 포인트는 쏠쏠하게! 
							</p>
						</div>
					</div>
				</div>
			</section>

			<!-- mini_intro2 -->
			<section id="mini_intro" class="mini_intro section">
				<div class="mini_intro_container">
					<div class="mini_intro2">
						<div class="intro2_img" data-aos="zoom-out">
							<img src="../images/mini/경제.gif" class="img-fluid" alt="">
						</div>
						<div class="intro2_text" data-aos="fade-up">
							<h3>미리 배우는 경제활동!</h3>
							<p class="intro_text2">
								언제 어디서나 함께하는 <br />  
								재밌는 경제교육 & O/X 퀴즈!
								<br /> 
							</p>
						</div>
					</div>
				</div>
			</section>



		</div>
	</main>

	<!-- 바로가기 버튼 -->
	<a href="minisub" class="shortcut-button">
		<div class="button-content">
			<span class="button-text">mini 바로가기 </span>
		</div>
	</a>
	<%@ include file="../include/footer.jsp"%>
<script>

//퀴즈 관련 페이지 반환 알림창
window.onload = function() {
    // 쿼리 파라미터에서 'message'를 가져오기
    const urlParams = new URLSearchParams(window.location.search);
    const message = urlParams.get('message');

    // 메시지가 있으면 알림창을 띄움
    if (message) {
        alert(message);
    }
}
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SPIKE! 번개처럼 빠른 송금</title>
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/index.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">

</head>
<body>
	<%-- header --%>
	<jsp:include page="include/header.jsp" />
	<%-- 본문 시작 --%>


	<div class="content">
		<%-- 섹션1 --%>
		<div class="section" id="section1">
			<div class="secWrapper">
				<div class="section-top">
					<div class="section-top-div1">
						<span>다양한 기회, 더 큰 가능성</span> <br>금, 주식, 가상화폐까지.<br>당신에게 꼭 맞는 투자
						솔루션을 제안합니다
					</div>
					<div class="section-top-div2">
						<button type="button" class="section1-button" onclick="location.href='subpageLayout.jsp'">나에게 어울리는
							투자는?</button>
						<button type="button" class="section1-button2" onclick="location.href='miniSubpage_quiz.jsp'">알아보러 가기</button>
					</div>
				</div>
				<div class="tri-wrapper">
					<div class="triangle-container">
						<div class="triangle-item">
							<img src="assets/img/main/gold.png" alt="금 투자"
								class="triangle-image" id="trimage1">
						</div>
						<div class="triangle-item">
							<img src="assets/img/main/stockimg.png" alt="주식 투자"
								class="triangle-image" id="trimage2">
						</div>
						<div class="triangle-item">
							<img src="assets/img/main/bitcoinimg.png" alt="가상화폐 투자"
								class="triangle-image" id="trimage3">
						</div>
					</div>
					<div class="description-box">
						<h3></h3>
						<p></p>
					</div>
				</div>
			</div>
		</div>

		<%-- 섹션2 --%>
		<div class="section" id="section2">
			<div class="secWrapper">
				<div class="section-top">
					<div class="section-top-div1">
						<span>다양한 금융 상품</span><br> 나에게 꼭 맞는 선택
					</div>
					<div class="section-top-div2">
						<div>
							<br>안정적인 예금, 혜택이 가득한 적금, 필요한 시점에 대출까지! <br> <br>
							모든 금융 상품을 한 곳에서 쉽게 비교하고 선택하세요.
						</div>
					</div>
				</div>

				<div id="section2-img-wrapper" class="section2-img-wrapper">
					<img src="assets/img/main/youth.png" alt="아이콘 1" class="n1">
					<img src="assets/img/main/saving.png" alt="아이콘 2" class="n2">
					<img src="assets/img/main/vacation.png" alt="아이콘 3" class="n3">
					<img src="assets/img/main/premium.png" alt="아이콘 4" class="n4">
				</div>

				<div id="section2-text-wrapper">
					<div class="section2-text">
						<span>청년 저축 적금</span><br> <br> 목표 달성을 위한 최적의 선택<br>
						드림 적금과 함께.
					</div>

					<div class="section2-text">
						<span>1+1 적금</span><br> <br> 더욱 풍성하게,<br>미래를 준비하는<br>플러스
						적금.
					</div>

					<div class="section2-text">
						<span>여름휴가 대출</span><br> <br> 시원한 여름을 위한<br> 특별 대출!
					</div>

					<div class="section2-text">
						<span>SPIKE 프리미엄</span><br> <br> 특별한 당신을 위한<br> 빛나는
						선택! <br>SPIKE 프리미엄 카드
					</div>

				</div>
				<%-- wrapper --%>


			</div>
			<%-- secwrapper --%>
		</div>
		<%-- 섹션2 --%>

		<%-- 섹션3 --%>
		<div class="section" id="section3">
			<div class="secWrapper">
				<div class="section-top">
					<div class="section-top-div1">빠른 송금, 더 빠른 보호!<br>SPIKE SHIELD</div>
					
				</div>
				<
				<div class="imgslides" id="cheat-div1">
					<img alt="사기1" src="assets/img/main/cheat1.jpg" width="300"
						height="150">
				</div>
 
				<div class="imgslides" id="cheat-div2">
					<img alt="사기2" src="assets/img/main/cheat2.jpg" width="300"
						height="150">

				</div>
				<div class="imgslides" id="cheat-div3">
					<img alt="사기3" src="assets/img/main/cheat3.jpg" width="300"
						height="150">

				</div>
				<div class="imgslides" id="cheat-div4">
					<img alt="사기4" src="assets/img/main/cheat4.jpg" width="300"
						height="150">

				</div>


			</div>
		</div>

		<%-- 섹션4 --%>
		<div class="section" id="section4">
			<div class="secWrapper">
				<div class="section-top">
					<div class="section-top-div1">먼저 만나는 금융생활!<br>SPIKE Mini</div>
					

				</div>

				<div class="imgslides" id="mini-div1">
					<img alt="미니1" src="assets/img/main/mini1.jpg">
				</div>
				<div class="imgslides" id="mini-div2">
					<img alt="미니2" src="assets/img/main/mini2.jpg">
				</div>
				<div class="imgslides" id="mini-div3">
					<img alt="미니3" src="assets/img/main/mini3.jpg">
				</div>


			</div>
		</div>
	</div>
	<%--content --%>

<%--

	<div class="idx-slider">
		<div class="idx-slides">

			<div class="idx-slide">
				<img alt="사기1" src="assets/img/main/cheat1.jpg" class="slide-image">
			</div>


			<div class="idx-slide">
				<img alt="사기1" src="assets/img/main/cheat2.jpg" class="slide-image">
			</div>

			<div class="idx-slide">Slide 3</div>
			<div class="idx-slide">Slide 4</div>
		</div>

		<button class="prev-btn">Prev</button>
		<button class="next-btn">Next</button>
	</div>
 --%><%--
 
 <br><br><br><br><br>
 <div class="idx-slider">
  <div class="idx-slides">
    <img class="idx-slide" src="assets/img/main/cheat1.jpg" alt="Slide 1">
    <img class="idx-slide" src="assets/img/main/cheat2.jpg" alt="Slide 2">
    <img class="idx-slide" src="assets/img/main/cheat3.jpg" alt="Slide 3">
    <img class="idx-slide" src="assets/img/main/cheat4.jpg" alt="Slide 4">
  </div>
  <button class="prev-btn">◀</button>
  <button class="next-btn">▶</button>
</div>
  --%>

 


	<%-- 본문 끝 --%>
	<jsp:include page="include/footer.jsp" />
	<%-- footer --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
	<%--
	<script>
  AOS.init({
    duration: 1000, 
    easing: 'ease-in-out', 
    <%--once: true,--%>
	<%-- 
  	useClassNames: true,
  	animatedClassName: "aos-animate",
  });
  document.querySelectorAll(".section2-img-wrapper").forEach((element) => {
    element.addEventListener("animationend", () => {
     
      element.setAttribute("data-aos", "flip-left");  // 'flip' 애니메이션 추가
      AOS.refresh();  // AOS 상태 업데이트
    });
  });
  AOS.init({
    duration: 1000, 
    easing: 'ease-in-out', 
    useClassNames: true,
    animatedClassName: "aos-animate",
    onComplete: (animation) => {
      // 애니메이션이 완료된 후, flip 애니메이션 실행
      const element = animation.target;
      setTimeout(() => {
        element.classList.add('flip');  // flip 애니메이션 추가
      }, 300); // 300ms 딜레이 후 flip 실행
    }
  });

</script>
	 --%>
	<script src="assets/js/index.js"></script>
</body>
</html>
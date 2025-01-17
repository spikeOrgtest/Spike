<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>퀴즈 포인트샵</title>
<link rel="stylesheet" href="../css/support/subpage.css">
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/mini/shop.css">
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
				<!-- 퀴즈 풀고 얻은 포인트로 기프티콘 구매 -->
				<div class="shop">
					<h1>Point Shop</h1>
					<div class="user-info">
						<span>현재 포인트: <strong id="userPoints">1500</strong>P
						</span>
						<!-- 현재 포인트 -->
					</div>
				</div>
				<main>
					<section class="gift-cards">
						<div class="gift-card" data-name="배스킨라빈스" data-price="10000">
							<img src="../images/mini/gift1.jpg" alt="기프티콘 1">
							<div class="gift-info">
								<h3>배스킨라빈스</h3>
								<p>가격: 10,000P</p>
								<button class="buy-btn">구매</button>
							</div>
						</div>
						<div class="gift-card" data-name="공차" data-price="4000">
							<img src="../images/mini/gift2.jpg" alt="기프티콘 2">
							<div class="gift-info">
								<h3>공차</h3>
								<p>가격: 4,000P</p>
								<button class="buy-btn">구매</button>
							</div>
						</div>
						<div class="gift-card" data-name="파리바게뜨" data-price="32000">
							<img src="../images/mini/gift3.jpg" alt="기프티콘 3">
							<div class="gift-info">
								<h3>파리바게뜨</h3>
								<p>가격: 32,000P</p>
								<button class="buy-btn">구매</button>
							</div>
						</div>
						<div class="gift-card" data-name="버거킹" data-price="9900">
							<img src="../images/mini/gift4.jpg" alt="기프티콘 4">
							<div class="gift-info">
								<h3>버거킹</h3>
								<p>가격: 9,900P</p>
								<button class="buy-btn">구매</button>
							</div>
						</div>
						<div class="gift-card" data-name="도미노피자" data-price="35000">
							<img src="../images/mini/gift5.jpg" alt="기프티콘 5">
							<div class="gift-info">
								<h3>도미노피자</h3>
								<p>가격: 35,000P</p>
								<button class="buy-btn">구매</button>
							</div>
						</div>
						<div class="gift-card" data-name="bhc 치킨" data-price="25000">
							<img src="../images/mini/gift6.jpg" alt="기프티콘 6">
							<div class="gift-info">
								<h3>bhc 치킨</h3>
								<p>가격: 25,000P</p>
								<button class="buy-btn">구매</button>
							</div>
						</div>
					</section>

				</main>

				<!-- 포인트로 구매하는 모달 창 -->
				<div id="purchaseModal" class="modal">
					<div class="modal-content">
						<h2>구매 확인</h2>
						<p id="modalMessage"></p>
						<div class="modal-buttons">
							<button id="confirmPurchaseBtn">구매</button>
							<button id="cancelPurchaseBtn">취소</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script>
document.addEventListener("DOMContentLoaded", function() {
    // 구매 버튼 클릭 시 모달 창 열기
    const buyButtons = document.querySelectorAll(".buy-btn");
    const modal = document.getElementById("purchaseModal");
    const userPointsElement = document.getElementById("userPoints");
    const modalMessage = document.getElementById("modalMessage");
    const confirmPurchaseBtn = document.getElementById("confirmPurchaseBtn");
    const cancelPurchaseBtn = document.getElementById("cancelPurchaseBtn");

    let selectedGiftPrice = 0;
    let selectedGiftName = "";

    buyButtons.forEach(button => {
        button.addEventListener("click", function() {
            // data-name과 data-price 속성값을 가져옴
            const giftCard = button.closest('.gift-card'); // 버튼의 부모 .gift-card 요소
            selectedGiftName = giftCard.getAttribute("data-name");
            selectedGiftPrice = parseInt(giftCard.getAttribute("data-price"));

            // 모달 메시지 업데이트
            modalMessage.textContent = `${selectedGiftName}을 구매하시겠습니까? (가격: ${selectedGiftPrice}P)`;

            // 모달 창 표시
            modal.style.display = "flex";
        });
    });

    // 구매 확인 버튼 클릭
    confirmPurchaseBtn.addEventListener("click", function() {
        const currentPoints = parseInt(userPointsElement.textContent);
        
        if (currentPoints >= selectedGiftPrice) {
            // 포인트 차감 후 구매 처리 (여기서는 단순히 포인트 업데이트)
            userPointsElement.textContent = currentPoints - selectedGiftPrice;
            alert(`${selectedGiftName} 구매 완료!`);
        } else {
            alert("포인트가 부족합니다.");
        }

        // 모달 창 닫기
        modal.style.display = "none";
    });

    // 구매 취소 버튼 클릭
    cancelPurchaseBtn.addEventListener("click", function() {
        modal.style.display = "none";
    });
});


</script>

	<%@ include file="../include/shortfooter.jsp"%>
</body>
</html>

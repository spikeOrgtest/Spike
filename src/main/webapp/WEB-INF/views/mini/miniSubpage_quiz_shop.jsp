<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />

<title>퀴즈 포인트샵</title>
<link rel="stylesheet" href="../css/support/subpage.css">
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/mini/shop.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

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
				<h3 class="subpage-sidebar-title">Point Shop</h3>
				<ul>
					<li><a href="minisub">mini home</a></li>
					<li><a href="quiz">O/X Quiz</a></li>
					<li><a href="shop">Point Shop</a></li>
					<li><a href="point">My Point</a></li>
				</ul>
			</div>

			<main>
				<div class="subpage-content-wrap">
					<!-- 퀴즈 풀고 얻은 포인트로 기프티콘 구매 -->
					<div class="shop">
						<div class="shop-header">
							<i class="fas fa-coins coin-icon"></i>
							<!-- 동전 아이콘 -->
							<h1>Point Shop</h1>
						</div>
						<div class="user-info">
							<span>현재 포인트: <strong id="userPoints">${point}</strong>P
							</span>
						</div>
					</div>
					<section class="gift-cards">
						<c:forEach var="gift" items="${gift}">
							<div class="gift-card" data-name="${gift.giftconName}" data-price="${gift.price}">
								<img src="../images/mini/gift${gift.giftconId}.jpg">
								<div class="gift-info">
									<h3>${gift.giftconName}</h3>
									<p>가격: ${gift.price}P</p>
									<button class="buy-btn">구매</button>
								</div>
							</div>
						</c:forEach>
					</section>
				</div>
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
            modalMessage.textContent = `구매하시겠습니까?`;

            // 모달 창 표시
            modal.style.display = "flex";
        });
    });

 // 백엔드에 구매 요청을 보내는 함수
    function sendPurchaseRequest(itemName, itemPrice) {
        // CSRF 토큰 가져오기
        const csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
        const csrfToken = document.querySelector('meta[name="_csrf"]').content;

        // 요청할 데이터 구성
        const purchaseData = {
            itemName: itemName,
            itemPrice: itemPrice,
        };

        console.log("서버로 보낼 데이터:", purchaseData);

        // fetch API를 이용하여 백엔드에 POST 요청 전송
        return fetch('/spike.com/purchase', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                [csrfHeader]: csrfToken, // CSRF 보호
            },
            body: JSON.stringify(purchaseData),
        })
        .then(response => {
            console.log("응답 상태 코드:", response.status);
            return response.json();
        })
        .then(data => {
            console.log("서버 응답 데이터:", data);
            return data; // 결과 반환 (성공 여부 확인용)
        })
        .catch(error => {
            console.error("구매 요청 실패:", error);
            throw error; // 에러 발생 시 상위 코드에서 처리할 수 있도록 던짐
        });
    }

    
 // 구매 확인 버튼 클릭
    confirmPurchaseBtn.addEventListener("click", function() {
        const currentPoints = parseInt(userPointsElement.textContent);

        if (currentPoints >= selectedGiftPrice) {
            // 백엔드에 구매 요청 보내기
            sendPurchaseRequest(selectedGiftName, selectedGiftPrice)
            .then(data => {
                if (data.success) {
                    // 성공 시 포인트 차감
                    userPointsElement.textContent = currentPoints - selectedGiftPrice;
                    alert(`${selectedGiftName} 구매 완료!`);
                } else {
                    alert(data.message || "구매 실패. 다시 시도해주세요.");
                }
            })
            .catch(() => {
                alert("서버 오류가 발생했습니다.");
            });
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

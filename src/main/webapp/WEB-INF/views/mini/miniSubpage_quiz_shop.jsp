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
							<div class="gift-card" data-name="${gift.giftconName}"
								data-price="${gift.price}" data-id="${gift.giftIconId}">
								<img src="../images/mini/gift${gift.giftIconId}.jpg">
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
	    // 요소 선택
	    const buyButtons = document.querySelectorAll(".buy-btn");
	    const modal = document.getElementById("purchaseModal");
	    const userPointsElement = document.getElementById("userPoints");
	    const modalMessage = document.getElementById("modalMessage");
	    const confirmPurchaseBtn = document.getElementById("confirmPurchaseBtn");
	    const cancelPurchaseBtn = document.getElementById("cancelPurchaseBtn");

	    let selectedGiftPrice = 0;
	    let selectedGiftName = "";
	    let selectedGiftIconId = null;

	    // 모달 열기 함수
	    function openModal(name, price, id) {
	        selectedGiftName = name;
	        selectedGiftPrice = parseInt(price);
	        selectedGiftIconId = id;
	        
	        // 모달 메시지 업데이트 (기프티콘 이름을 포함한 메시지)
	    
    	modalMessage.innerHTML = `구매하시겠습니까?`;
	        
	        // 모달 창 열기
	        modal.style.display = "flex";
	        modal.style.zIndex = "9999";
	    }

	    // 모달 닫기 함수
	    function closeModal() {
	        modal.style.display = "none";
	    }

	    // 백엔드에 구매 요청을 보내는 함수
	    function sendPurchaseRequest(itemName, itemPrice, giftIconId) {
	        const csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
	        const csrfToken = document.querySelector('meta[name="_csrf"]').content;

	        const purchaseData = {
	            itemName: itemName,
	            itemPrice: itemPrice,
	            giftIconId: giftIconId,
	        };

	        return fetch('/spike.com/purchase', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json',
	                [csrfHeader]: csrfToken,
	            },
	            body: JSON.stringify(purchaseData),
	        })
	        .then(response => response.json())
	        .catch(error => {
	            console.error("구매 요청 실패:", error);
	            throw error;
	        });
	    }

	    // 구매 요청 처리 함수
	    function handlePurchase() {
	        const currentPoints = parseInt(userPointsElement.textContent);

	        if (currentPoints >= selectedGiftPrice) {
	            sendPurchaseRequest(selectedGiftName, selectedGiftPrice, selectedGiftIconId)
	            .then(data => {
	                if (data.success) {
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

	        closeModal();
	    }

	    // 구매 버튼 클릭 이벤트 추가
	    buyButtons.forEach(button => {
	        button.addEventListener("click", function() {
	            const giftCard = button.closest('.gift-card');
	            openModal(
	                giftCard.getAttribute("data-name"),
	                giftCard.getAttribute("data-price"),
	                giftCard.getAttribute("data-id")
	            );
	        });
	    });

	    // 구매 확인 버튼 클릭
	    confirmPurchaseBtn.addEventListener("click", handlePurchase);

	    // 구매 취소 버튼 클릭
	    cancelPurchaseBtn.addEventListener("click", closeModal);
	});

</script>

	<%@ include file="../include/shortfooter.jsp"%>
</body>
</html>

    // 알림 설정 변경 시 효과
    const emailNotificationsCheckbox = document.getElementById('emailNotifications');
    const notificationStatus = document.getElementById('notificationStatus');

    emailNotificationsCheckbox.addEventListener('change', function() {
        if (this.checked) {
            notificationStatus.textContent = '알림을 받기로 선택하셨습니다.';
            notificationStatus.classList.remove('text-muted');
            notificationStatus.classList.add('text-success');
        } else {
            notificationStatus.textContent = '알림을 받지 않기로 선택하셨습니다.';
            notificationStatus.classList.remove('text-success');
            notificationStatus.classList.add('text-muted');
        }
    });

    // 프로필 수정 폼 제출 시
    document.getElementById('editProfileForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const userName = document.getElementById('userName').value;
        const userEmail = document.getElementById('userEmail').value;
        const userPassword = document.getElementById('userPassword').value;
        
        // 여기서 서버로 데이터를 보내거나 로컬에서 상태를 업데이트할 수 있습니다.
        alert('프로필이 성공적으로 업데이트되었습니다!');
        // 모달을 닫습니다.
        const modal = bootstrap.Modal.getInstance(document.getElementById('editProfileModal'));
        modal.hide();
    });

    function logout() {
      // 로그아웃 처리 로직 (예: 세션 삭제, 로그인 페이지로 리다이렉트)
      alert("로그아웃되었습니다.");
      // 실제로는 로그인 페이지나 홈 페이지로 리다이렉트 할 수 있습니다.
      window.location.href = "login.html";
  }

  document.addEventListener('DOMContentLoaded', function() {

    const topBar = document.querySelector('.top-bar');
     const mainHeader = document.querySelector('.main-header');
     let lastScrollY = window.scrollY;
 
     window.addEventListener('scroll', function() {
         if (window.scrollY > lastScrollY) {
             topBar.style.transform = 'translateY(-100%)';
         } else {
             topBar.style.transform = 'translateY(0)';
         }
         lastScrollY = window.scrollY;
     });
    
     // Carousel
     const carouselItems = [
         { title: "SPIKE 대출 상품", description: "대출이 필요할 때 SPIKE와 함께 하세요." },
         { title: "특별 적금 상품", description: "더 높은 금리로 더 빠르게 목표 달성!" },
         { title: "특별 카드 상품", description: "특별한 당신을 위한 카드!" },
     ];
     let currentItem = 0;
     const carouselTitle = document.getElementById('carouselTitle');
     const carouselDescription = document.getElementById('carouselDescription');
    const prevBtn = document.querySelector('.carousel-controls .prev');
     const nextBtn = document.querySelector('.carousel-controls .next');
    
     function updateCarousel() {
         carouselTitle.textContent = carouselItems[currentItem].title;
         carouselDescription.textContent = carouselItems[currentItem].description;
     }
 
     setInterval(() => {
         currentItem = (currentItem + 1) % carouselItems.length;
         updateCarousel();
     }, 3000);
     
     function nextItem() {
         currentItem = (currentItem + 1) % carouselItems.length;
         updateCarousel();
     }
 
     function prevItem() {
         currentItem = (currentItem - 1 + carouselItems.length) % carouselItems.length;
         updateCarousel();
     }
     
     // 버튼 클릭 시 동작하도록 이벤트 리스너 추가
    nextBtn.addEventListener('click', nextItem);
    prevBtn.addEventListener('click', prevItem);
 
    // 초기 콘텐츠 업데이트
    updateCarousel();
 
     // Products
     const products = {
         regular: [
             { name: "SPIKE 적금", description: "매월 꾸준히 모으는 습관, 스파이크 적금으로 시작해보세요.", features: ["최대 연 5% 금리!", "자유로운 입출금 가능", "만기 자동 연장"], link: "./sub/spike-savings.html" },
             { name: "청년 저축 적금", description: "목표 달성을 위한 최고의 선택, 드림 적금과 함께하세요.", features: ["목표 금액 설정 가능", "목표 달성 시 특별 금리 혜택", "자동 이체 기능 지원"] },
             { name: "1+1 적금", description: "더욱 풍성하게, 플러스 적금으로 미래를 준비하세요.", features: ["매월 추가 금리 적립", "우대 금리 적용", "만기 시 특별 경품 제공"] },
         ],
         monthly: [
             { name: "월간 특별 적금", description: "이달 한정 특별 금리 혜택!", features: ["한정 기간 고금리", "유연한 입금 조건", "온라인 전용 상품"] },
             { name: "여름 휴가 대출", description: "시원한 여름을 위한 특별 대출", features: ["낮은 금리", "빠른 심사", "유연한 상환 조건"] },
             { name: "주택청약종합저축", description: "내 집 마련의 첫 걸음", features: ["청약 가점 혜택", "비과세 혜택", "우대금리 적용"] },
         ],
     };
     
        
 
     function createProductElement(product) {
         const productElement = document.createElement('div');
         productElement.className = 'product-item';
         productElement.innerHTML = `
             <div class="product-content">
                 <h3>${product.name}</h3>
                 <p>${product.description}</p>
                 <ul class="feature-list">
                     ${product.features.map(feature => `<li>${feature}</li>`).join('')}
                 </ul>
             </div>
         `;
         // 만약 링크가 있으면 클릭 시 이동할 수 있도록 이벤트 추가
         if (product.link) {
             productElement.addEventListener('click', function() {
                 window.location.href = product.link; // 해당 링크로 이동
             });
         }
         return productElement;
     }
 
     const regularProductsContainer = document.getElementById('regularProducts');
     const monthlyProductsContainer = document.getElementById('monthlyProducts');
 
     products.regular.forEach(product => {
         regularProductsContainer.appendChild(createProductElement(product));
     });
 
     products.monthly.forEach(product => {
         monthlyProductsContainer.appendChild(createProductElement(product));
     });   
     
 });
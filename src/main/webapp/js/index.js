

let currentImg = null; // 현재 중심으로 이동한 이미지를 추적하는 변수
let previousZIndex = {}; // 이미지들의 이전 z-index 값을 추적

document.querySelectorAll(".triangle-item").forEach((img) => {
  let isCentered = false; // 플래그 변수

  img.addEventListener("click", (event) => {
    // 1. 삼각형 컨테이너의 중심 좌표 계산
    const container = document.querySelector(".triangle-container");
    const containerRect = container.getBoundingClientRect();
    const centerX = containerRect.left + containerRect.width / 2;
    const centerY = containerRect.top + containerRect.height / 2;

    // 2. 클릭된 이미지의 중심 좌표 계산
    const imgRect = event.target.getBoundingClientRect();
    const imgCenterX = imgRect.left + imgRect.width / 2;
    const imgCenterY = imgRect.top + imgRect.height / 2;

    // 3. 이동 거리 계산
    const offsetX = centerX - imgCenterX;
    const offsetY = centerY - imgCenterY;

    if (currentImg && currentImg !== img) {
      // 다른 이미지가 클릭된 경우 이전 이미지를 원래 자리로 복귀시킴
      currentImg.style.transform = "translate(0, 0) scale(1)";
      currentImg.style.zIndex = previousZIndex[currentImg] || 1; // z-index 복원

      currentImg.style.transition = "all 0.5s ease-in-out";
      currentImg.isCentered = false; // 이전 이미지 상태 초기화
    }

    // 4. 새로 클릭된 이미지 이동 처리
    if (!isCentered) {
      // 중심으로 이동
      event.target.style.position = "absolute";
      event.target.style.transition = "all 0.5s ease-in-out";
      event.target.style.transform = `translate(${offsetX}px, ${offsetY}px) scale(1.8)`;
      event.target.style.zIndex = 100; // 클릭된 이미지를 맨 위로 이동
      event.target.isCentered = true; // 새 이미지 상태 설정
      currentImg = event.target; // 현재 클릭된 이미지를 추적
    } else {
      // 원래 자리로 복귀
      event.target.style.transform = "translate(0, 0) scale(5)";
      event.target.style.zIndex = previousZIndex[event.target] || 1; // 복귀 시 원래 z-index로 설정

      event.target.isCentered = false; // 상태 업데이트
      currentImg = null; // 복귀 후 현재 이미지 추적 초기화
    }
  });
});

function positionImages() {
  const container = document.querySelector(".triangle-container");
  const img1 = document.getElementById("trimage1");
  const img2 = document.getElementById("trimage2");
  const img3 = document.getElementById("trimage3");

  const containerWidth = container.offsetWidth; // 컨테이너 너비 (1080px)
  const containerHeight = container.offsetHeight; // 컨테이너 높이 (90vh - 250px)
  const imgSize = 150; // 이미지 크기 (이미지의 width, height)
  const padding = 100; // 이미지 여백
  const maxWrapperHeight = 500; // wrapper 임계점
  const maxTriangleHeight = maxWrapperHeight - padding * 2;
  const triangleHeight = Math.min(
    containerHeight - padding * 2,
    maxTriangleHeight
  );
  const centerX = containerWidth / 2; // 컨테이너 중심 X 좌표
  const centerY = containerHeight / 2; // 컨테이너 중심 Y 좌표

  // 삼각형 꼭짓점 좌표 계산
  const topPoint = {
    x: centerX,
    y: centerY - triangleHeight / 2 - imgSize / 2,
  };
  const leftPoint = {
    x: centerX - 0.58 * triangleHeight - imgSize / 2,
    y: centerY + triangleHeight / 2 - imgSize / 2,
  };
  const rightPoint = {
    x: centerX + 0.58 * triangleHeight - imgSize / 2,
    y: centerY + triangleHeight / 2 - imgSize / 2,
  };

  // 각 이미지를 계산된 좌표로 이동
  img1.style.left = `${topPoint.x - 0.5 * imgSize}px`;
  img1.style.top = `${topPoint.y}px`;

  img2.style.left = `${leftPoint.x}px`;
  img2.style.top = `${leftPoint.y}px`;

  img3.style.left = `${rightPoint.x}px`;
  img3.style.top = `${rightPoint.y}px`;
}

// 이미지 클릭 시 설명 업데이트
function setupImageClickEvents() {
  const descriptions = [
    {
      title: "금 투자",
      text: "금은 경제가 불안정할 때 가치가 상승하는 안전 자산으로, 포트폴리오 다변화와 리스크 관리에 유리한 투자 방법입니다.",
    },
    {
      title: "주식 투자",
      text: "주식 투자는 기업의 성장을 공유하는 투자 방식으로, 장기적인 관점에서 높은 수익을 기대할 수 있습니다.",
    },
    {
      title: "가상화폐 투자",
      text: "가상화폐는 블록체인 기술을 기반으로 한 디지털 자산으로, 높은 변동성과 잠재적인 수익률을 특징으로 합니다.",
    },
  ];

  const descriptionBox = document.querySelector(".description-box h3");
  const descriptionText = document.querySelector(".description-box p");

  document.getElementById("trimage1").addEventListener("click", () => {
    updateDescription(descriptions[0]);
  });
  document.getElementById("trimage2").addEventListener("click", () => {
    updateDescription(descriptions[1]);
  });
  document.getElementById("trimage3").addEventListener("click", () => {
    updateDescription(descriptions[2]);
  });

  function updateDescription({ title, text }) {
    descriptionBox.textContent = title;
    descriptionText.textContent = text;
  }
}

// 초기화 및 창 크기 변경 시 재계산
window.addEventListener("load", () => {
  positionImages();
  setupImageClickEvents();
});
window.addEventListener("resize", positionImages);


//스와이퍼
document.addEventListener("DOMContentLoaded", () => {
  const slides = document.querySelectorAll(".idx-slide");
  const prevBtn = document.querySelector(".prev-btn");
  const nextBtn = document.querySelector(".next-btn");

  let currentSlide = 1;

  function updateSlides() {
    slides.forEach((slide, index) => {
      if (index === currentSlide) {
        slide.classList.add("active");
      } else {
        slide.classList.remove("active");
      }
    });
  }

  nextBtn.addEventListener("click", () => {
    currentSlide = (currentSlide + 1) % slides.length; // 다음 슬라이드로 이동 (순환)
    updateSlides();
  });

  prevBtn.addEventListener("click", () => {
    currentSlide = (currentSlide - 1 + slides.length) % slides.length; // 이전 슬라이드로 이동 (순환)
    updateSlides();
  });

  // 초기 슬라이드 설정
  updateSlides();
});



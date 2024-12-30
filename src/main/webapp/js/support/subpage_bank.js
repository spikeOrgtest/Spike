/**
 * subpage_bank.js
 */
 
 
 //고객후기
let currentSlide = 0;
const slides = document.querySelectorAll('.testimonial-slide');
const totalSlides = slides.length;
const slider = document.querySelector('.testimonial-slider');

// 슬라이드를 자동으로 전환하는 함수
function moveSlide() {
    currentSlide++;
    if (currentSlide >= totalSlides) {
        currentSlide = 0; // 마지막 슬라이드에서 첫 번째 슬라이드로 돌아감
    }
    slider.style.transform = `translateX(-${currentSlide * 20}%)`; // 슬라이드를 왼쪽으로 이동
}

// 5초마다 자동으로 슬라이드 넘어가기
setInterval(moveSlide, 5000);
 
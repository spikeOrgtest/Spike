/**
   * Frequently Asked Questions Toggle
   */
 // FAQ 슬라이드 애니메이션
document.querySelectorAll('.faq-question').forEach((question) => {
    question.addEventListener('click', () => {
        const faqItem = question.parentElement;
        const answer = faqItem.querySelector('.faq-answer');

        // 토글 애니메이션
        faqItem.classList.toggle('active');

        // 다른 FAQ 아이템 닫기
        document.querySelectorAll('.faq-item').forEach((item) => {
            if (item !== faqItem) {
                item.classList.remove('active');
                item.querySelector('.faq-answer').style.maxHeight = null;
            }
        });

        // 슬라이드 토글
        if (faqItem.classList.contains('active')) {
            answer.style.maxHeight = `${answer.scrollHeight}px`;
        } else {
            answer.style.maxHeight = null;
        }
    });
});
 
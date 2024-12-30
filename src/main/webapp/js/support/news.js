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
});

/**
 * subpage.js
 */
 
 
 //선택된 메뉴 배경색 변경
 document.addEventListener("DOMContentLoaded", function () {
    // 네비게이션 바에서 선택된 메뉴 설정
    const navLinks = document.querySelectorAll(".subpage-navigation-bar a");
    const currentPath = window.location.pathname; // 현재 경로

    navLinks.forEach(link => {
        if (link.href.includes(currentPath)) {
            link.classList.add("subpage-selected");
        }
    });

    // 사이드바에서 선택된 메뉴 설정
    const sidebarLinks = document.querySelectorAll(".subpage-sidebar ul li a");

    sidebarLinks.forEach(link => {
        if (link.href.includes(currentPath)) {
            link.classList.add("subpage-selected");
        }
    });
});
 
 
 /* Ajax 사용시 이걸로 사용
 
 document.addEventListener("DOMContentLoaded", function () {
    // 네비게이션 바에서 선택된 메뉴 설정
    const navLinks = document.querySelectorAll(".subpage-navigation-bar a");
    const sidebarLinks = document.querySelectorAll(".subpage-sidebar ul li a");
    const currentPath = window.location.pathname; // 현재 경로

    function updateSelectedClass(links) {
        // 모든 링크에서 subpage-selected 클래스 제거
        links.forEach(link => link.classList.remove("subpage-selected"));

        // 현재 경로에 해당하는 링크에 subpage-selected 클래스 추가
        links.forEach(link => {
            if (link.href.includes(currentPath)) {
                link.classList.add("subpage-selected");
            }
        });
    }

    // 네비게이션 바와 사이드바 각각 처리
    updateSelectedClass(navLinks);
    updateSelectedClass(sidebarLinks);
});
 
 
 */


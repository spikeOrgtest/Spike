<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SPIKE 이벤트</title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">
<link rel="stylesheet" href="assets/css/eventDetail.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="subpage">
    <jsp:include page="../include/header.jsp" />
    <jsp:include page="../include/subnav.jsp" />

    <div class="subpageWrapper">
        <div class="subpage-breadcrumbs">
            <a href="#">소식</a> <span> > </span> <a href="#">은행소식</a>
        </div>
    </div>

    <div class="subpageWrapper">
        <!-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) -->
        <div class="subpage-main-container">
            <!-- 사이드바 -->
            <div class="subpage-sidebar">
                <h3 class="subpage-sidebar-title">SPIKE 소식</h3>
                <ul>
                    <li><a href="newsSubpage_bank.jsp">은행소식</a></li>
                    <li><a href="newsSubpage_product.jsp">새 상품소식</a></li>
                    <li><a href="newsSubpage_job.jsp">채용공고</a></li>
                    <li><a href="newsSubpage_notice.jsp">공지사항</a></li>
                </ul>
            </div>

            <!-- 컨텐츠 랩 -->
            <div class="event-wrap">
                <h2>SPIKE 이벤트</h2>
                <div class="event-section">
                    <!-- 이미지 컨테이너 -->
                    <div class="event-image-container">
                        <img src="./assets/img/subpage/event_Detail.jpg" alt="이벤트 공지 이미지" class="event-image">
                        <button class="btn-close" onclick="closeEvent()">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../include/shortfooter.jsp" />
    <script src="./assets/js/subpage.js"></script>
    <script src="./assets/js/subpage_bank.js"></script>
    <script>
        // 이벤트 이미지를 닫고 페이지로 이동하는 함수
        function closeEvent() {
            window.location.href = "newsSubpage_bank.jsp"; // 이동할 페이지의 경로
        }
    </script>
</body>
</html>

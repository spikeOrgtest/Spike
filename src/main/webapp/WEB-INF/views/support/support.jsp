<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta name="description" content="">
<meta name="keywords" content="">
<title>번개같이 빠른 송금, 스파이크!</title>

<link href="assets/css/customer.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- Main CSS File -->
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/include.css" rel="stylesheet">



</head>

<body>
	<jsp:include page="../include/header.jsp" />



		<div id="wrap">

			<section class="subMainTop">
				<div class="customSrchBox">
					<div class="tit">
						<em>스파이크,</em> "무엇이든 물어보세요."
					</div>
					<!-- 검색창을 감싸는 div 추가 -->
					<div class="search-bar-wrapper">
						<form action="search.jsp" method="GET" class="search-bar">
							<input type="text" name="query" placeholder="검색어를 입력하세요" required>
							<button type="submit">검색</button>
						</form>
					</div>
					<div class="keyword" id="srchKeyword">
						<span class="tit"> "HOT" <span class="blind">키워드</span> <span
							aria-hidden="true">|</span>
						</span> <a href="#" class="links" id="keyword" data-keyword="조회">조회</a> <a
							href="#" class="links" id="keyword" data-keyword="발급">발급</a> <a
							href="#" class="links" id="keyword" data-keyword="송금">송금</a> <a
							href="#" class="links" id="keyword" data-keyword="내역">내역</a>
					</div>
				</div>

			</section>
		</div>
		
		<section class="subMenuLink1">
			<ul class="subMenuLink">
				<li><a href="supportSubpage_.jsp" id="sublink"> <span
						class="icoImg"><img
							src="assets/img/customer/submenu_custom_ico_1.png" alt=""></span>
						<span class="tit">ARS안내</span>
				</a></li>
				<li><a href="supportSubpage_.jsp" id="sublink"> <span
						class="icoImg"><img
							src="assets/img/customer/submenu_custom_ico_21.png" alt=""></span>
						<span class="tit">문자상담</span>
				</a></li>
				<li><a href="supportSubpage_.jsp" id="sublink"> <span
						class="icoImg"><img
							src="assets/img/customer/submenu_custom_ico_3.png" alt=""></span>
						<span class="tit">수어상담</span>
				</a></li>
				<li><a href="supportSubpage_.jsp" id="sublink"> <span
						class="icoImg"><img
							src="assets/img/customer/submenu_custom_ico_4.png?v=1" alt=""></span>
						<span class="tit">스파이크 챗봇</span>
				</a></li>
				<li id="CustomVoice"><a href="supportSubpage_.jsp" id="sublink">
						<span class="icoImg"><img
							src="assets/img/customer/submenu_custom_ico_5.png" alt=""></span>
						<span class="tit">고객의 소리</span>
				</a></li>
			</ul>
		</section>
		
		<!-- 소식 칸 -->
		
	<section class="news-summary">
    <h3>SPIKE 소식 및 서비스</h3>
    <div class="news-container">
        <div class="news-item">
            <i class="fas fa-gift"></i>
            <h4>새상품 소식</h4>
            <p>새로운 금융 상품과 서비스를 소개합니다. 최신 상품을 확인해 보세요.</p>
        </div>
        <div class="news-item">
            <i class="fas fa-briefcase"></i>
            <h4>채용공고</h4>
            <p>SPIKE에서 일할 인재를 모집합니다. 다양한 직무와 기회를 확인하세요.</p>
        </div>
        <div class="news-item">
            <i class="fas fa-bullhorn"></i>
            <h4>공지사항</h4>
            <p>중요한 공지사항을 확인하고 최신 정보를 놓치지 마세요.</p>
        </div>
        <div class="news-item">
            <i class="fas fa-calendar-check"></i>
            <h4>이벤트</h4>
            <p>특별한 이벤트에 참여하여 다양한 혜택을 누려보세요.</p>
        </div>
        <div class="news-item">
            <i class="fas fa-newspaper"></i>
            <h4>관련 뉴스</h4>
            <p>SPIKE와 관련된 최신 뉴스 및 언론 보도를 확인하세요.</p>
        </div>
    </div>
</section>






<!-- 자주하는 질문 -->
	<section id="faq-2" class="faq-2 section light-background">
    <div class="container section-title">
        <h2>자주하는 질문</h2>
        <p>질문을 검색하기 전에 '자주하는 질문'을 먼저 확인해 보시면 빠른 답변 확인이 가능합니다.</p>
    </div>
    <div class="faq-container">
        <div class="faq-item">
            <div class="faq-question">
                <h3>어떤 상품/상품 서비스가 있나요?</h3>
                <span class="faq-toggle-icon">+</span>
            </div>
            <div class="faq-answer">
                <p>저희 은행에서는 입출금 계좌, 예·적금 등 다양한 금융상품과 주식·펀드 같은 투자 서비스를 제공합니다.</p>
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">
                <h3>회원 정보는 어떻게 수정하나요?</h3>
                <span class="faq-toggle-icon">+</span>
            </div>
            <div class="faq-answer">
                <p>회원 정보 수정은 '마이페이지'에서 가능합니다. 개인정보 보호를 위해 본인 인증이 필요할 수 있습니다.</p>
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">
                <h3>보이스피싱 서비스는 어떻게 이용하나요?</h3>
                <span class="faq-toggle-icon">+</span>
            </div>
            <div class="faq-answer">
                <p>보이스피싱 예방 서비스로 의심 계좌를 조회할 수 있습니다. '안심! 스파이크' 메뉴를 통해 확인 가능합니다.</p>
            </div>
        </div>
    </div>
</section>



		<jsp:include page="../include/footer.jsp" />
		<script src="assets/js/customer.js"></script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Spike News</title>
<link rel="stylesheet" href="assets/css/news.css">
<link rel="stylesheet" href="assets/css/include.css">
<link href="assets/img/spike.png" rel="icon">

<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">


<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<title>Spike News</title>
<%-- 부트스트랩 슬라이드 연결 --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

</head>
<body>

	<jsp:include page="include/header.jsp" />
<%-- 부트스트랩 슬라이드 연결 --%>
<div id="carouselExampleAutoplaying1" class="carousel slide" data-bs-ride="carousel" >

  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="assets/img/news/fighting.jpeg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="assets/img/news/raise.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="assets/img/news/mains.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying1" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying1" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
  <style>
<%-- carousel-control-prev 아이콘의 색상 변경 --%>
  .carousel-control-prev-icon {
    filter: invert(1) sepia(1) saturate(4) hue-rotate(-50deg); /* 색상 필터를 사용하여 아이콘 색상 변경 */
  }
  .carousel-control-next-icon {
    filter: invert(1) sepia(1) saturate(4) hue-rotate(-50deg); /* 색상 필터를 사용하여 아이콘 색상 변경 */
  }

</style>

<%-- 부트스트랩 슬라이드 --%>



  <div class="slide-text">
    <p>고객님과의 신뢰가</p>
    <p>우리 Spike를 성장시킵니다</p>
  </div>
</div>

<main>

<%-- 카드 슬라이드 --%>
<div class="content-container">
<div id="carouselExampleAutoplaying2" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000"> <!-- style="max-width: 20rem ;"-->
  <div class="carousel-inner">
    <%-- 첫 번째 슬라이드 --%>
    <div class="carousel-item active">
      <div class="card" >
        <img src="assets/img/news/newcard1.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">새 상품 소식</h5>
          <p class="card-text">우리 Spike 만의 새로운 금융 상품의 혁신을 일으킬 새 상품 소식을 곧 전해드리겠습니다.</p>
          <a href="#" class="btn btn-primary">바로가기</a>
        </div>
      </div>
    </div>
    
    <%-- 두 번째 --%>
    <div class="carousel-item">
      <div class="card" >
        <img src="assets/img/news/newcard2.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">채용공고</h5>
          <p class="card-text">고객님들의 일자리 서비스. 소통할수있는 정식 채용 공고모집을 위해 카카오톡1차면접 12월 15일부터 시작됩니다.</p>
          <a href="#" class="btn btn-primary">바로가기</a>
        </div>
      </div>
    </div>

    <%-- 세 번째 --%>
    <div class="carousel-item">
      <div class="card" >
        <img src="assets/img/news/newcard3.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">은행소식</h5>
          <p class="card-text">새 금융 회사 Spike는 속도의 차별화를 두기위해 노력하는 회사로 거듭나겠습니다.</p>
          <a href="#" class="btn btn-primary">바로가기</a>
        </div>
      </div>
    </div>
  </div>

 <%-- 이전, 다음 버튼 --%>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying2" data-bs-slide="prev" > 
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying2" data-bs-slide="next" > 
    <span class="visually-hidden">Next</span>
  </button>
</div>
  <%-- 소식 박스 추가 --%>
  <div class="news-container">
<div class="news-box">
  <a href="newsSubpage_bank.jsp" class="news-link">
  <span class="news-text">뉴스</span>
  <img src="./assets/img/news/koreabank.png" alt="뉴스 이미지" class="news-image"></a>
    <ul id="news-content">
      <li><a href="#">종합금융플랫폼 Spike가 새롭게 입점하였습니다. 강남,서초 두 곳의 본사로 시작하여 발전된 모습으로 고객님들과 더 가까운 서비스로...</a></li>
      <li><a href="#">금융시대의 발을맞춰 환율부터 금시세 안내.</a></li>
      <li><a href="#">매주 수요일 am:00시 ~ am:00시30분 점검서비스 안내.</a></li>
    </ul>
</div>

  <%-- 환율 박스 추가  --%>
<div class="news-box2">
  <a href="newsSubpage_bank.jsp" class="news-exchange">
  <span class="news-text">환율</span>
  <img src="./assets/img/news/koreabank2.png" alt="환율 이미지" class="exchange-image"></a>
    <ul id="news-content2">
      <li><a href="#">일찍 빼든 트럼프의 對중국 관세카드, 美中환율전쟁 유발? </a></li>
      <li><a href="#">각 나라별 환율조회 서비스 안내.</a></li>
      <li><a href="#">시장 진정시킨 韓美 통화당국...전문가들 "오늘 환율 1390원대 횡보"</a></li>
    </ul>
  </div>  
  </div>

</div>
</main>

	<jsp:include page="include/footer.jsp" />

	<script src="assets/js/news.js"></script>


</body>
</html>
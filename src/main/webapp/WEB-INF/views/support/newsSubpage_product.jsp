<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="assets/css/subpage.css">
<link rel="stylesheet" href="assets/css/include.css">

<link rel="stylesheet" href="assets/css/newsSubpage_product.css">

</head>
<body class="subpage">
	<%@ include file="include/header.jsp"%>

	<jsp:include page="include/subnav.jsp"/>

	<div class="subpageWrapper">
		<%-- 브레드크럼, 경로 표시 필요 없는 페이지면 지워도 됨 --%>
		<div class="subpage-breadcrumbs">
			<a href="#">KB고객우대제도</a> <span> > </span> <a href="#">KB스타클럽</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container">

			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">SPIKE 소식</h3>
				<ul>
					<li><a href="newsSubpage_bank.jsp">은행소식</a></li>
					<li><a href="newsSubpage_product.jsp">새 상품소식</a></li>
					<li><a href="newsSubpage_job.jsp">채용공고</a></li>  <%-- 현재페이지=선택된 메뉴면 배경색 진하게, 백엔드랑 연동할예정 --%>
					<li><a href="newsSubpage_notice.jsp">공지사항</a></li>
				</ul>
			</div>

			<%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
			<div class="subpage-content-wrap">
				<h2>새로운 금융 상품 소식</h2>
				<p>최신 금융 상품과 서비스를 소개합니다. 스파이크와 함께 더 많은 혜택을 누려보세요!</p>

				<div class="product-section">
					<!-- 상품 1 -->
					<div class="product-item">
						<img src="assets/img/subpage/product1.jpg" alt="상품 1 이미지"
							class="product-image">
						<div class="product-info">
							<h3>스파이크 적금</h3>
							<p>고객 맞춤형 금리 혜택을 제공하는 신규 적금 상품.</p>
							<p>
								<strong>기간:</strong> 2024년 1월 ~ 12월
							</p>
							<a href="#" class="product-link">자세히 보기</a>
						</div>
					</div>

					<!-- 상품 2 -->
					<div class="product-item">
						<img src="assets/img/subpage/product2.jpg" alt="상품 2 이미지"
							class="product-image">
						<div class="product-info">
							<h3>spike mini 청소년 체크카드</h3>
							<p>어린이 및 청소년 고객을 위한 특별 혜택 카드.</p>
							<p>
								<strong>혜택:</strong> 교통비 할인, 문화 생활 지원
							</p>
							<a href="#" class="product-link">자세히 보기</a>
						</div>
					</div>

					<!-- 상품 3 -->
					<div class="product-item">
						<img src="assets/img/subpage/product3.jpg" alt="상품 3 이미지"
							class="product-image">
						<div class="product-info">
							<h3>스파이크 글로벌 통장</h3>
							<p>해외 송금 수수료 할인 및 다양한 외환 혜택 제공.</p>
							<p>
								<strong>혜택:</strong> 환율 우대 최대 80%
							</p>
							<a href="#" class="product-link">자세히 보기</a>
						</div>
					</div>
					<!-- 상품 4 -->
					<div class="product-item">
						<img src="assets/img/subpage/product4.jpg" alt="상품 4 이미지"
							class="product-image">
						<div class="product-info">
							<h3>스파이크 스마트 대출</h3>
							<p>간편 신청과 빠른 승인으로 고객의 금융 생활을 지원하는 대출 상품.</p>
							<p>
								<strong>혜택:</strong> 모바일 신청 시 금리 우대 최대 0.5%
							</p>
							<a href="#" class="product-link">자세히 보기</a>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>




	<%@ include file="include/shortfooter.jsp"%>
	<script src="assets/js/subpage.js"></script>
</body>
</html>

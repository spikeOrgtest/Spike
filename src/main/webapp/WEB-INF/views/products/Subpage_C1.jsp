<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="../../../css/support/subpage.css">
<link rel="stylesheet" href="../../../css/include/include.css">
<link rel="stylesheet" href="../../../css/product/spike-savings.css">

<%--/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 --%>
 <%--
<linke rel="stylesheet" href="assets/css/내가만든css.css">

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  --%>
</head>
<body class="subpage">
	<%@ include file="../include/header.jsp"%>

	<div class="subpageWrapper">
		<%-- 브레드크럼, 경로 표시 필요 없는 페이지면 지워도 됨 --%>
		<div class="subpage-breadcrumbs">
			<a href="#">카드 상품</a> <span> > </span> <a href="#">SPIKE 청년카드</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container" >
		<%--////////////////////////////////////////////////////////// 경계 확인용, 스타일 지우고 사용 -> style="border: 1px solid gray; width:1200px; height: 1000px;"////////////////////////////////////////////--%>

			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">카드 상품</h3>
				<ul>
					<li><a href="subpage_c1">SPIKE 청년카드</a></li>
					<li><a href="subpage_c2">SPIKE 플래티넘 카드</a></li>
					<li><a href="subpage_c3">SPIKE 디지털 카드</a></li>
					<li><a href="subpage_c4">SPIKE 카드</a></li>  
					<li><a href="subpage_c5">SPIKE TRAVEL 카드</a></li>
					<li><a href="subpage_c6">플러스 카드</a></li>
				</ul>
			</div>

			<%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
			<main>
        <section class="hero">
            <div class="container">
                <h1>SPIKE 청년카드</h1>
                <p>사회 초년생을 위한 특별한 카드, 학업 및 직장 생활을 지원하는 혜택 제공!</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li>가입대상: 만 19세 ~ 29세 청년</li>
  <li>연회비: 20,000원</li>
  <li>카드종류: 신용카드</li>
  <li>주요 혜택: 학업, 첫 직장 생활 관련 특별 혜택</li>
  <li>기타 혜택: 초저금리 신용카드 한도 지원, 생활 할인 및 적립</li>
                    </ul>
                </div>
                <div class="container">
            <img src="../../../images/product/YOUTHCARD.png" width="50%" height="100%"/>
            </div> 
                </div>
                </section>
                <section class="interest-rates-section">
                <div class="container">
                <div class="interest-rates">
                    <h2>혜택 정보</h2>
<table>
  <tr>
    <th>항목</th>
    <th>혜택 내용</th>
  </tr>
  <tr>
    <td>학업 관련 혜택</td>
    <td>학원비, 교재비 등 최대 10% 할인</td>
  </tr>
  <tr>
    <td>첫 직장 관련 혜택</td>
    <td>직장 관련 용품 최대 5% 할인</td>
  </tr>
  <tr>
    <td>생활 할인</td>
    <td>음식점, 카페, 편의점 등 5% ~ 10% 할인</td>
  </tr>
  <tr>
    <td>적립 혜택</td>
    <td>결제 시 1% 적립, 각종 제휴업체에서 3% 적립</td>
  </tr>
</table>
                </div>
            </div>
        </section>

        <section class="how-to-join">
            <div class="container">
                <h2>가입 방법</h2>
                <ol>
                    <li>SPIKE 앱 다운로드</li>
  <li>회원가입 및 본인 인증</li>
  <li>'카드' 메뉴에서 '청년 카드' 선택</li>
  <li>신청서 작성 및 카드 발급 요청</li>
  <li>카드 발급 완료 후 사용 시작</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                    <li>카드 사용 시 일부 할인 혜택은 제휴처에 따라 달라질 수 있습니다.</li>
  <li>연회비는 매년 자동 갱신됩니다.</li>
  <li>카드 연체 시 연체금리가 부과됩니다.</li>
                </ul>
            </div>
        </section>

        <section class="cta">
            <div class="container">
                <a href="../newcard" class="button" id="joinButton">지금 가입하기</a>
            </div>
        </section>
    </main>
			
		</div>
	</div>
	
	
	
	
	<%@ include file="../include/shortfooter.jsp"%>
	<script src="../../../js/spike-savings.js"></script>
</body>
</html>

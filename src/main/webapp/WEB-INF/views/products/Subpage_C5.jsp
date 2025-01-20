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
			<a href="#">카드 상품</a> <span> > </span> <a href="#">SPIKE AIR 카드</a>
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
                <h1>SPIKE TRAVEL 카드</h1>
                <p>여행 혜택이 풍성한 카드, 항공권 할인 및 여행자 보험 제공!</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li>가입대상: 개인 (만 20세 이상)</li>
  <li>연회비: 30,000원</li>
  <li>카드종류: 신용카드</li>
  <li>주요 혜택: 항공권 할인, 호텔 예약 혜택</li>
  <li>기타 혜택: 해외 여행자 보험 제공</li>
                    </ul>
                </div>
                <div class="container">
            <img src="../../../images/product/TRAVELCARD.png" width="50%" height="100%"/>
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
    <td>항공권 할인</td>
    <td>항공사 제휴 시 최대 15% 할인</td>
  </tr>
  <tr>
    <td>호텔 예약 할인</td>
    <td>주요 호텔 예약 시 최대 15% 할인</td>
  </tr>
  <tr>
    <td>여행자 보험</td>
    <td>해외 여행 시 무료 여행자 보험 제공</td>
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
  <li>'카드' 메뉴에서 'AIR 카드' 선택</li>
  <li>신청서 작성 및 카드 발급 요청</li>
  <li>카드 발급 완료 후 사용 시작</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                    <li>해외 여행자 보험은 카드 사용 시 자동 제공됩니다.</li>
  <li>항공권 할인은 제휴 항공사에 한정됩니다.</li>
  <li>연회비는 카드 발급 시 결제되며, 매년 자동 갱신됩니다.</li>
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

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
			<a href="#">카드 상품</a> <span> > </span> <a href="#">SPIKE 카드</a>
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
                <h1>SPIKE 카드</h1>
                <p>기본 적립 1%와 제휴 혜택이 포함된 카드! 해외 이용 수수료는 제로!</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li>가입대상: 개인 (만 18세 이상)</li>
  <li>연회비: 10,000원</li>
  <li>카드종류: 신용카드</li>
  <li>주요 혜택: 기본 적립, 제휴 혜택</li>
  <li>기타 혜택: 해외 이용 수수료 ZERO</li>
                    </ul>
                </div>
                <div class="container">
            <img src="../../../images/product/SPIKECARD.png" width="50%" height="100%"/>
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
    <td>기본 적립</td>
    <td>모든 결제에 대해 1% 적립</td>
  </tr>
  <tr>
    <td>제휴 혜택</td>
    <td>제휴 업체에서 5% ~ 10% 할인</td>
  </tr>
  <tr>
    <td>해외 이용 혜택</td>
    <td>해외 이용 시 수수료 ZERO</td>
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
  <li>'카드' 메뉴에서 'SPIKE 카드' 선택</li>
  <li>신청서 작성 및 카드 발급 요청</li>
  <li>카드 발급 완료 후 사용 시작</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                    <li>해외 이용 시, 일부 국가에서 혜택이 제한될 수 있습니다.</li>
  <li>카드 사용 시 연체가 발생할 경우 추가 금리가 부과됩니다.</li>
  <li>카드 발급 시 연회비는 한 번만 결제됩니다.</li>
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

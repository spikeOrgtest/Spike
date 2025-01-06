<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="../assets/css/subpage.css">
<link rel="stylesheet" href="../assets/css/include.css">
<link rel="stylesheet" href="../sub/spike-savings.css">

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
			<a href="#">카드 상품</a> <span> > </span> <a href="#">SPIKE 디지털카드</a>
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
					<li><a href="Subpage_C1.jsp">SPIKE 청년카드</a></li>
					<li><a href="Subpage_C2.jsp">SPIKE 플래티넘 카드</a></li>
					<li><a href="Subpage_C3.jsp">SPIKE 디지털 카드</a></li>
					<li><a href="Subpage_C4.jsp">SPIKE 카드</a></li>  <%-- 현재페이지=선택된 메뉴면 배경색 진하게, 백엔드랑 연동할예정 --%>
					<li><a href="Subpage_C5.jsp">SPIKE AIR 카드</a></li>
					<li><a href="Subpage_C6.jsp">플러스 카드</a></li>
				</ul>
			</div>

			<%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
			<main>
        <section class="hero">
            <div class="container">
                <h1>SPIKE 디지털카드</h1>
                <p>온라인 쇼핑 및 디지털 콘텐츠 할인 혜택 제공! 실시간 결제 알림 및 보안 강화</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li>가입대상: 개인 (만 18세 이상)</li>
  <li>연회비: 15,000원</li>
  <li>카드종류: 신용카드</li>
  <li>주요 혜택: 온라인 쇼핑, 디지털 콘텐츠 할인</li>
  <li>기타 혜택: 실시간 결제 알림, 보안 강화</li>
                    </ul>
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
    <td>온라인 쇼핑 할인</td>
    <td>인기 온라인 쇼핑몰에서 최대 10% 할인</td>
  </tr>
  <tr>
    <td>디지털 콘텐츠 할인</td>
    <td>영화, 음악, OTT 등 구독 서비스 특별 혜택</td>
  </tr>
  <tr>
    <td>결제 알림 및 보안 강화</td>
    <td>실시간 온라인 결제 알림 및 보안 강화</td>
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
  <li>'카드' 메뉴에서 '디지털 카드' 선택</li>
  <li>신청서 작성 및 카드 발급 요청</li>
  <li>카드 발급 완료 후 사용 시작</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                    <li>카드 발급 후, 온라인 쇼핑몰 혜택은 제휴사에 따라 달라질 수 있습니다.</li>
  <li>카드 사용 시 일부 결제처에서 할인 혜택이 적용되지 않을 수 있습니다.</li>
  <li>연체 시 추가 수수료가 발생할 수 있습니다.</li>
                </ul>
            </div>
        </section>

        <section class="cta">
            <div class="container">
                <a href="#" class="button" id="joinButton">지금 가입하기</a>
            </div>
        </section>
    </main>
			
		</div>
	</div>
	
	
	
	
	<%@ include file="../include/shortfooter.jsp"%>
	<script src="./sub/spike-savings.js"></script>
</body>
</html>

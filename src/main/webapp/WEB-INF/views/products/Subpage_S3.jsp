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
			<a href="#">적금 상품</a> <span> > </span> <a href="#">청년 주택 드림</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container" >
		<%--////////////////////////////////////////////////////////// 경계 확인용, 스타일 지우고 사용 -> style="border: 1px solid gray; width:1200px; height: 1000px;"////////////////////////////////////////////--%>

			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">적금 상품</h3>
				<ul>
					<li><a href="Subpage_S1.jsp">SPIKE 적금</a></li>
					<li><a href="Subpage_S2.jsp">청년 저축적금</a></li>
					<li><a href="Subpage_S3.jsp">청년 주택드림</a></li>
					<li><a href="Subpage_S4.jsp">정기 적금</a></li>  <%-- 현재페이지=선택된 메뉴면 배경색 진하게, 백엔드랑 연동할예정 --%>
					<li><a href="Subpage_S5.jsp">드림 적금</a></li>
					<li><a href="Subpage_S6.jsp">플러스 적금</a></li>
				</ul>
			</div>

			<%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
			<main>
        <section class="hero">
            <div class="container">
                <h1>청년 주택 드림</h1>
                <p>내 집 마련의 꿈을 한 걸음 더 가까이! 청년 주택 드림 적금으로 안정적인 미래를 위한 투자 기회를 잡으세요.</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li>가입대상: 만 19세 이상 청년</li>
                <li>가입기간: 12개월 ~ 60개월</li>
                <li>가입금액: 월 10만원 ~ 200만원</li>
                <li>금리유형: 단리</li>
                <li>이자지급방식: 만기일시지급</li>
                    </ul>
                </div>
                </div>
                </section>
                <section class="interest-rates-section">
                <div class="container">
                <div class="interest-rates">
                    <h2>금리 정보</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>계약기간</th>
                                <th>기본금리</th>
                                <th>우대금리</th>
                                <th>최고금리</th>
                            </tr>
                        </thead>
                        <tbody>
                    <tr>
                        <td>12개월</td>
                        <td>연 3.5%</td>
                        <td>최대 연 1.5%</td>
                        <td>연 5.0%</td>
                    </tr>
                    <tr>
                        <td>24개월</td>
                        <td>연 4.0%</td>
                        <td>최대 연 2.0%</td>
                        <td>연 6.0%</td>
                    </tr>
                    <tr>
                        <td>36개월</td>
                        <td>연 4.5%</td>
                        <td>최대 연 2.0%</td>
                        <td>연 6.5%</td>
                    </tr>
                </tbody>
                    </table>
                </div>
            </div>
        </section>

        <section class="how-to-join">
            <div class="container">
                <h2>가입 방법</h2>
                <ol>
                    <li>SPIKE 앱 다운로드</li>
                    <li>회원가입 및 본인인증</li>
                    <li>'적금' 메뉴에서 '청년 주택 드림' 선택</li>
                    <li>약관 동의 및 상품 가입 정보 입력</li>
                    <li>가입 완료</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                    <li>중도해지 시, 약정 금리보다 낮은 금리가 적용됩니다.</li>
                <li>우대금리는 주택 구입을 위한 자금으로만 사용 가능합니다.</li>
                <li>자금은 주택 구매에만 사용 가능하며, 다른 용도로는 사용이 제한됩니다.</li>
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

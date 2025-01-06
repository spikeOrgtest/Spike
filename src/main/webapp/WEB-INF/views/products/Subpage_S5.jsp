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
			<a href="#">적금 상품</a> <span> > </span> <a href="#">SPIKE 적금</a>
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
                <h1>드림 적금</h1>
            <p>당신의 꿈을 실현할 수 있는 기회, 드림 적금으로 한 걸음 더 가까이 다가가세요.</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li>가입대상: 개인 (만 14세 이상)</li>
                <li>가입기간: 12개월 ~ 60개월</li>
                <li>가입금액: 월 5만원 ~ 500만원</li>
                <li>금리유형: 복리</li>
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
                        <td>연 4.0%</td>
                        <td>최대 연 1.0%</td>
                        <td>연 5.0%</td>
                    </tr>
                    <tr>
                        <td>24개월</td>
                        <td>연 4.5%</td>
                        <td>최대 연 1.5%</td>
                        <td>연 6.0%</td>
                    </tr>
                    <tr>
                        <td>36개월</td>
                        <td>연 5.0%</td>
                        <td>최대 연 2.0%</td>
                        <td>연 7.0%</td>
                    </tr>
                    <tr>
                        <td>60개월</td>
                        <td>연 5.5%</td>
                        <td>최대 연 2.5%</td>
                        <td>연 8.0%</td>
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
                <li>'적금' 메뉴에서 '드림 적금' 선택</li>
                <li>약관 동의 및 상품 가입 정보 입력</li>
                <li>가입 완료</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                    <li>자동 이자 재투자 기능이 활성화됩니다.</li>
                <li>우대금리는 조건 충족 시에만 적용됩니다.</li>
                <li>만기 연장 옵션을 통해 장기적인 자산 증식이 가능합니다.</li>
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

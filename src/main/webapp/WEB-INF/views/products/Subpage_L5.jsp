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
			<a href="#">대출 상품</a> <span> > </span> <a href="#">주택담보 대출</a>
		</div>
	</div>

	<div class="subpageWrapper">
		<%-- 메인 컨테이너(사이드바, 컨텐츠 포함하는 큰 틀) --%>
		<div class="subpage-main-container" >
		<%--////////////////////////////////////////////////////////// 경계 확인용, 스타일 지우고 사용 -> style="border: 1px solid gray; width:1200px; height: 1000px;"////////////////////////////////////////////--%>

			<%-- 사이드바 --%>
			<div class="subpage-sidebar">
				<h3 class="subpage-sidebar-title">대출 상품</h3>
				<ul>
					<li><a href="Subpage_L1.jsp">SPIKE 학자금 대출</a></li>
					<li><a href="Subpage_L2.jsp">SPIKE 비상금 대출</a></li>
					<li><a href="Subpage_L3.jsp">SPIKE 직장인 대출</a></li>
					<li><a href="Subpage_L4.jsp">SPIKE 대출</a></li>  <%-- 현재페이지=선택된 메뉴면 배경색 진하게, 백엔드랑 연동할예정 --%>
					<li><a href="Subpage_L5.jsp">주택담보 대출</a></li>
					<li><a href="Subpage_L6.jsp">소상공인 대출</a></li>
				</ul>
			</div>

			<%-- ===============================컨텐츠 랩(여기에 상세 컨텐츠가 들어감)================================= --%>
			<main>
        <section class="hero">
            <div class="container">
                <h1>주택담보 대출</h1>
            <p>내 집 마련을 위한 최고의 선택! 목표 금액 달성 시 특별 금리 혜택을 제공하는 대출!</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li><strong>가입대상:</strong> 개인 (만 25세 이상, 주택을 구입하려는 분)</li>
                <li><strong>대출금액:</strong> 최대 3억원</li>
                <li><strong>대출기간:</strong> 5년 ~ 30년</li>
                <li><strong>상환방법:</strong> 원리금균등상환</li>
                <li><strong>기타 혜택:</strong> 목표 금액 달성 시 특별 금리 제공</li>
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
                        <td>5년</td>
                        <td>연 3.5%</td>
                        <td>최대 연 1.0%</td>
                        <td>연 4.5%</td>
                    </tr>
                    <tr>
                        <td>10년</td>
                        <td>연 4.0%</td>
                        <td>최대 연 1.5%</td>
                        <td>연 5.5%</td>
                    </tr>
                    <tr>
                        <td>20년</td>
                        <td>연 4.5%</td>
                        <td>최대 연 2.0%</td>
                        <td>연 6.5%</td>
                    </tr>
                    <tr>
                        <td>30년</td>
                        <td>연 5.0%</td>
                        <td>최대 연 2.5%</td>
                        <td>연 7.5%</td>
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
                    <li>'대출' 메뉴에서 '주택담보 대출' 선택</li>
                    <li>약관 동의 및 상품 가입 정보 입력</li>
                    <li>가입 완료</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                    <li>대출금액은 주택 감정가의 80% 이하로 제공됩니다.</li>
                <li>중도 상환 시 수수료가 발생할 수 있습니다.</li>
                <li>대출 연체 시 연체금리가 부과됩니다.</li>
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

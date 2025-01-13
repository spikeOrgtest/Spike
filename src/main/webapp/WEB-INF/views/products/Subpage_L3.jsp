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
			<a href="#">대출 상품</a> <span> > </span> <a href="#">SPIKE 직장인 대출</a>
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
               <h1>SPIKE 직장인 대출</h1>
            <p>직장인을 위한 맞춤형 대출! 매월 추가 금리 적립과 우대 금리로 더 유리하게 대출 받으세요.</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li><strong>가입대상:</strong> 직장인 (만 20세 이상)</li>
                <li><strong>대출금액:</strong> 100만원 ~ 1,500만원</li>
                <li><strong>대출기간:</strong> 12개월 ~ 60개월</li>
                <li><strong>상환방법:</strong> 원리금균등상환</li>
                <li><strong>기타 혜택:</strong> 매월 금리 적립, 우대 금리 적용</li>
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
                        <td>최대 연 1.5%</td>
                        <td>연 5.5%</td>
                    </tr>
                    <tr>
                        <td>24개월</td>
                        <td>연 4.5%</td>
                        <td>최대 연 2.0%</td>
                        <td>연 6.5%</td>
                    </tr>
                    <tr>
                        <td>36개월</td>
                        <td>연 5.0%</td>
                        <td>최대 연 2.5%</td>
                        <td>연 7.5%</td>
                    </tr>
                    <tr>
                        <td>60개월</td>
                        <td>연 5.5%</td>
                        <td>최대 연 3.0%</td>
                        <td>연 8.5%</td>
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
                    <li>'대출' 메뉴에서 'SPIKE 직장인 대출' 선택</li>
                    <li>약관 동의 및 상품 가입 정보 입력</li>
                    <li>가입 완료</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                   <li>대출금액은 최대 1,500만원까지 가능합니다.</li>
                <li>매월 금리 적립은 본인의 직장 및 근로 조건에 따라 달라질 수 있습니다.</li>
                <li>대출 연체 시 우대금리가 적용되지 않습니다.</li>
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

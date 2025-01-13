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
			<a href="#">대출 상품</a> <span> > </span> <a href="#">SPIKE 대출</a>
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
               <h1>SPIKE 대출</h1>
            <p>빠르고 유리한 대출 조건으로 다양한 금융 지원 혜택을 제공합니다.</p>
            </div>
        </section>

        <section class="product-details">
            <div class="container">
                <div class="product-info">
                    <h2>상품 상세 정보</h2>
                    <ul>
                        <li>가입대상: 개인 (만 19세 이상, 신용등급 4등급 이상)</li>
  <li>대출한도: 최대 5,000만원</li>
  <li>대출금리: 연 3.5% ~ 5.5% (개인 신용도에 따라 차등 적용)</li>
  <li>대출종류: 신용대출</li>
  <li>주요 혜택: 빠른 승인, 유리한 금리 조건</li>
  <li>기타 혜택: 대출금리 자동 재조정, 상환 방식 유연</li>
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
    <td>대출 금리</td>
    <td>연 3.5% ~ 5.5% (신용등급에 따라 달라짐)</td>
  </tr>
  <tr>
    <td>빠른 승인</td>
    <td>대출 신청 후 1일 이내 승인 가능</td>
  </tr>
  <tr>
    <td>유연한 상환 조건</td>
    <td>고정금리 및 변동금리 선택 가능, 상환 기간 최대 5년</td>
  </tr>
  <tr>
    <td>금리 재조정</td>
    <td>매년 대출금리 재조정 가능</td>
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
                    <li>회원가입 및 본인인증</li>
                    <li>'대출' 메뉴에서 'SPIKE 대출' 선택</li>
                    <li>신청서 작성 및 대출 한도 및 금리 확인</li>
  <li>대출 승인 후 대출금 수령</li>
                </ol>
            </div>
        </section>

        <section class="notes">
            <div class="container">
                <h2>유의사항</h2>
                <ul>
                  <li>대출 신청 시 신용도 및 개인 상황에 따라 대출 한도와 금리가 달라질 수 있습니다.</li>
  <li>대출 연체 시 연체금리가 부과되며, 신용도에 영향을 줄 수 있습니다.</li>
  <li>대출금은 승인 후 1일 이내 지급되며, 상환은 월별로 이루어집니다.</li>
  <li>대출금액 및 상환 일정은 변경될 수 있으므로 계약 시 확인 바랍니다.</li>
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

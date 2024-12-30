<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사기 계좌 조회</title>
<link href="assets/css/scam.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="assets/css/include.css">
</head>



<jsp:include page="include/header.jsp"/>

<body>
	<div class="main-section">
		<%-- 슬로건 --%>
		<h1 class="slogan">
			한눈에 사기 계좌 여부를 확인하세요! <br />안심할 수 있는 금융 생활의 시작!
		</h1>
		<%-- 슬로건 카드디자인 --%>
		<div class="card-container1">
			<%-- 카드1 --%>
			<div class="card">
				<i class="fas fa-shield-alt card-icon"></i>
				<p class="card-slogan">안전한 금융 서비스를 제공하는 믿을 수 있는 플랫폼</p>
			</div>
			<%-- 카드2 --%>
			<div class="card">
				<i class="fas fa-search-dollar card-icon"></i>
				<p class="card-slogan">간편한 계좌 조회로 사기 피해를 예방하세요</p>
			</div>
		</div>
		<br />

		<%-- 서비스 작동 방식 --%>
		<div class="how-it-works">
			<h2>서비스 이용 방법</h2>
			<div class="timeline">
				<div class="timeline-item">
					<div class="timeline-icon">
						<i class="fas fa-keyboard"></i>
					</div>
					<div class="timeline-content">
						<h3>1. 계좌 번호 입력</h3>
						<p>입력창에 계좌 번호를 적고 조회 버튼을 눌러주세요.</p>
					</div>
				</div>
				<div class="timeline-item">
					<div class="timeline-icon">
						<i class="fas fa-search"></i>
					</div>
					<div class="timeline-content">
						<h3>2. 조회 버튼 클릭</h3>
						<p>시스템이 사기 계좌 데이터베이스를 확인합니다.</p>
					</div>
				</div>
				<div class="timeline-item">
					<div class="timeline-icon">
						<i class="fas fa-info-circle"></i>
					</div>
					<div class="timeline-content">
						<h3>3. 결과 확인</h3>
						<p>결과를 통해 계좌 상태를 바로 알 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>


		<%-- 검색바 --%>
		<div class="search-bar">
			<input type="text" placeholder="핸드폰번호 또는 계좌번호를 입력하세요."
				class="input-field">
			<button class="search-button">검색</button>

		</div>
		<br />
		<h5>피해자가 되기 전에 먼저 알아보고 이체하는 습관을 가져주시기 바랍니다.</h5>
		<%-- 신뢰 배너 --%>
		<div class="trust-banner">
			<p>
				현재까지 <strong class="emphasized-text">10만 건 이상의 사기 계좌</strong>를
				차단했습니다!
			</p>
		</div>


		<%-- 서비스 주요 통계 --%>
		<div class="statistics">
			<div class="statistics-card card-blue">
				<i class="bi bi-shield-lock-fill"></i>
				<div class="number">10만+</div>
				<p class="description">차단된 사기 계좌</p>
			</div>
			<div class="statistics-card card-green">
				<i class="bi bi-calendar-check"></i>
				<div class="number">5,000건</div>
				<p class="description">매일 업데이트되는 데이터</p>
			</div>
			<div class="statistics-card card-yellow">
				<i class="bi bi-people-fill"></i>
				<div class="number">50만 명</div>
				<p class="description">이용자 수</p>
			</div>
		</div>


		<%-- 후기 카드 --%>
		<div class="card-container2">
			<%-- 카드1 --%>
			<div class="card">
				<i class="bi bi-shield-lock-fill card-icon"></i>
				<p class="card-slogan">
					"최근 친구한테 돈을 보냈는데 뭔가 찜찜해서 바로 이 서비스를 이용해 봤어요. 몇 초 만에 계좌를 조회하고 사기 계좌인지
					확인할 수 있었어요! 덕분에 피해를 막을 수 있었습니다. 이런 서비스가 있다는 게 정말 안심이 되네요. 앞으로도 계속
					사용할 예정입니다!"<br /> - 김XX, 서울
				</p>
			</div>
			<%-- 카드2 --%>
			<div class="card">
				<i class="bi bi-search card-icon"></i>
				<p class="card-slogan">
					"평소 중고거래를 자주 하는데, 이번에 낯선 계좌로 거래를 하게 되면서 걱정이 많이 됐어요. 이 서비스를 통해 간단히
					확인했더니, 사기 신고 이력이 있는 계좌라는 걸 알게 됐습니다. 피해를 예방할 수 있어 정말 감사해요. 믿을 수 있는
					플랫폼이라 적극 추천합니다!"<br /> - 이XX, 부산
				</p>
			</div>
		</div>



		<%-- 사용자 참여 독려 --%>
		<div class="call-to-action">
			<h2>사기 방지에 동참하세요</h2>
			<p>의심 계좌가 있다면 지금 신고하여 사기 예방에 힘을 보태주세요!</p>
			<%-- 의심 계좌 신고 버튼 --%>
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModal">보이스피싱 신고하기</button>

			<%-- 첫 번째 모달: 의심 계좌 신고 모달 --%>
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">의심계좌를
								신고해주세요.</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>허위 신고는 더 많은 피해자를 만들수 있습니다.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="reportButton">신고하기</button>
						</div>
					</div>
				</div>
			</div>

			<%-- 두 번째 모달: 신고 후 나타나는 모달 --%>
			<div class="modal fade" id="mdoModal" tabindex="-1"
				aria-labelledby="mdoModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<%-- 동적으로 "New message to @mdo"로 제목을 설정 --%>

							<h1 class="modal-title fs-5" id="mdoModalLabel">보이스피싱 의심자 등록</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">전화번호
										또는 계좌번호 입력:</label> <input type="text" class="form-control"
										id="recipient-name">
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">신고 내용:</label>
									<textarea class="form-control" id="message-text"></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary">신고 완료</button>
						</div>
					</div>
				</div>
			</div>

			<%-- javascript --%>
			<script>
  
  var reportButton = document.getElementById('reportButton');
  var cancelButton = document.getElementById('cancelButton'); 
  var exampleModal = new bootstrap.Modal(document.getElementById('exampleModal'));
  var mdoModal = new bootstrap.Modal(document.getElementById('mdoModal'));

  reportButton.addEventListener('click', function() {
    
    exampleModal.hide(); 
    mdoModal.show(); 
  });

  
  cancelButton.addEventListener('click', function() {
    mdoModal.hide(); 
    exampleModal.hide(); 
  });
</script>



		</div>




		<div class="shiny-text">
			<p>spike가 사기 없는 안전한 금융 플랫폼을 만들어갑니다.</p>
		</div>
	</div>




	</div>
	<%-- 래퍼 --%>


	<jsp:include page="include/footer.jsp" />

</body>
</html>

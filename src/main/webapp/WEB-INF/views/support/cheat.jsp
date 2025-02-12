<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사기 계좌 조회</title>
<link href="/css/support/cheat.css" rel="stylesheet">
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
	<link rel="stylesheet" href="/css/include/include.css">
</head>



<%@ include file="../include/header.jsp"%>

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
		<form action="search" method="GET" id="searchForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="text" id="search" name="detailValue" placeholder="계좌번호를 입력하세요."
				class="input-field">
			<button type="submit" class="search-button">검색</button>
		</form>
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
			<button type="button" id="reportbtn" class="btn btn-primary">보이스피싱 신고하기</button>

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
							<form action="cheat" method="post" id="cheatForm">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">계좌번호 입력:</label> 
									<input type="text" class="form-control" id="detailValue" name="detailValue">
									<span class="error-message" id="accountError" style="color:red;"></span>
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">신고 내용:</label>
									<textarea class="form-control" id="content" name="content"></textarea>
									<span class="error-message" id="contentError" style="color:red;"></span>
								</div>
						<div class="modal-footer">
							<button type="reset" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">신고 완료</button>
						</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="user" hidden>${empty sessionScope.User.name}</div>

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
  
  document.getElementById('searchForm').addEventListener('submit',function(e) {
  			let isValid = true;
  			
  			const search = document.getElementById('search').value;
  			if (search === '') {
  				alert('계좌번호를 입력하세요');
  				isValid = false;
  			}
			if (!isValid) {
				e.preventDefault();
			}
  });
  
  document.getElementById('cheatForm').addEventListener('submit',function(e) {
		let isValid = true;
		
		document.getElementById('accountError').textContent = '';
		document.getElementById('contentError').textContent = '';
		
		const detailValue = document.getElementById('detailValue').value;
		if (detailValue === '') {
			document.getElementById('accountError').textContent = '계좌번호를 입력해주세요';
			document.getElementById('detailValue').focus();
			isValid = false;
		}
		
		if (isValid) {
			const content = document.getElementById('content').value;
			if(content === '') {
			document.getElementById('contentError').textContent = '내용을 입력해주세요';
			document.getElementById('content').focus();
			isValid = false;
			}
		}
		
		if (isValid) {
		    const detailValue = document.getElementById('detailValue').value;
		    const regex = /^\d{3,4}-\d{3,4}-\d{3,4}-\d{2}$/;

		    if (!regex.test(detailValue)) {
		        document.getElementById('accountError').textContent = '계좌번호 형식이 틀립니다';
		        document.getElementById('detailValue').focus();
		        isValid = false;
		    }
		}

		if (!isValid) {
			e.preventDefault();
		}
});
  
  document.addEventListener('DOMContentLoaded', function () {
	    var exampleModal = new bootstrap.Modal(document.getElementById('exampleModal'));
	    
	    document.getElementById('reportbtn').addEventListener('click', function (e) {
	        const user = document.getElementById('user').textContent.trim();
	        if (user === "true") {
	            alert('로그인이 필요한 서비스입니다.');
	            e.preventDefault();
	            e.stopPropagation();
	            return false;
	        } else {
	            exampleModal.show();  // 로그인된 경우 모달 열기
	        }
	    });
	});
  
  document.addEventListener("DOMContentLoaded", function () {
      const accountInputs = [document.getElementById("detailValue"), document.getElementById("search")];

      accountInputs.forEach(accountInput => {
          if (!accountInput) return; // 요소가 존재하지 않으면 패스

          accountInput.addEventListener("input", function () {
              let value = accountInput.value.replace(/[^0-9]/g, ""); // 숫자만 입력 가능
              let formattedValue = "";

              // 입력된 숫자 길이에 따라 자동 포맷팅 (3-4-4-2 고정)
              if (value.length > 3) {
                  formattedValue += value.substring(0, 3) + "-";
                  if (value.length > 7) {
                      formattedValue += value.substring(3, 7) + "-";
                      if (value.length > 11) {
                          formattedValue += value.substring(7, 11) + "-";
                          formattedValue += value.substring(11, 13);
                      } else {
                          formattedValue += value.substring(7);
                      }
                  } else {
                      formattedValue += value.substring(3);
                  }
              } else {
                  formattedValue = value;
              }

              accountInput.value = formattedValue; // 입력 필드 업데이트
          });

          accountInput.addEventListener("keydown", function (event) {
              // 백스페이스를 눌렀을 때 '-' 자동 삭제
              if (event.key === "Backspace") {
                  let value = accountInput.value;
                  if (value.endsWith("-")) {
                      accountInput.value = value.slice(0, -1);
                  }
              }
          });

          accountInput.addEventListener("blur", function () {
              let value = accountInput.value.replace(/[^0-9]/g, "");

              // 입력 길이가 13자리가 아니면 경고 메시지
              if (value.length !== 13) {
                  alert("계좌번호는 3-4-4-2 형식(13자리)로 입력해야 합니다.");
                  accountInput.value = ""; // 잘못된 입력 초기화
              }
          });
      });
  });

  
</script>



		</div>




		<div class="shiny-text">
			<p>spike가 사기 없는 안전한 금융 플랫폼을 만들어갑니다.</p>
		</div>
	</div>




	</div>
	<%-- 래퍼 --%>


	<%@ include file="../include/shortfooter.jsp"%>

</body>
</html>

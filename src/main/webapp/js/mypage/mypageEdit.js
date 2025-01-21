function domain_list() {
	var s = document.forms['s']; // s 폼 객체를 가져와야 합니다.
	var num = s.mail_list.selectedIndex;

	// 선택된 값이 없으면 바로 반환
	if (num == -1) {
		return true;
	}

	// "직접입력"을 선택한 경우
	if (s.mail_list.value == "직접입력") {
		s.email_domain.value = ""; // 입력 필드를 비워두기
		s.email_domain.readOnly = false; // 사용자가 입력할 수 있도록 설정
		s.email_domain.focus(); // 포커스를 주어 사용자가 입력할 수 있게 함
	} else {
		s.email_domain.value = s.mail_list.options[num].value; // 선택된 값으로 이메일 도메인 설정
		s.email_domain.readOnly = true; // 수정 불가능하게 설정
	}
}

document.getElementById("editProfileForm").onsubmit = function(event) {
    // 비밀번호와 비밀번호 확인 값 가져오기
    var password = document.getElementById("password").value;
    var password2 = document.getElementById("password2").value;

    // 비밀번호가 8자리 이상인지 확인
    if (password.length < 8) {
        alert("비밀번호는 8자리 이상이어야 합니다.");
        event.preventDefault();  // 폼 제출 방지
        return false;
    }

    // 비밀번호와 비밀번호 확인이 일치하는지 확인
    if (password !== password2) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        event.preventDefault();  // 폼 제출 방지
        return false;
    }

    // 모든 검사가 통과하면 폼을 제출
    return true;
};

function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 주소 항목을 처리하는 부분

							// 도로명 주소
							var roadAddr = data.roadAddress;
							var extraRoadAddr = ''; // 참고 항목

							// 법정동명이 있을 경우 추가
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}

							// 건물명이 있을 경우, 공동주택인 경우 추가
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							// 참고 항목을 괄호 안에 넣기
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 폼 필드에 값 입력
							document.getElementById('postcode').value = data.zonecode; // 우편번호
							document.getElementById("roadAddress").value = roadAddr; // 도로명 주소
							document.getElementById("jibunAddress").value = data.jibunAddress; // 지번 주소

							// 참고 항목 추가
							if (roadAddr !== '') {
								document.getElementById("References").value = extraRoadAddr;
							} else {
								document.getElementById("References").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 예시 도로명 주소 및 지번 주소 표시
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open(); // 우편번호 검색 팝업 열기
		}
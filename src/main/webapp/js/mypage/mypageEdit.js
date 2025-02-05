function domain_list() {
	var s = document.forms['s']; // s 폼 객체를 가져와야 합니다.
	var num = s.mail_list.selectedIndex;

	// 선택된 값이 없으면 바로 반환
	if (num == -1) {
		return true;
	}

	// "직접입력"을 선택한 경우
	if (s.mail_list.value == "직접입력") {
		s.EmailDomain.value = ""; // 입력 필드를 비워두기
		s.EmailDomain.readOnly = false; // 사용자가 입력할 수 있도록 설정
		s.EmailDomain.focus(); // 포커스를 주어 사용자가 입력할 수 있게 함
	} else {
		s.EmailDomain.value = s.mail_list.options[num].value; // 선택된 값으로 이메일 도메인 설정
		s.EmailDomain.readOnly = true; // 수정 불가능하게 설정
	}
}

document.getElementById("editProfileForm").addEventListener('submit', function(e) {
	
	let isValid = true;

        // 모든 오류 메시지 초기화
        document.getElementById('nameError').textContent = '';
        document.getElementById('emailError').textContent = '';  
        document.getElementById('currentpasswordError').textContent = '';
        document.getElementById('passwordError').textContent = '';
        document.getElementById('password2Error').textContent = '';

        // 이름 유효성 검사
        const name = document.getElementById('name').value;
        if (name === '') {
            document.getElementById('nameError').textContent = '이름을 입력해주세요';
            document.getElementById('name').focus();
            isValid = false;
        }

        // 이메일 유효성 검사
        if (isValid) {
            const email = document.getElementById('EmailId').value;
            const emailDomain = document.getElementById('EmailDomain').value;
            const emailFull = email + '@' + emailDomain;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailFull || !emailRegex.test(emailFull)) {
                document.getElementById('emailError').textContent = '올바른 이메일 형식이 아닙니다';
                document.getElementById('EmailId').focus();
                isValid = false;
            }
        }
		
		// 핸드폰 검증
		if (isValid) {
		const phone01 = document.getElementById('phone01').value; // 선택된 값
		const phone02 = document.getElementById('phone02').value;
		const phone03 = document.getElementById('phone03').value;
		const phoneRegex = /^[0-9]{4}$/;

		if (phone02 === '' || phone03 === '') {
			document.getElementById('phoneError').textContent = '핸드폰 번호를 모두 입력해주세요';
			document.getElementById('phone02').focus();
			isValid = false;
		} else if (!phoneRegex.test(phone02)
				|| !phoneRegex.test(phone03)) {
			document.getElementById('phoneError').textContent = '핸드폰 번호가 올바르지 않습니다';
			document.getElementById('phone02').focus();
			isValid = false;
			}
		}
		
		// 주소 검증
		if (isValid) {
		const postcode = document.getElementById('postcode').value;
		if (postcode === '') {
			document.getElementById('addressError').textContent = '주소를 입력해주세요';
			document.getElementById('postcode').focus();
			isValid = false;
			}
		}
		
		// 상세주소 검증
		if (isValid) {
		const detailAddress = document.getElementById('detailAddress').value;
		if (detailAddress === '') {
			document.getElementById('addressError').textContent = '상세주소를 입력해주세요';
			document.getElementById('detailAddress').focus();
			isValid = false;
		}
		}

        // 현재 비밀번호 유효성 검사
        if (isValid) {
            const currentPassword = document.getElementById('currentPassword').value;
            if (currentPassword === '') {
                document.getElementById('currentpasswordError').textContent = '비밀번호를 입력해주세요';
                document.getElementById('currentPassword').focus();
                isValid = false;
            } else if (currentPassword.length < 8) {
                document.getElementById('currentpasswordError').textContent = '비밀번호는 8자 이상이어야 합니다';
                document.getElementById('currentPassword').focus();
                isValid = false;
            }
        }

        // 새 비밀번호 유효성 검사
        if (isValid) {
            const password = document.getElementById('password').value;
			const currentPassword = document.getElementById('currentPassword').value;
            if (password === '') {
                document.getElementById('passwordError').textContent = '비밀번호를 입력해주세요';
                document.getElementById('password').focus();
                isValid = false;
            } else if (password.length < 8) {
                document.getElementById('passwordError').textContent = '비밀번호는 8자 이상이어야 합니다';
                document.getElementById('password').focus();
                isValid = false;
            } else if (password === currentPassword) {
				document.getElementById('passwordError').textContent = '현재 비밀번호와 일치합니다.';
				document.getElementById('password').focus();
				isValid = false;
			}
        }

        // 비밀번호 확인 유효성 검사
        if (isValid) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('password2').value;
            if (password !== confirmPassword) {
                document.getElementById('password2Error').textContent = '새 비밀번호와 일치하지 않습니다';
                document.getElementById('password2').focus();
                isValid = false;
            }
        }

        // 유효성 검사가 실패하면 폼 제출 방지
        if (!isValid) {
            e.preventDefault(); // 이 부분이 폼 제출을 막는 부분입니다.
        }
    });

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
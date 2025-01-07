    // 비밀번호 확인 기능
    const passwordField = document.getElementById("password");
    const confirmPasswordField = document.getElementById("confirm_password");
    const submitButton = document.querySelector("button[type='submit']");

    confirmPasswordField.addEventListener("input", function() {
        const password = passwordField.value;
        const confirmPassword = confirmPasswordField.value;

        // 비밀번호가 일치하지 않으면 경고 표시
        if (password !== confirmPassword) {
            confirmPasswordField.setCustomValidity("비밀번호가 일치하지 않습니다.");
            confirmPasswordField.style.borderColor = "red"; // 빨간색 테두리
        } else {
            confirmPasswordField.setCustomValidity(""); // 유효성 검사 통과
            confirmPasswordField.style.borderColor = "green"; // 초록색 테두리
        }
    });

    // 이메일 형식 검증
    const emailField = document.getElementById("email");
    emailField.addEventListener("input", function() {
        const email = emailField.value;
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 이메일 정규식
        if (!emailPattern.test(email)) {
            emailField.setCustomValidity("유효한 이메일을 입력하세요.");
            emailField.style.borderColor = "red"; // 빨간색 테두리
        } else {
            emailField.setCustomValidity(""); // 유효성 검사 통과
            emailField.style.borderColor = "green"; // 초록색 테두리
        }
    });

    // 전화번호 형식 검증
    const phoneField = document.getElementById("phone");
    phoneField.addEventListener("input", function() {
        const phone = phoneField.value;
        const phonePattern = /^\d{3}-\d{3,4}-\d{4}$/; // 전화번호 형식 정규식
        if (!phonePattern.test(phone)) {
            phoneField.setCustomValidity("전화번호 형식이 잘못되었습니다.");
            phoneField.style.borderColor = "red"; // 빨간색 테두리
        } else {
            phoneField.setCustomValidity(""); // 유효성 검사 통과
            phoneField.style.borderColor = "green"; // 초록색 테두리
        }
    });

        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

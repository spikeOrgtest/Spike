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

    // 폼 제출 전 확인
    document.querySelector("form").addEventListener("submit", function(event) {
        const nameField = document.getElementById("name");
        const addressField = document.getElementById("address");

        // 이름, 주소가 비어있지 않은지 확인
        if (!nameField.value.trim() || !addressField.value.trim()) {
            event.preventDefault(); // 제출을 막음
            alert("이름과 주소를 모두 입력해주세요.");
        }
    });

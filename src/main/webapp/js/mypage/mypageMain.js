    // 알림 설정 변경 시 효과
    const emailNotificationsCheckbox = document.getElementById('emailNotifications');
    const notificationStatus = document.getElementById('notificationStatus');

    emailNotificationsCheckbox.addEventListener('change', function() {
        if (this.checked) {
            notificationStatus.textContent = '알림 설정에 동의했습니다.';
        } else {
            notificationStatus.textContent = '알림 설정에 동의하지 않았습니다.';
        }
    });
    
    // 목표 금액 알림 설정 체크박스
    const goalAmountCheckbox = document.getElementById('goalAmountNotifications');
    const goalNotificationStatus = document.getElementById('goalNotificationStatus'); // 이름 변경

    // 체크박스 상태에 따른 텍스트 업데이트
    goalAmountCheckbox.addEventListener('change', function() {
        if (goalAmountCheckbox.checked) {
            goalNotificationStatus.textContent = "알림 설정에 동의했습니다.";
        } else {
            goalNotificationStatus.textContent = "알림 설정에 동의하지 않았습니다.";
        }
    });
    

    // 프로필 수정 폼 제출 시
    document.getElementById('editProfileForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const userName = document.getElementById('userName').value;
        const userEmail = document.getElementById('userEmail').value;
        const userPassword = document.getElementById('userPassword').value;
        
        // 여기서 서버로 데이터를 보내거나 로컬에서 상태를 업데이트할 수 있습니다.
        alert('프로필이 성공적으로 업데이트되었습니다!');
        // 모달을 닫습니다.
        const modal = bootstrap.Modal.getInstance(document.getElementById('editProfileModal'));
        modal.hide();
    });

    function logout() {
      // 로그아웃 처리 로직 (예: 세션 삭제, 로그인 페이지로 리다이렉트)
      alert("로그아웃되었습니다.");
      // 실제로는 로그인 페이지나 홈 페이지로 리다이렉트 할 수 있습니다.
      window.location.href = "login.html";
  }
    document.getElementById('openWithdrawalModal').addEventListener('click', function () {
    var modal = new bootstrap.Modal(document.getElementById('withdrawalModal'), {
        keyboard: false
    });
    modal.show();
});
document.getElementById('withdrawal-form').addEventListener('submit', function (e) {
    e.preventDefault();  // 폼 제출을 막음

    // 체크박스 상태 확인
    const confirmCheck = document.getElementById('confirmCheck').checked;

    if (confirmCheck) {
        // 체크박스가 선택되면 탈퇴 처리
        alert('회원탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.');
        window.location.href = 'index.html';  // 홈 페이지로 리다이렉트
    } else {
        // 체크박스가 선택되지 않으면 경고
        alert('회원탈퇴 확인을 체크해주세요.');
    }
});


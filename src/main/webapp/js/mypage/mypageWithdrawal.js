    document.getElementById('withdrawal-form').addEventListener('submit', function (e) {
        e.preventDefault();
        const confirmCheck = document.getElementById('confirmCheck').checked;

        if (confirmCheck) {
            // 실제 탈퇴 처리 로직
            alert('회원탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.');
            window.location.href = 'index.html';
        } else {
            alert('회원탈퇴 확인을 체크해주세요.');
        }
    });


document.addEventListener('DOMContentLoaded', function() {
    const keypad = document.querySelector('.keypad-grid');
    const keyDescription = document.getElementById('keyDescription');
    
    const messages = {
        '1': '계좌 관련 서비스를 제공합니다.\n- 계좌 조회\n- 계좌 이체\n- 계좌 신규 개설',
        '2': '카드 관련 서비스를 제공합니다.\n- 카드 발급\n- 카드 분실신고\n- 카드 한도 조회',
        '3': '대출 관련 서비스를 제공합니다.\n- 대출 상담\n- 대출 한도 조회\n- 대출 상환',
        '4': '금융상품 관련 서비스를 제공합니다.\n- 예금/적금\n- 펀드\n- 보험',
        '5': '공인인증 관련 서비스를 제공합니다.\n- 인증서 발급\n- 인증서 갱신\n- 인증서 폐기',
        '6': '기타 서비스를 제공합니다.\n- 이용안내\n- 수수료 안내\n- 지점 안내',
        '7': '분실신고 서비스를 제공합니다.\n- 카드 분실신고\n- 통장 분실신고\n- 인증서 분실',
        '8': '상담원 연결 서비스입니다.\n잠시만 기다려주시면 상담원과 연결해드리겠습니다.',
        '9': '외국어 서비스를 제공합니다.\n- English\n- 日本語\n- 中文\n- Español',
        '*': '처음 메뉴로 돌아갑니다.',
        '0': '이전 메뉴로 돌아갑니다.',
        '#': '안내 멘트를 다시 들려드립니다.'
    };

    keypad.addEventListener('click', function(e) {
        const key = e.target.closest('.key');
        if (!key) return;

        const keyValue = key.textContent.trim().charAt(0);
        const message = messages[keyValue];

        if (message) {
            keyDescription.textContent = message;
        }
    });

    // Keyboard accessibility
    keypad.addEventListener('keydown', function(e) {
        if (e.key === 'Enter' || e.key === ' ') {
            e.preventDefault();
            e.target.click();
        }
    });
});


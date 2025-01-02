<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SPIKE 계좌 개설</title>
        <link rel="stylesheet" href="newmember.css" />
    </head>
    <body>
        <div class="container">
            <h1>SPIKE 계좌 개설</h1>
            <form id="signupForm">
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" required />
                </div>
                <div class="form-group">
                    <label for="ssn">주민등록번호</label>
                    <input
                        type="text"
                        id="ssn"
                        name="ssn"
                        required
                        pattern="\d{6}-\d{7}"
                        placeholder="123456-1234567"
                    />
                </div>
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" required />
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        required
                    />
                    <p class="password-requirements">
                        비밀번호는 8자 이상, 대소문자, 숫자, 특수문자를 포함해야
                        합니다.
                    </p>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input
                        type="password"
                        id="confirmPassword"
                        name="confirmPassword"
                        required
                    />
                </div>
                <div class="form-group checkbox">
                    <input type="checkbox" id="termsAgreement" required />
                    <label for="termsAgreement">
                        <a href="#" id="termsLink">금융 서비스 이용약관</a>에
                        동의합니다.
                    </label>
                </div>
                <div class="form-group checkbox">
                    <input type="checkbox" id="privacyAgreement" required />
                    <label for="privacyAgreement">
                        <a href="#" id="privacyLink">개인정보 처리방침</a>에
                        동의합니다.
                    </label>
                </div>
                <div>
                    <button type="submit">계좌 개설</button>
                    <button type="button" onclick="location.href='../products.jsp'">취소</button>
                </div>
            </form>
            <div id="accountInfo" class="hidden">
                <p>계좌가 성공적으로 개설되었습니다!</p>
                <p>귀하의 계좌번호: <span id="accountNumber"></span></p>
            </div> 
            <p class="security-notice">
                ⚠️ 보안 주의사항: 귀하의 개인정보 보호를 위해 공용 컴퓨터에서는
                사용을 자제해 주시기 바랍니다.
            </p>
        </div>
        <script src="newmember.js"></script>
    </body>
</html>

/**
 *  transfer_ok.js
 */

//사기계좌 조회
function shield() {
	const imgElement = document.querySelector("#imgWrapper img");
	    const status = document.getElementById("shieldWrapper").dataset.status; // data-status 값 가져오기

	    if (imgElement) {
	        if (status === "ACTIVE") {
	            imgElement.src = "/images/transfer/shieldcheck.png";
	        }
			else{
				imgElement.src = "/images/transfer/shield_alert.png";
			}
	    }
}

//유효성 검증(otp 도입 예정.. 임시로 계좌비번 한번 더)
function validate() {
    const storedPassword = document.getElementById("accountPassword").value;
    const inputPassword = document.getElementById("inputPassword").value;
	const status = document.getElementById("shieldWrapper").dataset.status;


    if (inputPassword === "") {
        alert("비밀번호를 입력하세요.");
        return false; 
    }

    if (inputPassword !== storedPassword) {
        alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
        return false; 
    }
	
	if (status === "ACTIVE") {
		return true;
	}else{
		alert("사기의심계좌로 등록된 계좌입니다! 송금이 제한됩니다.")
	}
	
    return true;
}

//송금 취소
function transfer_cancel(){
	if (confirm("송금을 취소하시겠습니까? 송금 정보는 사라집니다.")) {
	        window.location.href = "/spike.com/transfer_cancel";
	    }
}
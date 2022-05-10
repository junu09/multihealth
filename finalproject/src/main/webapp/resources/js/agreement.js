function agreementcheck() {

	var count; // 체크박스 카운트 변수
	
	count = 0;
	var agreone = document.getElementById("agrone");
	var agretwo = document.getElementById("agrtwo");

	if (agreone.checked != true || agretwo.checked != true) {
		alert("이용 약관에 동의 하셔야 회원 가입이 가능 합니다.");
		return;
	}
	if (agreone.checked == true && agretwo.checked == true) {
		location.href = "/user/signup"

	}

}


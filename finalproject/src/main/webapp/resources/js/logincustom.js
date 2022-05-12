function signup_check() {
	var email = document.getElementById("email");
	var name = document.getElementById("name");
	var password = document.getElementById("password");
	var password_con = document.getElementById("password_con");
	var phone = document.getElementById("phone");
	var postcode = document.getElementById("postcode");

	
	if (email.value == "") {
		alert("아이디를 입력해주세요.");
		email.focus();
		return false;
	};
	
	if (name.value == "") {
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	};
	
	if (password.value == "") {
		alert("비밀번호를 입력해주세요.");
		password.focus();
		return false;
	};
	
	if (password_con.value == "") {
		alert("비밀번호 확인란을 입력해주세요.");
		password_con.focus();
		return false;
	};
	
	
	var pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/i;
	
	if (!pwdCheck.test(password.value)) {
		alert("비밀번호는 영문자+숫자를 조합하여 8~20자를 사용해야합니다. ");
		password.focus();
		return false;
	};
	
	if (password_con.value !== password.value) {
		alert("비밀번호가 일치하지 않습니다.");
		password_con.focus();
		return false;
	};
	
	
	if (phone.value == "") {
		alert("전화번호를 입력해주세요.");
		name.focus();
		return false;
	};
	
	var reg = /[0-9]+/g;

	if (!reg.test(phone.value)) {
		alert("전화번호는 숫자만 입력할 수 있습니다.");
		phone.focus();
		return false;
	};
	
	if (postcode == "") {
		alert("우편번호 찾기를 완료해주세요.");		
		return false;
	};
	alert("회원가입 완료 되셨어요. 환영합니다.")
	
	document.getElementById("formsubmit").submit();
};



    

function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                             
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        
                        
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("address").value = extraAddr;
                    
                    } else {
                        document.getElementById("address").value = '';
                    }
                    
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address2").focus();
                }
            }).open();
        }
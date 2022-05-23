function onSignIn(googleUser) {
	
	var profile = googleUser.getBasicProfile();
	var googleName = profile.getName();
	var googleEmail = profile.getEmail();
	var id_token = googleUser.getAuthResponse().id_token;
	//console.log("ID Token: " + id_token);
	
	
	if(googleEmail != null && googleName != null){
		sessionStorage.setItem("GEmail", googleEmail);
		sessionStorage.setItem("GName", googleName);	
	}
	
	$.ajax({
		url: '/checkEmail',
		data: {"m_mail" : googleEmail},
		type: 'post',
		dataType: 'json',
		success: function(data) {
			if(data == 1) {
				$('#id').val(googleEmail);
			}else if(data == 0){
				location.href = "/agreement";
			}
		}
	});	
}


    
    function kakaoLogin(){
    	window.Kakao.Auth.login({
    		scope:'account_email',
    		success: function(authObj){    			
    			window.Kakao.API.request({
    				url:'/v2/user/me',
    				success: res => {
    					const kakao_account = res.kakao_account;
    					var kakaoEmail = kakao_account.email;
    					sessionStorage.setItem("KEmail", kakaoEmail);
    					sessionStorage.setItem("KEmailCon", kakaoEmail);	
    				}
    				
    			});    				
    	kakaoEmail = sessionStorage.getItem("KEmailCon");
    	
    	$.ajax({
			url: '/checkEmail',
			data: {"m_mail" : kakaoEmail},
			type: 'post',
			dataType: 'json',
			success: function(data) {
				if(data == 1){
					$('#id').val(kakaoEmail);
									
				}
				else if(data == 0){
					location.href = '/agreement';
				}
			}
		});
    		}
    	});
}






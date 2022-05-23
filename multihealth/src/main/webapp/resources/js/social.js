function onSignIn(googleUser) {
	
	var profile = googleUser.getBasicProfile();
	var googleName = profile.getName();
	var googleEmail = profile.getEmail();
	var id_token = googleUser.getAuthResponse().id_token;
	//console.log("ID Token: " + id_token);
	
	$.ajax({
		url: '/checkEmail',
		data: {"m_mail" : googleEmail},
		type: 'post',
		dataType: 'json',
		success: function(data) {
			if(data == 1) {
				$('#id').val(googleEmail);
			}else if(data == 0){
				var GmailResult = confirm("구글계정과 연동된 계정이 없습니다. 회원가입 하시겠습니까?");
				if(GmailResult == true){					
						localStorage.setItem("GEmail", googleEmail);
						localStorage.setItem("GName", googleName);						
						location.href = "/agreement";
				}else{
					return false;
				}
				
				
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
	   					localStorage.setItem("KEmail", kakaoEmail);
	   					    						
				    	var kakaoEmail = localStorage.getItem("KEmail");
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
									var GmailResult = confirm("카카오계정과 연동된 계정이 없습니다. 회원가입 하시겠습니까?");
									if(GmailResult == true){					
										localStorage.setItem("KEmail", kakaoEmail);											
										location.href = "/agreement";					
									}else{
										$('#id').val(googleEmail);
										return false;				
									}
								}
							}
						});
    				}    				
    			});  	
    		}
    	});
}
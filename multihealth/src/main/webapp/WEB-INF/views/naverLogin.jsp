<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("tcXEacKMYpVdyCFaBEkX", "http://localhost:8081/user/naverLogin");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    var naverEmail = naver_id_login.getProfileData('email');
    var naverName = naver_id_login.getProfileData('name');

    localStorage.setItem("NEmail", naverEmail);
    localStorage.setItem("NName", naverName);
    
    
	$.ajax({
		url: '/checkEmail',
		data: {"m_mail" : naverEmail},
		type: 'post',
		dataType: 'json',
		success: function(data) {
			if(data == 1){
				$('#id').val(naverEmail);
			    self.close();								
			}
			else if(data == 0){
			    opener.document.location.href="/agreement";
			    self.close();
				
			}
		}
	});
    
}
</script>
</body>
</html>
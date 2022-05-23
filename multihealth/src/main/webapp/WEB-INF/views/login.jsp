<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kr">
<head> 
    <title>MultiHealth</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="1039717282029-kskuqfbnv495sos97a10ccrlk5fegaco.apps.googleusercontent.com">
	
	


    

    
<%@include file ="../views/include/sub_header.jsp" %> <!-- 공통헤더 삽입 -->
	
</head>

<body style="background-color:white">

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>


    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center text-dark">
            <h1 class="h1">Log In</h1>
           
        </div>
    </div>

    <!-- Start login or sighup -->

	<div class="container" style="margin-bottom: 255px">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body"
						style="height: 400px; padding: 55px 20px 0px 20px;">
						<h5 class="card-title text-center">Log In</h5>
						<br>
						<c:url value="j_spring_security_check" var="loginUrl" />
						<form class="form-signin" method="post" action="${loginUrl }">
							<c:if test="${param.error != null }">
								<p style="color: red;">${error_message }</p>
							</c:if>

							<div class="form-label-group">
								<input type="text" id="id" name="username" class="form-control"
									placeholder="id" required autofocus>
							</div>
							<br>
							<div class="form-label-group" style="margin-bottom: 30px">
								<input type="password" id="pwd" name="password"
									class="form-control" placeholder="Password" required>
							</div>
							<div>
								<button style="margin-left: 60px"
									class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit">Log In</button>
								<button style="float: right; margin-right: 60px"
									class="btn btn-lg btn-secondary btn-block text-uppercase"
									onclick="location='/agreement'">Sign Up</button>
							</div>
							<br>

							<div style="text-align: center;">
								<span class="text-success">PT 서비스는 본 사이트의</span><br> <span
									class="text-success">회원님들에게 제공되고 있습니다.</span>
							</div>
							<br>

						</form>
						<br>
						<br>
						<div class="container-fluid bg-white py-6" >
							<div class="col-md-8 m-auto text-center text-dark" style="text-align: center;">
								<div style="display: inline-block;" class="g-signin2" data-width="254" data-height="50" data-longtitle="true" data-onsuccess="onSignIn" data-theme="dark"></div>
								<br>
								<br>								
								<div style="display: inline-block;">
									<a href="javascript:kakaoLogin();"><img src="<%=request.getContextPath() %>/resources/img/kakao_login_large_narrow.png"/></a>
								</div>								
								<br>
								<br>
								<div style="display: inline-block;">
									<div id="naver_id_login"></div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
  
  


    <!-- End log in --> 

<%@include file ="../views/include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->

	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/logincustom.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/social.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


    <script type="text/javascript">
    window.Kakao.init("dcaf625769f18ac154f6ece14d82898e")
    </script>
    
<script type="text/javascript">
	var naver_id_login = new naver_id_login("tcXEacKMYpVdyCFaBEkX", "http://localhost:8081/user/naverLogin");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 4,55);
	naver_id_login.setDomain("YOUR_SERVICE_URL");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
	if(naver_id_login.is_callback == true){
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	function naverSignInCallback() {
	    var naverEmail = naver_id_login.getProfileData('email');
	    var naverName = naver_id_login.getProfileData('name');    
	    
		$.ajax({
			url: '/checkEmail',
			data: {"m_mail" : naverEmail},
			type: 'post',
			dataType: 'json',
			success: function(data) {
				if(data == 1){
					opener.document.getElementById('id').value(naverEmail);
				    self.close();								
				}
				else if(data == 0){
				    localStorage.setItem("NEmail", naverEmail);
				    localStorage.setItem("NName", naverName);
				    opener.document.location.href="/agreement";
				    self.close();
					
				}
			}
		});
	  
	}
	}
</script>

</body>
</html>
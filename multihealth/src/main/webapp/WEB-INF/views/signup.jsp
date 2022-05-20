<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <title>MultiHealth</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="1039717282029-kskuqfbnv495sos97a10ccrlk5fegaco.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>    	
    

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



 <script>
 function email_Check() {
	  var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  var email = $('#email').val(); 	   
	  
	  if(!emailReg.test($("#email").val())) {
		  // 0 : 이메일 길이 / 문자열 검사		  
		  $("#email_result").text("ex) user@health.com");
		  $('#email_result').css('color', 'red');
	  } else if(email == null) {
		  $('#email_result').text('이메일을 입력해주세요.');
		  $('#email_result').css('color', 'red');
		}
	  
		$.ajax({
			url: '/checkEmail',
			data: {"m_mail" : $("#email").val()},
			type: 'post',
			dataType: 'json',
			success: function(data) {
				if(data == 1) {
					$("#email_result").text("사용중인 이메일 입니다.");					
					$("#email_result").css("color", "red");
				} else if(data == 0 && emailReg.test($("#email").val())) {
					$("#email_result").text("사용 가능한 이메일 입니다.");
					$("#email_result").css("color", "blue");
				}
			}
		});	
}

window.onload = function loadingSocial(){
	  var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  var email = $('#email').val(); 
	var GName = sessionStorage.getItem("GName");
	var GEmail = sessionStorage.getItem("GEmail");
	var KEmail = sessionStorage.getItem("KEmail");
	
	
	
	if(GName != null){
		document.getElementById('name').value = GName;
	}else if(KEmail != null){
		document.getElementById('name').value = "";
	}
	
	if(GEmail != null){
		document.getElementById('email').value = GEmail;
	}
	if(KEmail != null){
		document.getElementById('email').value = KEmail;
	}
	
	
	$.ajax({
		url: '/checkEmail',
		data: {"m_mail" : $("#email").val()},
		type: 'post',
		dataType: 'json',
		success: function(data) {
			if(data == 1) {
				$("#email_result").text("사용중인 이메일 입니다.");					
				$("#email_result").css("color", "red");
			} else if(data == 0 && emailReg.test($("#email").val())) {
				$("#email_result").text("사용 가능한 이메일 입니다.");
				$("#email_result").css("color", "blue");
			}
		}
	});
}
</script>

</head>

	<script src="<%=request.getContextPath() %>/resources/js/logincustom.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/social.js"></script>

    <!-- End Script -->


<body style="background-color:white;">

<%@include file ="../views/include/header.jsp" %> <!-- 공통헤더 삽입 -->

 
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
            <h1 class="h1">Sign Up</h1>
            <p>
               etc
            </p>
        </div>
    </div>

    <!-- Start Sign Up -->
    <div class="container py-5 text-dark">
        <div class="row py-5">
            <form class="col-md-9 m-auto" role="form" action="/user/signup" method="post" id="formsubmit">
                <div class="row">
                    <div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">                    
                        <label for="inputemail">이메일</label>
                        <input type="email" class="form-control mt-1" id="email" name="m_mail" placeholder="이메일을 입력해주세요"  onkeyup = "email_Check()" >
                        
                        <span id="email_result"></span>
                        <span text="${valid_m_mail}"></span>                        
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">이름</label>
                        <input type="name" class="form-control mt-1" id="name" name="m_name" placeholder="이름" maxlength="20">                        
                        <span text="${valid_m_name}"></span>
                    </div>
                    <div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">
                        <label for="inputpassword">비밀번호</label>
                        <input type="password" class="form-control mt-1" id="password" name="m_pw" placeholder="8자 이상 20자 이내" maxlength="20">                        
                        
                        <span text="${valid_m_pw}"></span>
                    </div>                    
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputpasswordcon">비밀번호 확인</label>
                        <input type="password" class="form-control mt-1" id="password_con" placeholder="비밀번호 확인">                        
                    </div>
                    
                </div>
                <div>
                    <input type="hidden" name="isAccountNonExpired" value="true">
                    <input type="hidden" name="isAccountNonLocked" value="true">
                    <input type="hidden" name="isCredentialsNonExpired" value="true">
                    <input type="hidden" name="isEnabled" value="true">
                </div>

                <div class="mb-3" style="padding-bottom: 30px;">
                    <label for="inputtext">전화 번호</label>
                    <input type="text" class="form-control mt-1" id="phone" name="m_hp" placeholder="ex:01012345678" maxlength="11">                    
                </div>               
                
                 

                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label id="zip_num">우편번호</label>                        
                    </div>                    
                    <div class="row">
                        <div class="col-sm-4" style="padding-bottom: 30px;">
                        <input type="text" id="postcode" placeholder="우편번호"  name="m_post" class="form-control">                        
                        </div>
                        <div class="col-sm-3">
                        <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">                  
                        </div>
                    </div>
                </div>   
                
                <div class="row" style="margin-top: 15px"><!--  -->
                    <div class="form-group col-md-6 mb-3">
                     <div class="col-sm-3 control-label">
                     <label id="address1">주소</label>
                    </div>
                    <div class="col-sm-12">
                        <input type="text" id="address" name="m_add1" class="form-control">                        
                    </div>   
                   </div>
              
                   <div class="form-group col-md-6 mb-3">
                    <div class="col-sm-3 control-label">
                        <label id="address1">상세주소</label>
                    </div>
                    <div class="col-sm-12"> 
                        <input type="text" id="address2" placeholder="상세주소" name="m_add2" class="form-control" maxlength="50">
                    </div>
                  </div>
                </div>

                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-primary btn-lg px-3" onclick="signup_check();">가입</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Sign Up -->

    
    
<%@include file ="../views/include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->

</body>
</html>
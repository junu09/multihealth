<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <title>MultiHealth</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


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
			url: '<%=request.getContextPath() %>/checkEmail',
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


$("#update").on("click",function(e){ 

self.location ="/user/update"; 
});

</script>


</head>

	<script src="<%=request.getContextPath() %>/resources/js/logincustom.js"></script>

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
            <h1 class="h1">My Information</h1>
            <p>
               Check Your MemberShip Information
            </p>
        </div>
    </div>
    

    <!-- Start Sign Up -->
    <!-- Start Sign Up -->
    <section>
    <div class="container py-5 text-dark">
        <div class="row py-5">
            <form class="col-md-9 m-auto" method="post" role="form" action="/user/signup" method="post" id="formsubmit">
                <div class="row">
                    <div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">
                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
                        <label for="inputemail">이메일</label>
                        <input type="email" class="form-control mt-1" id="email" name="m_mail" value="${user.username }" readonly="readonly">
                        <span id="email_result"></span>
                                                
                    </div>
                    <div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">
                        <label for="inputname">이름</label>
                        <input type="name" class="form-control mt-1" id="name" name="m_name" value="${user.m_name }" maxlength="20" readonly="readonly">
                        
                    </div>                   


                <div class="mb-3" style="padding-bottom: 30px;">
                    <label for="inputtext">전화 번호</label>
                    <input type="text" class="form-control mt-1" id="phone" name="m_hp" value="${user.m_hp }" maxlength="11" readonly="readonly">
                    
                </div>               
                
                 

                <div class="form-group col-md-6 mb-3">
                    <div class="col-sm-3 control-label">
                        <label id="zip_num">우편번호</label>                        
                    </div>                    
                    <div class="row">
                        <div class="col-sm-12" style="padding-bottom: 30px;">
                        <input type="text" id="postcode" placeholder="우편번호"  name="m_post" value="${user.m_post }" class="form-control" readonly="readonly">
                        </div>                        
                    </div>
                </div>

							
								<div class="form-group col-md-12 mb-3">
									<div class="col-sm-4 control-label">
										<label id="address1">주소</label>
									</div>
									<div class="col-sm-12">
										<input type="text" id="address" name="m_add1" value="${user.m_add1 }" class="form-control" readonly="readonly">
									</div>
								</div>
							
							
								<div class="form-group col-md-12 mb-3">
									<div class="col-sm-4 control-label">
										<label id="address2">상세주소</label>
									</div>
									<div class="col-sm-12">
										<input type="text" id="address2" placeholder="상세주소" name="m_add2" value="${user.m_add2 }" class="form-control" maxlength="50" readonly="readonly">
									</div>
								</div>
							

							<div class="row">
			                    <div class="col mt-2">
									<sec:authorize access="hasAuthority('USER')"><button type="button" id="leave" onclick="location.href='/user/leave'" class="btn btn-dark btn-lg px-3">회원탈퇴</button></sec:authorize>
								</div>
								<div class="col text-end mt-2">
									<sec:authorize access="hasAuthority('ADMIN') or hasAuthority('USER')"><button type="button" id="update" onclick="location.href='/user/info/infoupdate'"class="btn btn-dark btn-lg px-3">수정</button></sec:authorize>
								</div>
							</div>
						</form>
        
    
    			</section>    
    <!-- End Sign Up --> 
    <!-- End Sign Up -->

<%@include file ="../views/include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->

</body>
</html>
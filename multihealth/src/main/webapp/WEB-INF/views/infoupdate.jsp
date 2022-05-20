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
<script type="text/javascript">

function update_check() {
	if (password_change.value == password_con) {
		alert("비밀번호 확인란을 입력해주세요.");
		password_con.focus();
		return false;
	};
}



function infoupdate (){
    let data ={
    	"m_mail":$("#email").val(),
    	"m_name":$("#name").val(),
        "old_pw":$("#password").val(), //구 비번
        "m_pw":$("#password_change").val(), //신 비번           
        "m_hp":$("#phone").val(),
        "m_post":$("#postcode").val(),
        "m_add1":$("#address").val(),
        "m_add2":$("#address2").val()        
    }
    

    $.ajax({
        type:"POST",
        url:"/user/info/infoupdate/result",
        data:JSON.stringify(data), //object -> json
        contentType:"application/json; charset=utf-8",
        dataType:"json",
        success: function(data) {
			if (data == true) {
				alert("정보 변경 완료");
				history.back();
			} else {
				alert("정보 변경 실패");
			}
		},
		error: function() {
			alert("정보 변경 실패");
		}
        
    }); //ajax통신으로 데이터를 json으로 변경 후 insert
    

}



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
               etc
            </p>
        </div>
    </div>
    

    <!-- Start Sign Up -->
    <div class="container py-5 text-dark">
    <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
	</sec:authorize>
        <div class="row py-5">
            <form class="col-md-9 m-auto" role="form" action="/user/info/infoupdate/result" method="post">
                <div class="row">
                    <div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">
                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
                        <label for="inputemail" >이메일</label>
                        <input type="email" class="form-control mt-1" id="email" name="m_mail" value="${user.username }" readonly="readonly">
                        <span id="email_result"></span>
                    </div>
                    <div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">
                        <label for="inputname">이름</label>
                        <input type="name" class="form-control mt-1" id="name" name="m_name" value="${user.m_name }" maxlength="20" readonly="readonly">
                        
                    </div>
                    <div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">
                        <label for="inputpassword">기존 비밀번호</label>
                        <input type="password" class="form-control mt-1" id="password" name="m_pw" placeholder="8자 이상 20자 이내" maxlength="20">                        
                     </div>                    
                </div>
				<div class="row">
					<div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">
						<label for="inputpasswordcon">신규 비밀번호</label> <input
							type="password" class="form-control mt-1" id="password_change" name="m_pw">
					</div>
				</div>
				<div class="form-group col-md-6 mb-3" style="padding-bottom: 30px;">
                    <label for="inputpasswordcon">신규 비밀번호 확인</label>
                    <input type="password" class="form-control mt-1" id="password_con" onfocusout="update_check()" placeholder="비밀번호 확인">                        
                </div>

				<div>
                    <input type="hidden" name="isAccountNonExpired" id="isAccountNonExpired" value="true">
                    <input type="hidden" name="isAccountNonLocked" id="isAccountNonLocked" value="true">
                    <input type="hidden" name="isCredentialsNonExpired" id="isCredentialsNonExpired" value="true">
                    <input type="hidden" name="isEnabled" id="isEnabled" value="true">
                </div>

                <div class="mb-3" style="padding-bottom: 30px;">
                    <label for="inputtext">전화 번호 변경</label>
                    <input type="text" class="form-control mt-1" id="phone" name="m_hp" value="${user.m_hp }" maxlength="11">
                    
                </div>               
                
                 

                <div class="form-group">
                    <div class="col-sm-2 control-label">
                        <label id="zip_num">우편번호</label>                        
                    </div>                    
                    <div class="row">
                        <div class="col-sm-4" style="padding-bottom: 30px;">
                        <input type="text" id="postcode" placeholder="우편번호"  name="m_post" value="${user.m_post }" class="form-control">

                        </div>
                        <div class="col-sm-3">
                        <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">                  
                        </div>
                    </div>
                </div>   
                
                <div class="row" style="margin-top: 15px">
                    <div class="form-group col-md-6 mb-3">
                     <div class="col-sm-3 control-label">
                     <label id="address1">주소</label>
                    </div>
                    <div class="col-sm-12">
                        <input type="text" id="address" name="m_add1" value="${user.m_add1 }" class="form-control">
                        
                    </div>   
                   </div>
              
                   <div class="form-group col-md-6 mb-3">
                    <div class="col-sm-3 control-label">
                        <label id="address1">상세주소</label>
                    </div>
                    <div class="col-sm-12"> 
                        <input type="text" id="address2" placeholder="상세주소" name="m_add2" value="${user.m_add2 }" class="form-control" maxlength="50">
                    </div>
                  </div>
                </div>

				<div class="row">
					<div class="col text-end mt-2">
                        <button type="button" class="btn btn-primary btn-lg px-3" onclick="infoupdate();">변경</button>                        
                    </div>
                   

				</div>
			</form>
        </div>
    </div>
    <!-- End Sign Up -->

<%@include file ="../views/include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->


</body>
</html>
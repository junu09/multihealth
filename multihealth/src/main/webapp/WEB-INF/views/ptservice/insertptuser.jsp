<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to PT Service</title>
<head> 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ptservice.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@include file ="../include/sub_header.jsp" %> <!-- 공통헤더 삽입 -->
    <div class="container py-5">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                            	<div style="margin-top:27%;"></div>                
                            	<img src="<%=request.getContextPath() %>/resources/images/pt_info.png" width="700">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">         
                                        <p>PT Information</p>
                                    </div>
                                        <div>
                                        <form action="insertptuser" method="post" enctype="multipart/form-data" onsubmit="return Submitcheck();" >
                                        	<p class="ptinfortext">프로필 사진</p>                                                                  
                                            <input type=file name="pu_imgfile" id="pu_imgfile" class="form-control form-control-user">                                                     
                                            <br>
                                            <p class="ptinfortext">생년월일<span id="pu_birthday_check" class="ptinfo_check"></span></p>
		                                        <input class="form-control form-control-user" id="pu_birthday" type="text"      
				                                		name="pu_birthday"
				                                       	maxlength="8"                                         
				                                       	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
				                               	placeholder=" [필수사항] 생년월일 ex)20220514">								                
                                            <br>
                                        	<p class="ptinfortext">몸무게 [kg]<span id="pt_kg_check" class="ptinfo_check"></span></p>
                                        	<span></span>                     
                                            <input type="text" id="pu_kg" class="form-control form-control-user"             
                                                name="pu_kg"                                           
                                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                placeholder="[필수사항] 몸무게를 입력하세요">
                                            <br>
                                            <p class="ptinfortext">키 [cm]<span id="pt_cm_check" class="ptinfo_check"></span></p>   
                                            <input type="text" id="pu_cm" class="form-control form-control-user"
                                                name="pu_cm"
                                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                placeholder="[필수사항] 키를 입력하세요">
                                            <br>
                                            <p class="ptinfortext">목표 운동 횟수 [한달 기준]</p>   
                                            <input type="text" id="pu_target" class="form-control form-control-user"
                                                name="pu_target"
                                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                placeholder="한달에 목표 운동횟수 숫자로 입력하세요">
                                            <br>                         
                                        <input type="submit" class="btn btn-dark" id="insertptuser" value="start">
                                       </form>
                                     </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file ="../include/footerjsx.jsp" %> 
<script type="text/javascript">
  function Submitcheck() {
	var ip1 = document.getElementById( 'pu_birthday' ).value; 
    var ip2 = document.getElementById( 'pu_kg' ).value;
    var ip3 = document.getElementById( 'pu_cm' ).value;
    var ip4 = document.getElementById( 'pu_target' ).value;
      
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    var day = today.getDate();
    var format = (year+""+(("00"+month.toString()).slice(-2))+""+(("00"+day.toString()).slice(-2)))*1;  
    if(ip1=="" || ip1>format || ip2=="" || ip3==""){
    	if(ip1==""){
    		document.getElementById("pu_birthday_check").innerHTML ="생년월일을 입력하세요";
    	}else if(ip1>format){
    		document.getElementById("pu_birthday_check").innerHTML ="잘못된 생년월일 입니다";	
    	}else{
    		document.getElementById("pu_birthday_check").innerHTML ="";	
    	}
    	if(ip2==""){
    		document.getElementById("pt_kg_check").innerHTML ="몸무게를 입력하세요";		
    	}else{
    		document.getElementById("pt_kg_check").innerHTML ="";	
    	}
    	if(ip3==""){
    		document.getElementById("pt_cm_check").innerHTML ="키를 입력하세요";	
    	}else{
    		document.getElementById("pt_cm_check").innerHTML ="";	
    	}
    	return false;
    	
    }else if(ip4==""){
    	document.getElementById( 'pu_target' ).value = 0;
    	
    }else{
    	return true;
    }
  }
 </script>
</body>

</html>
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
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@include file ="../include/header.jsp" %> <!-- 공통헤더 삽입 -->
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">                
                            	<img src="<%=request.getContextPath() %>/resources/images/pt_info.png" width="700">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">         
                                        <p>PT Information</p>
                                    </div>
                                        <div>
                                        <form action="insertptuser" method="post" onsubmit="return Submitcheck();" >
                                        	<p>몸무게 [kg]</p>                     
                                            <input type="text" id="pu_kg" class="form-control form-control-user"             
                                                name="pu_kg"                                           
                                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                placeholder="몸무게를 입력하세요">
                                            <br>
                                            <p>키 [cm]</p>   
                                            <input type="text" id="pu_cm" class="form-control form-control-user"
                                                name="pu_cm"
                                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                placeholder="키를 입력하세요">
                                            <br>
                                            <p>목표 운동 횟수 [한달 기준]</p>   
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
<script src="<%=request.getContextPath() %>/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  function Submitcheck() {
    var ip1 = document.getElementById( 'pu_kg' ).value;
    var ip2 = document.getElementById( 'pu_cm' ).value;
    var ip3 = document.getElementById( 'pu_target' ).value;
    if(ip1==""){
    	alert( "몸무게를 입력하세요" );	
    	return false;
    }
    if(ip2==""){
    	alert( "키를 입력하세요" );	
    	return false;
    }
    if(ip3==""){
    	alert( "목표횟수 를 입력하세요" );	
    	return false;
    }
  }
 </script>
</body>

</html>
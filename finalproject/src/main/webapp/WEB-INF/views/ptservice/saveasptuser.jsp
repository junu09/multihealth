<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save as PT User</title>
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
 <%@include file ="../include/header.jsp" %> <!-- 공통헤더 삽입 -->
	<div class="container py-5">
        <div class="row">
            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="ptmain">
                            PT Routine
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="exerciselist">
                            Make Routine
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="ptroutinelist">
                            Routine List
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="specialpt">
                            Special PT
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-9">
                <div class="row">
                	<div class="col-md-5">
                    </div>
                    <div class="col-md-4">
                        <ul class="list-inline pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3 main_hover">PT 정보 수정</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-2">
                    </div>
                    <div class="col-md-7">
                    	<form action="saveasptuser" method="post" onsubmit="return Submitcheck();">
						  <div class="form-group">
						    <label>몸무게 [kg]</label>
						    <input type="text" class="form-control" id="pu_kg"  name="pu_kg" placeholder="몸무게를 입력하세요"
						    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						  </div>
						  <div class="mb-3 product-wap rounded-0"></div>
						  <div class="form-group">
						    <label>키 [cm]</label>
						    <input type="text" class="form-control" id="pu_cm" name="pu_cm" placeholder="키를 입력하세요"
						    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						  </div>
						  <div class="mb-3 product-wap rounded-0"></div>
						  <div class="form-group">
						    <label>목표 운동 횟수 [한달 기준]</label>
						    <input type="text" class="form-control" id="pu_target" name="pu_target" placeholder="한달에 목표 운동횟수 숫자로 입력하세요"
						    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						  </div>
						  <br><br>
						  <input type="submit" id = "saveasptuser" value="수정하기" class="btn btn-dark">
						</form>
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
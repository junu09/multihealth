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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ptservice.css">
</head>
<body>
 <%@include file ="../include/sub_header.jsp" %> <!-- 공통헤더 삽입 -->
	<div class="container py-5">
        <div class="row">
            <div class="col-lg-3 leftlayout">
			  	<div class="row">
		                <h1 class="h2 pb-4">PT SERVICE</h1>
		                <ul class="list-unstyled templatemo-accordion">
		                    <li class="pb-3">
		                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="ptmain">
		                            PT Routine
		                        <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
		                        </a>
		                    </li>
		                    <li class="pb-3">
		                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="exerciselist">
		                            Make Routine
		                            <img src="<%=request.getContextPath()%>/resources/images/check_circle_gray.png" width="28px" height="28px">
		                        </a>
		                    </li>
		                    <li class="pb-3">
		                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="ptroutinelist">
		                            Routine List
		                             <img src="<%=request.getContextPath()%>/resources/images/check_circle_gray.png" width="28px" height="28px">
		                        </a>
		                    </li>
		                    <li class="pb-3">
		                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="specialpt">
		                            Special PT
		                             <img src="<%=request.getContextPath()%>/resources/images/check_circle_gray.png" width="28px" height="28px">
		                        </a>
		                    </li>
		                </ul>
			   </div>
		     </div>
            <div class="col-lg-9">
                <div class="row">
                	<div class="col-md-5">
                    </div>
                    <div class="col-md-4">
                        <ul class="list-inline pb-3 pt-1">
                            <li class="list-inline-item saveasptuser_title">
                                <a class="h3 text-dark text-decoration-none mr-3 main_hover">PT 정보 수정</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-2">
                    </div>
                    <div class="col-md-7">
                    	<form action="saveasptuser" method="post" enctype="multipart/form-data" onsubmit="return Submitcheck();">
						  <div  class="form-group ptinfortext2">
						  	<label>프로필 사진</label>
						    <input type=file name="pu_imgfile" id="pu_imgfile" class="form-control form-control-user"> 
						  </div>
						  <div class="form-group ptinfortext">
						    <label>몸무게 [kg]</label>
						    <input type="text" class="form-control" id="pu_kg"  name="pu_kg" placeholder="${pt_user.pu_kg}kg "
						    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						  </div>
						  <div class="mb-3 product-wap rounded-0"></div>
						  <div class="form-group ptinfortext">
						    <label>키 [cm]</label>
						    <input type="text" class="form-control" id="pu_cm" name="pu_cm" placeholder="${pt_user.pu_cm}cm"
						    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						  </div>
						  <div class="mb-3 product-wap rounded-0"></div>
						  <div class="form-group ptinfortext">
						    <label>목표 운동 횟수 [한달 기준]</label>
						    <input type="text" class="form-control" id="pu_target" name="pu_target" placeholder="${pt_user.pu_target}회"
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
    
    if(ip1==""|| ip2=="" || ip3==""){
    	if(ip1==""){
    		document.getElementById( 'pu_kg' ).value = ${pt_user.pu_kg};
    	}
    	if(ip2==""){
    		document.getElementById( 'pu_cm' ).value = ${pt_user.pu_cm};	
    	}
    	if(ip3==""){
    		document.getElementById( 'pu_target' ).value = ${pt_user.pu_target};		
    	}
    }
  return true;
  }
 </script>
</body>
</html>
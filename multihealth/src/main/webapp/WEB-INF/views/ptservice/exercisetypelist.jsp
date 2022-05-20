<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Your Routine</title>
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ptservice.css">
</head>
<body>
 <%@include file ="../include/header.jsp" %>
  <!-- 공통헤더 삽입 -->
 
	<div class="container py-5">
        <div class="row">
		     <div class="col-lg-3 leftlayout">
			  	<div class="row">
		        	<h1 class="h2 pb-4">PT SERVICE</h1>
		                <ul class="list-unstyled templatemo-accordion">
		                    <li class="pb-3">
		                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="ptmain">
		                            PT Routine
		                        <img src="<%=request.getContextPath()%>/resources/images/check_circle_gray.png" width="28px" height="28px">
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
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                        	<li class="list-inline-item">
                        		<img src="<%=request.getContextPath()%>/resources/images/run.gif" width="30px" height="30px">
                        	</li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3 category" id="c1">맨몸 운동</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none category"id="c2">바벨/덤벨/기구</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-12" id="picklist">	
                	</div>
                	<c:forEach items="${exercisetypelist}" var="dto" >                	
		                	<c:if test="${dto.ec_num eq 1}">
			                	<c:set var="category" value="category1"/>
		                	</c:if>
		                	<c:if test="${dto.ec_num eq 2}">
			                	<c:set var="category" value="category2"/>
		                	</c:if>
			                  <div class="col-md-4 pttypelist ${category}">
		                        <div class="card mb-4 product-wap rounded-0">
		                            <div class="card rounded-0">
		                                <img class="card-img rounded-0 img-fluid" src="<%=request.getContextPath() %>/resources/images/${dto.et_img1}.jpg">
		                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
		                                    <div class="click" id="${dto.et_ename}">
			                                    <ul class="list-unstyled">                              
			                                        <li><a class="btn btn-dark text-white mt-2"><i class="fas fa-cart-plus"></i></a></li>
			                                    </ul>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="card-body click" id="${dto.et_ename}">
		                                <a href="#" class="h3 text-decoration-none">${dto.et_name}</a><a class="exercise_part">[${dto.et_part}]</a>
		                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
		                                    <li><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${dto.et_met*user_kg*dto.et_time/60}"/>kcal</li>		                              
		                                    <li>${dto.et_time} 분</li>
		                                </ul>
		                                <ul class="list-unstyled d-flex justify-content-center mb-1">
		                                    <li>
		                                       	<i class="text-warning fa fa-star"></i>LV.${dto.et_lv}                     
		                                    </li>
		                                </ul>		         
		                            </div>
		                        </div>
		                    </div>
                    </c:forEach>
                                        
                 </div>        
            </div>
        </div>
    </div>
 <%@include file ="../include/footerjsx.jsp" %> 
<script src="<%=request.getContextPath() %>/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var pick = {};
	$(document).on("click", ".deletept", function() {
		var delete_pt = $(this).attr("id");
		delete_pt= (delete_pt.split("-"))[1];
		delete pick[delete_pt];
		if(Object.keys(pick).length!=0){  
			updateData();		
		}else{
			 $("#picklist").html("");
		}
		alert("운동이 목록에서 삭제되었습니다.");
	});
	$(document).on("click", ".click", function(){
			pick_pt = $(this).attr("id");
		if(!pick[pick_pt]){
			pick[pick_pt]=1;}
		else{
			pick[pick_pt]+=1;
		}
			updateData(); 
	});
	$(".pttypelist").hide();
	$(".category1").show();
	$(document).on("click", ".category", function category(){
		$(".pttypelist").hide();
 		var c_num = $(this).attr("id")[1];
		$(".category"+c_num).show();
	});
	function updateData(){
		$.ajax({
			url:'<%=request.getContextPath() %>/ptservice/exerciselist',
			data : pick, 
			type : 'post',
			dataType: 'json',
			success : function(list){
				var add_time = 0;
				var add_kcal = 0;
				var table = "<form action='../ptservice/picklist' method='post'>"
				+"<div class='form-group'>"
				+	"<input type='text' class='form-control' id='pr_info' name='pr_info' placeholder='등록하고자 하는 루틴이름 입력하세요'>"
				+"</div>"
				+"<table class='type06'><tr class='even'><th></th><th>운동명</th><th>운동 부위</th><th>횟수</th><th>소모칼로리</th><th>소요시간</th><th>삭제</th></tr>"
				for(var i = 0; i < list.length; i++){
					add_time += list[i].et_time * pick[list[i].et_ename];
					add_kcal += Math.round(list[i].et_met * list[i].et_time * ${user_kg} * pick[list[i].et_ename]*0.017);
					kcal = Math.round(list[i].et_met * list[i].et_time*${user_kg} * pick[list[i].et_ename]/60);
					table +="<tr><td><img src='../resources/images/"+list[i].et_img2+".jpg' width='50'></td>"
					+ "<input type='hidden' name='et_name' value="+list[i].et_name+">"
					+ "<input type='hidden' name='et_ename' value="+list[i].et_ename+"><td>"+list[i].et_name+"</td>"
					+ "<td>"+list[i].et_part+"</td>"
					+ "<input type='hidden' name='pr_count' value="+pick[list[i].et_ename]+"><td>"+pick[list[i].et_ename] + "</td>"
					+ "<td>"+kcal+ "kcal</td>"
					+ "<td>"+list[i].et_time * pick[list[i].et_ename]+"분</td><td><a class='deletept' id='d-"+list[i].et_ename+"'>삭제 <i class='bi bi-x-circle'></i></a></td>";
				}
				table +="</tr>"
					+"<input type='hidden' name='pr_allkcal' value="+add_kcal+"><tr><td></td><td></td><td></td><th>total</th><th>"+add_kcal+"kcal</th>"
					+"<input type='hidden' name='pr_alltime' value="+add_time+"><th>"+add_time+"분</th></tr></table>"
					+"<br><input type='submit' class='btn btn-dark' id='insertptroutine' value='루틴등록하기'></form><br>";
				$("#picklist").html(table);
			},
		error:function(request,status,error){
	        $("#picklist").html("");   
		}
		});//ajax end
	};
</script>
</body>
</html>
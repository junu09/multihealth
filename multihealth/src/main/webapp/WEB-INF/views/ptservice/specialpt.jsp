<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Special PT</title>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ptservice.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
 <%@include file ="../include/header.jsp" %> <!-- 공통헤더 삽입 -->
	<div class="container  py-5">
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
	                        	<i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
	                        </a>
	                    </li>
	                </ul>
		   		</div>
	    	</div>
            <div class="col-lg-9">
            	<div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                        	<li class="list-inline-item"><img src="<%=request.getContextPath()%>/resources/images/run.gif" width="30px" height="30px"></li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3 spcial_menu" id="c1">운동시작하기</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none spcial_menu"id="c2">랭킹확인하기</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="card mb-4 spcial_menuc" id="spcial_menuc1">
		        	<div class="card-header">
		            	<i class="bi bi-check-all"></i>
		            	<h3 class="chart_title">운동시작하기</h3>
		         	</div>
		         	<div class="card-body start_spcialpt">
			         	<div class="col-md-8">
	                    	<form action="specialpt" method="post" onsubmit="return Submitcheck();">
							  <div class="form-group">
							    <label class="spcialpt_label"><i class="bi bi-check2-circle"></i> 목표 스쿼트 횟수</label>
							    <input type="text" class="form-control" id="ptcount"  name="ptcount" placeholder="횟수를 입력하세요"
							    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							  </div>
							  <br>
							  <input type="submit" id = "saveasptuser" value="시작하기" class="btn btn-dark">
							</form>
	                    </div>
		         	</div>
        		</div>
        		<div class="card mb-4 spcial_menuc" id="spcial_menuc2">
		        	<div class="card-header">
		            	<i class="bi bi-award"></i>
		            	<h3 class="chart_title">TOP100 랭킹확인하기</h3>
		         	</div>
		         	<div class="card-body start_spcialpt">
		         	<div class="card-body">
			         	<c:if test="${page != 0}">
						<table class="table table-hover">
						  <thead>
						    <tr class="thead">
						      <th scope="col">등수</th>
						      <th scope="col">유저이미지</th>
						      <th scope="col">유저이름</th>
						      <th scope="col">1회당 소요시간</th>
						    </tr>
						  </thead>
						  <tbody id="workoutlist">
						  	<tr class="tbody">
						      <th scope="col">1</th>
						      <th scope="col"><i class="bi bi-award" style="font-size:30px; color:#FFD700;"></i><img src="<%=request.getContextPath()%>/upload2/user3.png" width="50px" height="50px"></th>
						      <th scope="col">유저이름</th>
						      <th scope="col">1회당 소요시간</th>
						    </tr>
						    <tr class="tbody">
						      <th scope="col">2</th>
						      <th scope="col"><i class="bi bi-award" style="font-size:30px; color:#FFD700;"></i>유저이미지</th>
						      <th scope="col">유저이름</th>
						      <th scope="col">1회당 소요시간</th>
						    </tr>
						    <tr class="tbody">
						      <th scope="col">등수</th>
						      <th scope="col">유저이미지</th>
						      <th scope="col">유저이름</th>
						      <th scope="col">1회당 소요시간</th>
						    </tr>
						  	<c:forEach items="${pagelist}" var="dto" >  
							    <tr class="tbody">
							      <td>${dto.pr_info}</td>
							      <td>${dto.workout_point} point</td>
							      <td>${dto.workout_time}</td>
							    </tr>
							</c:forEach>
						    </tbody>
							</table>
							</c:if>
							<c:if test="${page == 0}">
							<table class="table table-hover">
						  	<thead>
							    <tr class="thead">
							      <th scope="col">등수</th>
							      <th scope="col">등수</th>
							      <th scope="col">적립포인트</th>
							      <th scope="col">운동일자</th>
							    </tr>
						  	</thead>
						  	<tbody id="workoutlist">  
							    <tr class="tbody">
							      <td colspan='3'>운동기록이 없습니다</td>
							    </tr>
						    </tbody>
							</table>
							</c:if>
				         	<div id="pageing"> 
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
$("#spcial_menuc1").show();
$("#spcial_menuc2").hide();
$(document).on("click", ".spcial_menu", function category(){
	$(".spcial_menuc").hide();
		var c_num = $(this).attr("id")[1];
	$("#spcial_menuc"+c_num).show();
});
  function Submitcheck() {
    var ip1 = document.getElementById( 'ptcount' ).value;
    if(ip1==""){
    	alert( "횟수를 입력하세요" );	
    	return false;
    }
  }
  
 //페이징처리 부분
 <%-- let pageing = document.getElementById('pageing');
let workoutlistnone = document.getElementById('workoutlistnone');
 if(${page}!=0){
	 let a = parseInt(${page}/5);
	 let b = parseInt(${page}%5);
	 let page_number = a;
	 if(b !=0){
		 page_number += 1;
	 }
	 page = "<ul class='pagination pagination_location'>";
 	 for (let i = 1; i <= page_number; i++){    
 			page += "<li class='page-item'><a class='page-link page-lint_style pagenumber'>"+i+"</a></li>";
		} 
 	page += "</ul>";
 	pageing.innerHTML = page; 
 }
 
 let workoutlist = document.getElementById( 'workoutlist' );
 $(document).on("click", ".pagenumber", function(){
		var page = $(this).text();
		$.ajax({
			url: '<%=request.getContextPath() %>/ptservice/ptmain',
			data : {'page':page} , 
			type : 'post' ,
			dataType: 'json',
			success : function(dto){ //MemberDTO 객체를 json  변환 객체로
				var newpage = "";
				for(var i = 0; i < dto.length; i++){
					newpage += "<tr class='tbody'>"
					+"<td>"+ dto[i].pr_info+"</td>"
					+"<td>"+dto[i].workout_point+"point</td>"
					+"<td>"+dto[i].workout_time+"</td></tr>"
					
				}
				workoutlist.innerHTML = newpage; 
			}
		});
 });  --%>
 </script>
</body>
</html>
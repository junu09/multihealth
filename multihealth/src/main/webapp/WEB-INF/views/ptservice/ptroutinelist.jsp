<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PT Routine</title>
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ptservice.css">
    
</head>
<body>
 <%@include file ="../include/header.jsp" %> <!-- 공통헤더 삽입 -->
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
		                        <img src="<%=request.getContextPath()%>/resources/images/check_circle_gray.png" width="28px" height="28px">
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
                                <a class="h3 text-dark text-decoration-none mr-3"><img src="<%=request.getContextPath()%>/resources/images/run.gif" width="30px" height="30px">Routine List</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-12" id="ptroutinelist">
                	</div>     
                 </div>        
            </div>
        </div>
    </div>
<%@include file ="../include/footerjsx.jsp" %> 
<script src="<%=request.getContextPath() %>/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var url = window.location.href;
	url = "ptservice/ptroutinelist?pt="+$(this).attr('id');
	updateData(); 
	$(document).on("click", ".delte", function(){
			var delete_rt = $(this).attr('id');
			delete_rt= (delete_rt.split("-"))[1];
			$.ajax({
				url: 'deletepr',
				data : {'delete_rt':delete_rt} , 
				type : 'post' ,
				dataType: 'json',
				success : function(){
					updateData();
				},error:function(request,status,error){
			        $("#ptroutinelist").html("");   
				}	
			});//ajax end
	});
	$(document).on("click", ".pt", function(){
		var url = "?pt="+$(this).attr('id');
	});
	function updateData(){
		$.ajax({
			url:'routinelist',
			type : 'post' ,
			dataType: 'json',
			success : function(list){ //ArrayList<MemberDTO> 객체를 json  변환 객체로
				var table = "<table class='table ptroutinlist'>"
				+"<tr><thead class='table-secondary2'><th>루틴명</th><th>소모 칼로리</th><th>소요 시간</th><th class='deletpt'style='padding-right:2%;'>삭제</th><th>Start PT</th></tr></thead><tbody>";
				if(list.length>0){
					for(var i = 0; i < list.length; i++){
						table +="<tr><td>" + list[i].pr_info + "</td><td>" 
						+ list[i].pr_allkcal + " kcal</td><td>"+ list[i].pr_alltime + " 분</td><td>"
						+"<a class='delte ptroutinelist_a' id=d-"+list[i].pr_num+" >삭제 <i class='bi bi-x-circle'></i></a></td><td>"
						+"<a class='pt ptroutinelist_a' id='p"+list[i].pr_num+"' href=startpt?pt=pt"+list[i].pr_num+">운동하러 가기 <i class='bi bi-arrow-right-circle'></i></a></td></tr>";
					}
				}else{table+="<tr><td></td><td style='text-align:right;'>저장된 루틴이 없습니다</td><td></td><td></td><td></td></tr>"}
				table +="</tbody></table>";
				$("#ptroutinelist").html(table);
			
			}//success end	
		});//ajax end
	}; 
});
</script>
</body>
</html>
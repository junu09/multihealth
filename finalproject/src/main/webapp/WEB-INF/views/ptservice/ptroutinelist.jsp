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
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3">Routine List</a>
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
				var table = "<table class='type06'>"
				+"<tr class='even'><th>루틴명</th><th>소모 칼로리</th><th>소요 시간</th><th></th><th></th></tr>";
				if(list.length>0){
					for(var i = 0; i < list.length; i++){
						table +="<tr><td>" + list[i].pr_info + "</td><td>" 
						+ list[i].pr_allkcal + " kcal</td><td>"+ list[i].pr_alltime + " 분</td><td>"
						+"<a class='delte' id=d-"+list[i].pr_num+" >삭제</a></td><td>"
						+"<a class='pt' id='p"+list[i].pr_num+"' href=startpt?pt=pt"+list[i].pr_num+">운동하러 가기</a></td></tr>";
					}
				}else{table+="<tr><td conspaln='5'>저장된 루틴이 없습니다</td></tr>"}
				table +="</table>";
				$("#ptroutinelist").html(table);
			
			}//success end	
		});//ajax end
	}; 
});
</script>
</body>
</html>
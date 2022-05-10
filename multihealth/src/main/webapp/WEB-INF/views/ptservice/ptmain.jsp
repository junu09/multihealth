<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PT Main</title>
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
                        <ul class="list-inline pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3 main_hover" href="saveasptuser">PT 정보 수정하기 ></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                  <div class="col-md-5">
                          <div class="card">
                                <img src="<%=request.getContextPath()%>/resources/images/pu_img.jpg">
                            </div>
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card-body">
                                <p class="h3 text-decoration-none">${m_user} 님</p>
                                <p class=" mb-0">${pt_user.pu_cm}cm, ${pt_user.pu_kg}kg</p>
                                <p class=" mb-0">${pt_user.pu_point}point</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card-body">
                                <div class="w-100 list-unstyled d-flex justify-content-between">
                                    <h3><i class="fa fa-fw fa-chevron-circle-down mt-1"></i> 이번달 운동 체크</h3>
                                </div>
                                <div class="card border-left-info py-2">
									 <div class='rap'>
									    <div class="header">
									      <h4 class='dateTitle'></h4>
									    </div>
									    <div class="grid dateHead">
									      <div>일</div>
									      <div>월</div>
									      <div>화</div>
									      <div>수</div>
									      <div>목</div>
									      <div>금</div>
									      <div>토</div>
									    </div>
									    <div class="grid dateBoard"></div>
									  </div>
			                  	</div>
                            </div>
                            <div class="mb-4 product-wap rounded-0"></div>
                        </div>            
                    </div>
                    <div class="col-md-12">
                    	<div class="card mb-4 product-wap rounded-0 ">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">한달 운동목표 ${pt_user.pu_target}회 달성률
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${percent}%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar" style="width:${percent}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
if (self.name != 'reload') {
    self.name = 'reload';
    self.location.reload(true);
}
else self.name = '';

var add_day = ${add_day};
const date = new Date();
function dateFormat(){
	return date.toLocaleDateString().replace(/\./g, "").split(" ");
	}
//현재의 연도와 월 받아오기
const [nowYear, nowMonth] = dateFormat(date);

//지난달의 마지막 요일
const prevDay = new Date(nowYear, nowMonth - 1, 0).getDay();

//이번달의 마지막 날 구하기
const lastDay = new Date(nowYear, nowMonth, 0).getDate();

let day = '';

//전달 날짜 표시하기
for (let i = 0; i < prevDay; i++) {
	day += "<div class='noColor'></div>";
}

//현재 달 날짜 표시하기
if(!add_day){
	for (let i = 1; i <= lastDay; i++){    
		day += "<div>"+i+"</div>";
	}
}else{
	for (let i = 0; i < lastDay; i++) {
		if(add_day.includes(i)){
		day += "<div class='check'>"+i+"</div>";
		}else{day +="<div>"+i+"</div>"}
	}
}

//지금까지 추가한 날짜 박스 길이
const maxDay = prevDay + lastDay;
  
// 마지막날이 들어있는 열에 남은 박스 채우기
const nextDay = (Math.ceil(maxDay / 7) * 7) - maxDay;

// 다음달 날짜 박스
for (let i = 0; i < nextDay; i++) {
		day += "<div class='noColor'></div>";
}

//날짜 박스 표시하기
$(".dateBoard").html(day);  

// 현재 날짜 정보 표시하기
$(".dateTitle").html(nowYear+"년"+" "+nowMonth+"월"); 
 </script>
 
 
</body>
</html>
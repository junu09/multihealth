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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<style>
/*모달 */
.modal_wrap {
    display: none;
    width: 100%;
    height: 100%;
    position: absolute;
    top:0;
    left:0;
    background:#fff;
    z-index: 2;
}
.modal_close {
    width: 26px;
    height: 26px;
    position: absolute;
    top: 5%;
    right: 5%;
}
.text{width:80%;margin:10% auto;}
.text input{width:50%; height:30px;}

.modal_close .closeImg {
    display: block;
    width: 100%;
    height: 100%;
}
.searchbtn{width:5%;background:black;}

@import url('https://fonts.googleapis.com/css2?family=Aldrich&display=swap');
* {margin:0; padding:0;}
ul li {list-style:none;}
.clearfix:after{content:'';display:block; clear:both;}
body {overflow-y:scroll; padding-top:150px;}
header {	
	background:linear-gradient(black 100px,rgba(33,41,51,0.7));
	height:100px;
	overflow:hidden;
	transition:height 0.4s;
	position: absolute;
	top:0;
	left:0;
	right:0;
	z-index: 1;
}
nav {text-align:center; margin:0 auto;font-family: 'Aldrich', sans-serif !important; font-size:17px !important;}
nav > ul > li {float:left; line-height:100px; width:12%; margin:0 auto; color:white;}
nav > ul > .side{float:left; width:26%;}
nav > ul > .logo img{margin-top:20px; width:150px;}
nav > ul > .logo #mobilebtn img{display:none;}
nav > ul > .icon img{width:22px;margin:0 10px;}
nav > ul > li > input{ position: fixed;left: -9999px;}
nav > ul > li ul{padding:0;}
nav > ul > li ul li{white-space:nowrap;line-height:50px;}
nav > ul > li ul li{white-space:nowrap;line-height:50px;}
nav > ul > li ul li a{text-decoration: none; color:#9c9c9c; text-decoration: none; background-repeat: no-repeat; background-size: 0% 100%; transition: background-size 0.5s;}
nav > ul > li ul li a:hover{color:#cfcfcf; background-size: 100% 100%; background-image: linear-gradient(transparent 30%, #777777 40%);}
@media ( max-width: 720px ) {
    body {padding-top:0px;}
 	header{position: static;} 
	nav{background:black;}
	nav > ul > .side {width:100%;}
	nav > ul > .logo img{float:left;margin-left:20px;}
	nav > ul > .logo #mobilebtn img{display:block; width:40px;float:right; margin:35px 20px 0 0 ;}
	nav > ul > li {width:100%; line-height:60px;}
	nav > ul > li > input[type="radio"]:checked ~ .submenu {display: block; background:rgba(33,41,51,0.7);}
	nav > ul > li > label{display:inline-block; width:100%;}
	nav > ul > li ul{display:none;}
}
</style>
   <link rel="apple-touch-icon" href="<%=request.getContextPath() %>/resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/img/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo.css">
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome.min.css">
    <!-- Load map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ptservice.css">
</head>
<body>
<header>
	<nav>
			<ul class="clearfix mainmenu">
			<li  class="side logo">			
				<a href="/"><img src="<%=request.getContextPath()%>/resources/img/logowhite.png"></a>
				<span id="mobilebtn"><img src="<%=request.getContextPath()%>/resources/img/menubar.png" width="50px"></span>
			</li>
				<li class="menutitle"><input type="radio" id="menuBtn1" name="menuBtn"><label for="menuBtn1">SHOP</label>
					    <ul class="submenu">
							<li><a href="/productlist">상품보기</a></li>
						</ul>
				</li>
				<li class="menutitle"><input type="radio" id="menuBtn2" name="menuBtn"><label for="menuBtn2">PT</label>
						<ul class="submenu">
							<li><a href="#">pt보기</a></li>
							<li><a href="#">2nd menu</a></li>
							<li><a href="#">2nd menu</a></li>
						</ul>
				</li>
				<li class="menutitle"><input type="radio" id="menuBtn3" name="menuBtn"><label for="menuBtn3">COMMUNITY</label>
						<ul class="submenu">
							<li><a href="#">REVIEW</a></li>
							<li><a href="#">2nd menu</a></li>
							<li><a href="#">2nd menu</a></li>
						</ul>
				</li>
				<li class="menutitle"><input type="radio" id="menuBtn4" name="menuBtn"><label for="menuBtn4">ADMIN</label>
						<ul class="submenu">
							<li><a href="#">2nd menu</a></li>
							<li><a href="#">2nd menu</a></li>
							<li><a href="#">2nd menu</a></li>
						</ul>
				</li>
				<li class="side icon">
					<a id="modal_btn" href="#"><img src="<%=request.getContextPath()%>/resources/img/shchicon.png"></a>
					<a href="#"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a>
					<a href="#"><img src="<%=request.getContextPath()%>/resources/img/cart.png"></a>
				</li>											
			</ul>
			
	</nav>	
</header>
<!-- Modal -->
<div class="modal_wrap">
    <div class="modal_close"><img src="<%=request.getContextPath()%>/resources/img/close.png"></div>
    <div class="text">
    <form name="" action="/" method="get">
       <input type="text">
    </form>
    </div>
</div>
<div class="container">
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
	 <div class="col-lg-9 rightlayout">
	 	<div class="row">
        	<div class="col-md-12">
            	<ul class="list-inline shop-top-menu pb-3 pt-1">
                	<li class="list-inline-item">
                    	<a class="h3 text-dark text-decoration-none mr-3">
                        	<img src="<%=request.getContextPath()%>/resources/images/run.gif" width="30px" height="30px">PT Routine
                    	</a>
                 	</li>
             	</ul>
        	</div>
        </div>
	 	<div class="row">
		 	<div class="col-xl-12 ptuser">
				<table>
					<tr>
						<td><img src="<%=request.getContextPath()%>/upload2/${pt_user.pu_img}" width="50px" height="50px"></td>
						<td><h1>${m_user}<span>님</span></h1><a href="saveasptuser">정보수정하기</a></td>
						<td><p>포인트</p><h2>${pt_user.pu_point}<span>p</span></h2></td>
						<td><p>한달목표횟수</p><h2>${pt_user.pu_target}<span>회</span></h2></td>
						<td><p>키</p><h2>${pt_user.pu_cm}<span>cm</span></h2></td>
						<td><p>몸무게</p><h2>${pt_user.pu_kg}<span>kg</span></h2></td>
					</tr>
				</table>
		 	</div>
		</div>
		<div class="row">
        	<div class="col-xl-6">
            	<div class="card mb-4">
               		<div class="card-header">
                    	<i class="bi bi-clipboard-data"></i>
                        <h3 class="chart_title">한달 목표 횟수 달성률</h3>
                    </div>
                    <div class="card-body areachartbody"><div id="areachart"></div></div>
                 </div>
             </div>
             <div class="col-xl-6">
             	<div class="card mb-4">
                	<div class="card-header">
                    	<i class="bi bi-calendar-check"></i>
                     	<h3 class="chart_title">이번달 운동 일자</h3>
                   	</div>
                	<div class="card-body">               		
		 				<table>
					 		<tr>
					 			<td class="date1">
									<div>
										<h4 class='dateTitle'></h4>
									</div>
								</td>
								<td class="date2">
								</td>
								<td class="date3">
									<div class="grid dateHead">
										<div>sun</div>
										<div>mon</div>
										<div>tue</div>
										<div>wed</div>
										<div>thu</div>
										<div>fri</div>
										<div>sat</div>
									</div>
									<div class="grid dateBoard"></div>
					 			</td>
				 			</tr>
		 				</table>
                	</div>
         		</div>
         	</div>
        </div>
        <div class="row">
        	<div class="col-xl-6">
            	<div class="card mb-4">
                	<div class="card-header">
                    	<i class="bi bi-clipboard-data"></i>
                       	<h3 class="chart_title">BMI(체질량)지수</h3>
                   	</div>
               		<div class="card-body bmi">	                                  		
	               		<div class="bmicontent" > 	           		
				 			<a class="btn btn-secondary  btn-icon-split">
                             	<span class="text bmitext">${m_user}님은 ${bmi}BMI 으로<br>"${bmidefine}" 입니다.</span>
                            </a>
				 		</div>
				 		<p class="bmititle"><i class="bi bi-check2-circle"></i> 만 ${pt_userage}세 남,녀 BMI(체질량)지수 %</p>
               			<div class="barchartbody"><div id="barchart"></div></div>
               			<p class="description1">* 체질량지수(Body Mass Index, BMI) = 체중(kg)/신장*신장(㎡)</p>
               			<p class="description2">만 19세이상 성인을 대상으로 한 자료로 19세미만의 경우 19세 대상 자료로 대체됩니다.<br>[출처:국민건강보험공단, 일반건강검진 (2020)]</p>
               		</div>
            	</div>
            </div>
            <div class="col-xl-6">
            	<div class="card mb-4">
               		<div class="card-header">
                    	<i class="bi bi-clipboard-data"></i>
                        <h3 class="chart_title">이번달 운동 부위</h3>
                 	</div>
                	<div class="card-body">
                		<div class="donutchart" > 	           		
                        	<span class="donutcharttext"><i class="bi bi-emoji-smile"></i> 이번달 운동기록을 토대로 차트를 보여드립니다.<br>기록을 토대로 균형잡힌 운동계획을 세워보세요.</span>
				 		</div>
                		<div class="donutchartbody"><div id="donutchart"></div></div>
                	</div>
            	</div>
        	</div>
       	</div>
       	<div class="card mb-4">
        	<div class="card-header">
            	<i class="bi bi-grid-3x2-gap"></i>
            	<h3 class="chart_title">운동기록 확인하기</h3>
         	</div>
         	<div class="card-body">
         	<c:if test="${page != 0}">
			<table class="table table-hover">
			  <thead>
			    <tr class="thead">
			      <th scope="col">루틴이름</th>
			      <th scope="col">적립포인트</th>
			      <th scope="col">운동일자</th>
			    </tr>
			  </thead>
			  <tbody id="workoutlist">
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
				      <th scope="col">루틴이름</th>
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
<%@include file ="../include/footerjsx.jsp" %> 
<script src="<%=request.getContextPath() %>/resources/jquery-3.6.0.min.js"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>     
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
<script type="text/javascript">
if (self.name != 'reload') {
    self.name = 'reload';
    self.location.reload(true);
}
else self.name = '';

/*====================== 메뉴부분 ===================================*/
const header=document.querySelector('header');
const nav = document.querySelector('nav');
const mobilebtn = document.querySelector('#mobilebtn');
const check = document.getElementsByName("menuBtn");
//웹상 메뉴 
nav.addEventListener('mouseover', function(){
	let windowWidth = window.outerWidth;
    if (windowWidth >720) {
		header.style.height='320px';
    }
});
nav.addEventListener('mouseout', function(){
	let windowWidth = window.outerWidth;
    if (windowWidth >720) {
		header.style.height='100px';
    }
});

//모바일 메뉴 
mobilebtn.addEventListener('click', () => {
    let windowWidth = window.outerWidth;
    if (windowWidth <720) {
    	if(header.style.overflow=='hidden'){
    		header.style.overflow='visible';
    	}else{
    		header.style.overflow='hidden'
    		for(let i=0;check.length;i++){
    			if(check[i].checked){
    				check[i].checked = false;
                }
    		}
    		
    	}
    	
    }
});

function modalOpen() {
    document.querySelector('.modal_wrap').style.display = 'block';
}

// 모달 끄기
function modalClose() {
    document.querySelector('.modal_wrap').style.display = 'none';
}

//버튼 클릭리스너 달기
document.querySelector('#modal_btn').addEventListener('click', modalOpen);
document.querySelector('.modal_close').addEventListener('click', modalClose);
/*====================================================================*/


/*====================== 이번달운동일자 ===================================*/
var add_day = ${add_day};
const date = new Date();
function dateFormat(){
	return date.toLocaleDateString().replace(/\./g, "").split(" ");
	}
//현재의 연도와 월 받아오기
const [nowYear, nowMonth] = dateFormat(date);

//지난달의 마지막 요일
const prevDay = new Date(nowYear, nowMonth - 1, 1).getDay();

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
	for (let i = 1; i <= lastDay; i++) {
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
/*====================================================================*/

/*====================== 차트부분 ===================================*/

//한달 목표 횟수 달성률

const getFloatFixed = (value, fixed) => {
	return parseFloat(Math.round(value * 100) / 100).toFixed(fixed);
};
let percent = getFloatFixed(${percent}, 1);
var areachart = c3.generate({
	bindto: "#areachart",
    data: {
        columns: [
            ['달성률', 0]
        ],
        type: 'gauge'
    },
    color: {
        pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'],
        threshold: {
            values: [30, 60, 90, 100]
        }
    },
    size: {
        height: 180
    }
});
setTimeout(function () {
	areachart.load({
        columns: [['달성률', percent]]
    });
}, 1000);


//BMI(체질량)지수 
var barchart = c3.generate({
	bindto: "#barchart",
    data: {
    	x : 'date',
        columns: [
        	['date','저체중', '정상체중', '비만1단계', '비만2단계', '비만3단계'],
        	 ['남성', ${bmilist[1].bmi_lv1}, ${bmilist[1].bmi_lv2}, ${bmilist[1].bmi_lv3}, ${bmilist[1].bmi_lv4}, ${bmilist[1].bmi_lv5}],
             ['여성', ${bmilist[0].bmi_lv1}, ${bmilist[0].bmi_lv2}, ${bmilist[0].bmi_lv3}, ${bmilist[0].bmi_lv4}, ${bmilist[0].bmi_lv5}]
        ],
        type: 'bar'
    }, color: {
        pattern: ['#2f79f6', '#ff993d']
    },
    axis: {
        x: {
            type: 'category',
            tick: {
                multiline: false
            }
        },
        y: { max: 100, 
        	 min: 10,
        	 tick: {
        	        format: function(d) {
        	            return d + "%";
        	            } 
        	},
        }
    }
});

setTimeout(function () {
	barchart.xgrids([{value: 0, text:'BMI 18.5 미만'}, {value: 1, text: 'BMI 18.5~25.0 미만'}, {value: 2, text: 'BMI 25.0~30.0 미만'}, {value: 3, text: 'BMI 30.0~40.0 미만'},{value: 4, text: 'BMI 40.0 이상'}]);
}, 1000);



//이번달 운동 부위
var donutchart = c3.generate({
	bindto: "#donutchart",
    data: {
        json: ${partlistresult}, type : 'donut'
    },donut: {
        title: "운동 부위 %"
    },color: {
        pattern: ['#3B5284','#5BABA0','#0191B4','#35BBCA','#F8D90F','#BF90C9','#D3DD18','#8ED2CD','#FFC872','#FE7A15']
    },
    size: {
        height: 350
    }
});

/*====================================================================*/
 
 
/*========================운동기록 확인하기================================*/
let pageing = document.getElementById('pageing');
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
 }); 
 
/*====================================================================*/
</script>
</body>
</html>
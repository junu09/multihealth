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
                                <a class="h3 text-dark text-decoration-none mr-3" style="padding-left:25px">
                                	<img src="<%=request.getContextPath()%>/resources/images/run.gif" width="30px" height="30px">PT Routine
                                </a>
                            </li>
                        </ul>
                    </div>
        </div>
	 	<div class="row">
		 	<div class="col-md-11 menu ptuser">
				<table>
					<tr>
						<td><img src="<%=request.getContextPath()%>/resources/images/pt_user.png" width="50px" height="50px"></td>
						<td><h1>김유저<span>님</span></h1><a href="saveasptuser">정보수정하기</a></td>
						<td><p>포인트</p><h2>50<span>p</span></h2></td>
						<td><p>한달목표횟수</p><h2>20<span>회</span></h2></td>
						<td><p>키</p><h2>150<span>cm</span></h2></td>
						<td><p>몸무게</p><h2>50<span>kg</span></h2></td>
					</tr>
				</table>
		 	</div>
		</div>
		<div class="row">
			 	<div class="col-sm-5 menu">
			 		<table class="ptchart">
			 			<tr class="ptcharthead">
				 			<td>
				 				<h3>한달 목표 횟수 달성률</h3>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td style="padding-top:20px"><div id="areachart"></div></td>
			 			</tr>
			 		</table>
			 	</div>
		 		<div class="col-sm-5 menu">
		 			<table class="ptchart">
			 			<tr class="ptcharthead">
				 			<td>
				 				<h3>이번달 운동 일자</h3>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>
								<div>
									<h4 class='dateTitle'></h4>
								</div>
							</td>
							<td class="date">
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
		<div class="row">
		 	<div class="col-sm-5 menu">
			 		<table class="ptchart">
			 			<tr class="ptcharthead">
				 			<td>
				 				<h3>BMI(체질량)지수</h3>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td class="bmi_hader">
				 				<div>
				 					<p>정상체중</p>
				 					<img src="<%=request.getContextPath()%>/resources/images/bmiuser.png" width="30px" height="30px"> 22 <span>BMI</span>
				 				</div>
				 			</td>
			 			</tr>
			 			<tr>
							<td><div id="barchart"></div></td>
			 			</tr>
			 		</table>
			 	</div>
		 	<div class="col-sm-5 menu">
		 		<table class="ptchart">
			 			<tr class="ptcharthead">
				 			<td>
				 				<h3>이번달 부위별 운동 비율</h3>
				 			</td>
				 		</tr>
				 		<tr>
				 			<td class="bmi_hader">
				 				<div>
				 				</div>
				 			</td>
			 			</tr>
			 			<tr>
							<td><div id="donutchart"></div></td>
			 			</tr>
			 		</table>
		 	</div>
		</div>
		<div class="row">
		 	<div class="col-sm-11 menu">
		 	ㅇㅇㅇ
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
 const lastDay = dateFormat(new Date(nowYear, nowMonth, 0)).pop() * 1;

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
$(".dateTitle").html(nowYear+"<br><span>"+nowMonth+"</span>"); 
 </script>
<script>
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

var chart = c3.generate({
	bindto: "#areachart",
    data: {
        columns: [
            ['data', 91.4]
        ],
        type: 'gauge',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    },
    gauge: {
//        label: {
//            format: function(value, ratio) {
//                return value;
//            },
//            show: false // to turn off the min/max labels.
//        },
//    min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
//    max: 100, // 100 is default
//    units: ' %',
//    width: 39 // for adjusting arc thickness
    },
    color: {
        pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'], // the three color levels for the percentage values.
        threshold: {
//            unit: 'value', // percentage is default
//            max: 200, // 100 is default
            values: [30, 60, 90, 100]
        }
    },
    size: {
        height: 180
    }
});
var chart = c3.generate({
	bindto: "#barchart",
    data: {
        columns: [
            ['data1', 30, 200, 100, 400, 150, 250],
            ['data2', 30, 200, 100, 400, 150, 250]
        ],
        type: 'bar'
    },
    bar: {
        width: {
            ratio: 0.5 // this makes bar width 50% of length between ticks
        }
    },
    size: {
        height: 300
    }
});

var chart = c3.generate({
	bindto: "#donutchart",
    data: {
        columns: [
            ['data1', 30],
            ['data2', 120],
        ],
        type : 'donut',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    },
    donut: {
        title:"dd"
    }
});

setTimeout(function () {
    chart.load({
        columns: [
            ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
            ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
            ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
        ]
    });
}, 1500);

setTimeout(function () {
    chart.unload({
        ids: 'data1'
    });
    chart.unload({
        ids: 'data2'
    });
}, 2500);

</script>
</body>
</html>
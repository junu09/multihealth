<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MultiHealth</title>
<head>
    <title>MultiHealth</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ptservice.css">
</head>
<body>
<%@include file ="../include/header.jsp" %> 
	<div class="container py-5">
         <div class="row">
            <div class="col-lg-3 leftlayout">
                <h1 class="h2 pb-4">PT List</h1>
	                <ul class="list-unstyled templatemo-accordion">
	                    <c:forEach items="${pick}" var="pickdto" varStatus="status">
	                    	<li class="pb-3 start_pt">
		                        <p class="collapsed d-flex justify-content-between h3 text-decoration-none" >
		                        	<i class="fa fa-fw fa-chevron-circle-down mt-1 color${status.index}"></i>${pickdto.et_name}<span class="startpt_count">[${pickdto.pr_count}회  ${pickdto.et_time*pickdto.pr_count}분]</span>
								</p>
	                    	 </li>						
	                     </c:forEach>
	                </ul>
            </div>
            <div class="col-lg-9 rightlayout">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3"><img src="<%=request.getContextPath()%>/resources/images/run.gif" width="30px" height="30px">Start PT</a>
                            </li>
                        </ul>
                    </div>
                </div>				
                <div class="row">
                <div class="col-xl-12">
	                <div class="card mb-4">
	                	<div class="card-header">			  
			            	<p id="timer">00:00:00</p>
			         	</div>
				        <div class="card-body">
				        	<div id="myProgress">
    							<div id="myBar"></div>
							</div>
		                	<div id="ptroutinelist">
							<c:forEach items="${pick}" var="pickdto" varStatus="status">
								<div id="img${status.count}" class="t-${pickdto.et_time*pickdto.pr_count}" style ="display:none">
									<img src="<%=request.getContextPath() %>/resources/images/${pickdto.et_img3}.gif" width="100%">                                
                                    <div class="pt_description">
										<div>${pickdto.et_description}</div>
									</div>
								</div>
							</c:forEach>
		                	</div>
		                	<div class="finishimg" id="p-${pick[0].pr_num}" style ="display:none">
		                		<img src="<%=request.getContextPath() %>/resources/images/finish.jpg" width="100%">
		                	</div>
		                	<div id="startpt_btn">
	                			<a class="btn btn-dark btn-lg px-3 text-light" onclick="location.href='ptmain';">취소하기</a>
								<a class="btn btn-dark btn-lg px-3 text-light finish_btn pt_btn" style='display:none; float:left;' id="p-${pick[0].pr_num}" href="ptmain">완료하기</a>
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
/*이미지별로 시간저장*/
var listnum = ${fn:length(pick)}
var time2 = [];
var timebar = [];
time2[0] = 0;
timebar[0] = 0;
var timeone = 0;
var timeadd = 0;
function one(){
for (let i = 1; i <=listnum ; i++) {
	var t = $('#img'+i).attr('class');
	timeone = (t.split("-"))[1]*1;
	timeadd+=timeone;
	time2[i]=timeadd;
	timebar[i]=timeone;
	}
};

/*타이머 부분 */
 
var bar_percent_one = 0;
var bar_percent_add = 0;
 T = {} ;
T.timerDiv = document.getElementById('timer');
percentbar =document.getElementById('myBar');

function displayTimer() {
  // initilized all local variables:
  var minutes='00',
  miliseconds=0, seconds='00',
  time = '',
  timeNow = new Date().getTime(); // timestamp (miliseconds)

  T.difference = timeNow - T.timerStarted;

  // milliseconds
  if(T.difference > 10) {
    miliseconds = Math.floor((T.difference % 1000) / 10);
    if(miliseconds < 10) {
      miliseconds = '0'+String(miliseconds);
    }
  }
  // seconds
  if(T.difference > 1000) {
    seconds = Math.floor(T.difference / 1000);
    if (seconds > 60) {
      seconds = seconds % 60;
    }
    if(seconds < 10) {
      seconds = '0'+String(seconds);
    }
  }

  // minutes
  if(T.difference > 60000) {
    minutes = Math.floor(T.difference/60000);
    if (minutes > 60) {
      minutes = minutes % 60;
    }
    if(minutes < 10) {
      minutes = '0'+String(minutes);
    }
  }

  time += minutes + ':'
  time += seconds + ':'
  time += miliseconds;

  T.timerDiv.innerHTML = time;
  
  if(bar_percent_add>=100){
	  bar_percent_add = 0;
	  
  	}
	  bar_percent_add += bar_percent_one;
	  percentbar.style.width=bar_percent_add+"%";
  
}

function startTimer() {
  // save start time
  T.timerStarted = new Date().getTime()

  if (T.difference > 0) {
    T.timerStarted = T.timerStarted - T.difference
  }
  // update timer periodically
  T.timerInterval = setInterval(function() {
    displayTimer();
  }, 10);
}

function stopTimer() {
  clearInterval(T.timerInterval); // stop updating the timer
}

function clearTimer() {
  clearInterval(T.timerInterval);
  T.timerDiv.innerHTML = "00:00:00"; // reset timer to all zeros
  T.difference = 0;
} 

/*운동이미지 나타내는 부분 */

function Two(){
	for (let i = 0; i < time2.length  ; i++) {
		 setTimeout(() => {
			clearTimer(); 
			$('[id^="img"]').css('display','none');
			$(".color"+i).css('color','#E33319');
			$("#img"+(i+1)).css('display','block');	
			bar_percent_one = ((1/(100*timebar[i+1]))*100);
			/*bar_percent_one = ((1/(6000*timebar[i+1]))*100);*/
			startTimer();
		  },(time2[i]) * 1000); 
	}
	setTimeout(() => {
		clearTimer();
		$('#myProgress').css('display','none');
		$('[id^="img"]').css('display','none');
		$(".finishimg").css('display','block');
		$(".finish_btn").css('display','block');
 		},(timeadd) * 1000);
}; 

	one();
	console.log(timebar);
	Two();
	//시연을 위해 시간을 분단위가 아닌 초단위로 설정함
	
	
	
$(document).on("click", ".finish_btn", function(){
		let a = $('.finish_btn').attr('id');
		console.log(a);
		let pr_num = a.slice(2);
		let today = new Date();
		let year = today.getFullYear(); 
		let month = today.getMonth() + 1;
		let date = today.getDate();
		let hours = today.getHours();
		let minutes = today.getMinutes(); 
		let seconds = today.getSeconds();
		let datetime = year + '-' + month + '-' + date + ' ' +hours+ ':' + minutes + ':' + seconds;
		$.ajax({
			url:'ptroutinesave',
			type : 'post',
			data : {'datetime':datetime, 'pr_num':pr_num} , 
			dataType: 'json',
			success : function(a){
				alert(a.ms);
			}//success end	
		});//ajax end
		
	  });
 	
</script>
</body>
</html>
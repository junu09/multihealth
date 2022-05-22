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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/ptservice.css">
</head>
<body>
 <%@include file ="../include/sub_header.jsp" %> <!-- 공통헤더 삽입 -->
	<div class="container py-5">
        <div class="row">
        	<div class="col-lg-3 leftlayout">
		  	<div class="row">
	        	<h1 class="h2 pb-4">Start PT</h1>
	            	<ul class="list-unstyled templatemo-accordion">
	                    <li class="pb-3">
	                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none">
	                            스쿼트<span class="startpt_count"> ${ptcount}회</span>
	                        </a>
	                    </li>
	                    <li class="spicalpt_delete">
	                    	<a class="btn btn-dark btn-lg px-3 text-light" onclick="location.href='ptmain';">취소하기</a>
	                    	<a class="btn btn-dark btn-lg px-3 text-light finish_btn pt_btn" style='display:none; float:left;' href="specialpt">랭킹등록하기</a>
	                    </li>
	                </ul>
		   		</div>
	    	</div>
           <div class="col-lg-9 rightlayout">
            <div class="card mb-4">
	        	<div class="card-header">
	            	<i class="bi bi-check-all"></i>
	            	<h3 class="chart_title">스쿼트 시작하기</h3>
	         	</div>
	         	<div class="card-body">
	         		<div>
	         			<canvas id="canvas"></canvas> 	            
		                 <div class = squat_counter>
							<div class="circle-big">
							  	<svg>
							    	<circle class="bg" cx="57" cy="57" r="52" />
							     	<circle class="progress" cx="57" cy="57" r="52" />
							  	</svg>
							  	<div class="text">
							    	<span>남은갯수</span><br>
							    	<span id="counter">${ptcount}</span><div class="small"></div>
							   	</div>
							</div>    
						 </div>
						 <div class="finishimg" id="p-${pick[0].pr_num}" style ="display:none">
		                	<img src="<%=request.getContextPath() %>/resources/images/finish.jpg" width="100%">
		                 </div>
					 </div>
	         	</div>
        	</div>
        </div>
     </div>
 </div>
<div style="visibility:hidden; position:absolute;"id="label-container"></div>
<%@include file ="../include/footerjsx.jsp" %> 
<!-- Optional JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		//티처블 머신관련 
        const URL = "<%=request.getContextPath() %>/resources/my_model/";
        let model, webcam, ctx, labelContainer, maxPredictions;

        var status = "stand";//처음 서있는 상태를 변수로
        var number = ${ptcount};//갯수를 변수로 만들어줌 
        var count = ${ptcount};//갯수를 변수로 만들어줌 
        var progress = 327;
        
		//기록관련 
		let start = new Date();
		let end = 0;
		$(document).on("click", ".finish_btn", function(){
	   		  let time = end-start;
	    	   $.ajax({
	   			url:'specialroutinesave',
	   			type : 'post',
	   			data : {'time':time, 'count':${ptcount}} , 
	   			dataType: 'json',
	   			success : function(){
	   			}
	   		});
	       });
        
        async function init() {
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";
            model = await tmPose.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();

            // Convenience function to setup a webcam
            const size = 700;
            const flip = true; // whether to flip the webcam
            webcam = new tmPose.Webcam(size, size, flip); // width, height, flip
            await webcam.setup(); // request access to the webcam
            await webcam.play();
            window.requestAnimationFrame(loop);

            // append/get elements to the DOM
            const canvas = document.getElementById("canvas");
            canvas.width = size; canvas.height = size;
            ctx = canvas.getContext("2d");
            labelContainer = document.getElementById("label-container");
            for (let i = 0; i < maxPredictions; i++) { // and class labels
                labelContainer.appendChild(document.createElement("div"));
            }
        }
	        async function loop(timestamp) {
	            webcam.update(); // 웹캠 업로드 
	            await predict();
	            window.requestAnimationFrame(loop);
	        }
        
        async function predict() {//반복되서 실행됨 
            const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
            const prediction = await model.predict(posenetOutput);
            
            if (prediction[0].probability.toFixed(2) > 0.90) {//0번 스탠스 서있을때 
                	$("#count").html(count);
                if (status == "squat") {
                	if(count != 0){
                    	count-- //스쿼트 상태였다가 스탠드 상태로 갔을때 카운터를 하나 올려준다
                    	progress = progress-(327/number);
                    	$('.progress').css('stroke-dashoffset', progress);
	                	if(count == 0){
	                		end = new Date();
	    	   				$(".finish_btn").css('display','block');
	    	   				$(".finishimg").css('display','block');
	    	   				$("#canvas").css('display','none');
	    	   				$(".squat_counter").css('display','none');
                		}
                	}
                    status == "stand";
                    $("#counter").html(count);
                }
                status = "stand"
            
            } else if (prediction[1].probability.toFixed(2) >= 0.90) {//스쿼트 상태
                status = "squat";  
            
            } else if (prediction[2].probability.toFixed(2) >= 0.90) {
            	status = "bent"; 
            	
            }
               
            for (let i = 0; i < maxPredictions; i++) {
                const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
                labelContainer.childNodes[i].innerHTML = classPrediction;
            }

            drawPose(pose);
        }

        function drawPose(pose) {
            if (webcam.canvas) {
                ctx.drawImage(webcam.canvas, 0, 0);
                // draw the keypoints and skeleton
                if (pose) {
                    const minPartConfidence = 0.5;
                    tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                    tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
                }
            }
        }
       init();
       
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MultiHealth</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
    <link href="https://fonts.googleapis.com/css?family=Exo:300,600,800&display=swap" rel="stylesheet">
     
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome.min.css">
	
    <!-- Load map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
 
<style>
@import url('https://fonts.googleapis.com/css2?family=Aldrich&display=swap');
/* modal */
.modal_wrap {
    display: none;
    width: 100%;
    height: 100%; /* 모달 내리는 높이 조절 */
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
	z-index:1;
}
nav {text-align:center; margin:0 auto;font-family: 'Aldrich', sans-serif !important;; font-size:17px !important;}
nav > ul > li {float:left; line-height:100px; margin:0 auto; color:white;}
nav > ul > .side{float:left; width:26%;}
nav > ul > .logo img{margin-top:20px; width:150px;}
nav > ul > .logo #mobilebtn img{display:none;}
nav > ul > .icon img{width:22px;margin:0 10px;}
nav > ul > li > input{ position: fixed;left: -9999px;}
nav > ul > li ul{padding:0;}
nav > ul > li ul li{white-space:nowrap;line-height:50px;}
nav > ul > li ul li{white-space:nowrap;line-height:50px;}
nav > ul > li ul li a{text-decoration: none; color:#9c9c9c; text-decoration: none; background-repeat: no-repeat; background-size: 0% 100%; transition: background-size 0.5s;}
nav > ul > li ul li a:hover{color:#cfcfcf; background-size: 100% 100%; background-image: linear-gradient(transparent 80%, #777777 40%);}
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
</head>
<body>
<header>
	<nav>
			<ul class="clearfix mainmenu">
			<li  class="side logo">
			
				<a href="/"><img src="<%=request.getContextPath()%>/resources/img/logowhite.png" style="padding-bottom: 30px;"></a>
			    <span id="mobilebtn"><img src="<%=request.getContextPath()%>/resources/img/menubar.png" width="50px"></span>
			</li>
				<li class="menutitle"><input type="radio" id="menuBtn1" name="menuBtn"><label for="menuBtn1">SHOP</label>
					    <ul class="submenu">
							<li><a href="/productlist">PRODUCT</a></li>
						</ul>
				</li>
				<li class="menutitle"><input type="radio" id="menuBtn2" name="menuBtn"><label for="menuBtn2">PT</label>
						<ul class="submenu">
							<li><a href="#">PT ROUTIN</a></li>
							<li><a href="#">SPECIALT ROUTIN</a></li>
							<li><a href="#">MAKE ROUTIN</a></li>
						</ul>
				</li>
				<li class="menutitle"><input type="radio" id="menuBtn3" name="menuBtn"><label for="menuBtn3">COMMUNITY</label>
						<ul class="submenu">
							<li><a href="#">REVIEW</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
				</li>
				<li  class="menutitle"id="admin" style="display:none"; ><input type="radio" id="menuBtn4" name="menuBtn"><label for="menuBtn4">ADMIN</label>
				<li  class="menutitle" id="admin"><input type="radio" id="menuBtn4" name="menuBtn"><label for="menuBtn4">ADMIN</label>
						<ul class="submenu">
							<li><a href="/login">2nd menu</a></li>
							<li><a href="#">2nd menu</a></li>
						</ul>
				</li>
				<li class="side icon">
				    <a href="/user/loginPage" style="padding-right: 20px;">log in</a>
				    <a href="/agreement" style="padding-right: 20px;">sign up</a>
					<a id="modal_btn" href="#"><img src="<%=request.getContextPath()%>/resources/img/shchicon.png"></a>
					<a href="/user/info"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a>
					<a href="#"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a>
					<a href="/cart"><img src="<%=request.getContextPath()%>/resources/img/cart.png"></a>
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
	

<%-- 	<%@include file ="../views/include/header.jsp" %> --%> <!-- 공통헤더 삽입 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/testboot.css">

    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-3">
                <h1 class="h2 pb-4">PRODUCT</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            PROTIEN
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                        <c:forEach items="${categorylist }" var="cdto" varStatus="status">
                        	<c:if test="${cdto.category_num == 1}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=1"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
							</c:forEach>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            YOGA
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                        <c:forEach items="${categorylist }" var="cdto" varStatus="status">
                        	<c:if test="${cdto.category_num == 2}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=2"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 3}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=3"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 4}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=4"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 5}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=5"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
							</c:forEach>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            FITNESS EQUIMENT
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                        <c:forEach items="${categorylist }" var="cdto" varStatus="status">
                        <c:if test="${cdto.category_num == 6}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=7"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 7}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=7"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 8}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=8"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 9}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=9"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 10}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=10"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 11}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=11"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 12}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=12"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 13}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=13"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 14}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=14"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 16}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=16"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 17}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=17"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 18}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=18"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 19}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=19"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 20}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=20"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	<c:if test="${cdto.category_num == 21}">
                        		<li id=list name=list value="${cdto.category_name}">
								<a class="text-decoration-none" href="http://localhost:8081/productlist?categorynum=21"  >${cdto.category_name}</a>
							</li>
                        	</c:if>
                        	</c:forEach>
                    </li>
                </ul>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="productlist?categorynum=0">ALL  PRODUCT</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 pb-4" >
                    
						<div class="d-flex">
								<!-- 이거 9 18 27 -->
							<select class="form-control" name="contentnum" id="contentnum" onchange="page(1)">
								<option value="9"
									<c:if test="${page.getContentnum() == 9 }">selected="selected"</c:if>>9
									개</option>
								<option value="18"
									<c:if test="${page.getContentnum() == 18 }">selected="selected"</c:if>>18
									개</option>
								<option value="27"
									<c:if test="${page.getContentnum() == 27 }">selected="selected"</c:if>>27
									개</option>
							</select>
						</div>
					</div>
                    
                </div>

				<div class="row">
                    <c:forEach items="${productlist }" var="dto">	
						<div class="col-md-4">
	                        <div class="card mb-4 product-wap rounded-0">
	                            <div class="card rounded-0">
	                                ${dto.prod_img_name }
	                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
	                                    <ul class="list-unstyled">	                                        
	                                        <li><a class="btn btn-success text-white mt-2" href="/productdetail?prod_num=${dto.prod_num }"><i class="fas fa-cart-plus"></i></a></li>
	                                    </ul>
	                                </div>
	                            </div>	                            
	                            <div class="card-body" style="display:inline-block; height:166px" >
	                                <a href="/productdetail?prod_num=${dto.prod_num }" class="h3 text-decoration-none">${dto.prod_title }</a><br><br>
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li class="pt-2">
	                                        <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
	                                        <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
	                                        <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
	                                        <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
	                                        <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
	                                    </li>
	                                </ul>
	                                <ul class="list-unstyled d-flex justify-content-center mb-1" style="display:none">
	                                </ul>
	                                <p class="text-center mb-0">${dto.prod_price } ￦</p>
	                            </div>
	                        </div>
                    	</div>
					</c:forEach>
                    
                </div>

				<div div="row">
                    <ul class="pagination pagination-lg justify-content-end">
							<c:if test="${page.prev}">
							    <li class="page-item">
									<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
								</li>	
							</c:if> 
                        		
							<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
								<li class="page-item">		
									<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="javascript:page(${idx});">${idx}</a>
                        		</li>							
							</c:forEach>

                                              							 
							<c:if test="${page.next}">
								<li class="page-item">  
									<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
								</li>
							</c:if>
							
                    </ul>
				</div>
            </div>

        </div>
    </div>
    <!-- End Content -->

	<!-- Start Brands -->
	<section class="bg-light py-5">
		<div class="container my-4">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">PT Routine</h1>
					<p>건강한 운동습관은 즐거운 하루를 보낼수 있도록 도와줍니다.<br> 운동을 시작하고 루틴을 지키는 것 에 어려움을 느낀다면<br> 운동루틴 서비스를 통해 건강을 지켜가세요.</p>
				</div>
				<div class="col-lg-9 m-auto tempaltemo-carousel">
					<div class="row d-flex flex-row">
						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button"
								data-bs-slide="prev"> <i
								class="text-light fas fa-chevron-left"></i>
							</a>
						</div>
						<!--End Controls-->

						<!--Carousel Wrapper-->
						<div class="col">
							<div class="carousel slide carousel-multi-item pt-2 pt-md-0"
								id="multi-item-example" data-bs-ride="carousel">
								<!--Slides-->
								<div class="carousel-inner product-links-wap" role="listbox">

									<!--First slide-->
									<div class="carousel-item active">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[0].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[1].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[2].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[3].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End First slide-->

									<!--Second slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[4].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[5].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[6].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[7].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End Second slide-->

									<!--Third slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[8].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[9].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[10].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="<%=request.getContextPath() %>/resources/images/${exerciselist[11].et_img2}.jpg" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End Third slide-->

								</div>
								<!--End Slides-->
							</div>
						</div>
						<!--End Carousel Wrapper-->

						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button"
								data-bs-slide="next"> <i
								class="text-light fas fa-chevron-right"></i>
							</a>
						</div>
						<!--End Controls-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--End Brands-->
<%@include file ="../views/include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->
<script src="<%=request.getContextPath() %>/resources/jquery-3.6.0.min.js"></script>


	<script type="text/javascript">
	
	/*한페이지당 게시물 */
	function page(idx){
	  var pagenum = idx;
	  var contentnum = $("#contentnum option:selected").val();
	  if(contentnum == 9){
	    location.href="${pageContext.request.contextPath}/productlist?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+${category}
	
	  }else if(contentnum == 18){
	    location.href="${pageContext.request.contextPath}/productlist?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+${category}
	
	  }else if(contentnum == 27){
	    location.href="${pageContext.request.contextPath}/productlist?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+${category}
	
	  }
	}
	
	</script>
	<script>
		function f(idx){
			var pagenum = idx;
			var contentnum = $("#contentnum option:selected").val();
			var selectval = $("#list option:selected").val(); // select element에서 선택된 option의 value가 저장된다. ??? 수정
			
			for(var i = 1; i < 21; i++){
				if(selectval == i){
					location.href="${pageContext.request.contextPath}/productlist?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+selectval
				}
			}
		}
	</script>
	
	<script>
	function selectList(){
		  var search_text = document.getElementById('search_text').value;
		  console.log("검색어"+search_text);
		  $.ajax({
			  url : "/productlist/selectList",
			  type : "get",
			  dataType : "json",
			  data : {"search_text": search_text},
			  success : function(data){
				  alert(data);
				  
			  }
		  })
	  };
	
	</script>
<script>
const menutitles=document.querySelectorAll('.menutitle');
const admin=document.querySelector('#admin');
const header=document.querySelector('header');
const nav = document.querySelector('nav');
const mobilebtn = document.querySelector('#mobilebtn');
const check = document.getElementsByName("menuBtn");
<<<<<<< HEAD
//웹상 메뉴 
for(let i = 0; i < menutitles.length; i++)  {
	let windowWidth = window.outerWidth;
    if (windowWidth >720){
		if(admin.style.display=="none"){
			menutitles[i].style.width = 15+ '%';
		}else{
			menutitles[i].style.width = 12 + '%';
		}
    }
  }


//웹상 메뉴

for(let i = 0; i < menutitles.length; i++)  {
	let windowWidth = window.outerWidth;
    if (windowWidth >720){
		if(admin.style.display=="none"){
			menutitles[i].style.width = 15 + '%';
		}else{
			menutitles[i].style.width = 12 + '%';
		}
    }
  }
  
  
nav.addEventListener('mouseover', function(){
	let windowWidth = window.outerWidth;
    if (windowWidth >720) {
		header.style.height='250px';
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


</script>
	<!-- End Script -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MultiHealth</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="apple-touch-icon" href="<%=request.getContextPath() %>/resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/img/favicon.ico">
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
							<li><a href="#">PT RUTIN</a></li>
							<li><a href="#">2nd menu</a></li>
						</ul>
				</li>
				<li class="menutitle"><input type="radio" id="menuBtn3" name="menuBtn"><label for="menuBtn3">COMMUNITY</label>
						<ul class="submenu">
							<li><a href="#">REVIEW</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
				</li>
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
					<a href="#"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a>
					<a href="/cart"><img src="<%=request.getContextPath()%>/resources/img/cart.png"></a>
				</li>											
			</ul>
			
	</nav>
</header>
<!-- Modal -->
<div class="modal_wrap">
    <div class="modal_close"><img src="<%=request.getContextPath()%>/resources/img/close.png" style="height: 30px;"></div>
    <div class="text">
    <form name="" action="/" method="get">
       <input type="text">
    </form>
    </div>
</div>
<%-- <%@include file ="../include/header.jsp" %> <!-- 공통헤더 삽입 --> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/review.css">
	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="h2 pb-4">Review</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> 공지사항 <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><a class="text-decoration-none" href="reviewinsert">공지사항
									등록</a></li>
							<li><a class="text-decoration-none" href="reviewlist">공지사항
									조회 및 수정 삭제</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">리뷰
									</a></li>
							<!--                             <li class="list-inline-item"> -->
							<!--                                 <a class="h3 text-dark text-decoration-none mr-3" href="#">Men's</a> -->
							<!--                             </li> -->
							<!--                             <li class="list-inline-item"> -->
							<!--                                 <a class="h3 text-dark text-decoration-none" href="#">Women's</a> -->
							<!--                             </li> -->
						</ul>
					</div>
					<div class="col-md-3 pb-4">
						<div class="d-flex">
							<select class="form-control" id="selectbox" " name="selectbox"
								onchange="chageLangSelect(1)" style="display:none">
								<c:forEach items="${categorylist }" var="cdto"
									varStatus="status">
									<option value="${cdto.category_num}" <c:if test="${cdto.category_num eq category}">selected</c:if>>${cdto.category_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-3 pb-4">
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
					
						<div class="col-md-12">
						<table class="table">
							<thead>
							<tr>
								<th>제목</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${announcelist }" var="dto" varStatus="status">
							<tr>
								<td>${dto.a_title }</td>
								<td>${dto.a_date }</td>
								<td>${dto.a_count }</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
<!-- 							<div class="card mb-4 product-wap rounded-0"> -->
<!-- 								<div class="card rounded-0"> -->
<%-- 									${dto.a_title } --%>
<!-- 									<div -->
<!-- 										class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center"> -->
<!-- 										<ul class="list-unstyled">											 -->
<!-- 											<li><a class="btn btn-success text-white mt-2" -->
<%-- 												href="adminmodify?productnum=${dto.a_num }"><i class="fab fa-medium-m"></i></a></li> --%>
<%-- 											<li><a class="delete_modal btn btn-success text-white mt-2" href="#" data-bs-toggle="modal" data-bs-target="#delete_modal" data-num="${dto.a_num }" --%>
<!-- 											    ><i class="fas fa-trash"></i></a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 								</div> -->
								
<!-- 								Modal -->
<!-- 								<div class="modal fade bg-white" id="delete_modal" -->
<!-- 									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" -->
<!-- 									aria-hidden="true"> -->
<!-- 									<div class="modal-dialog modal-lg" role="document"> -->
	
										
<!-- 										<form action="admindelete" method="get" -->
<!-- 											class="modal-content modal-body border-0 p-0" > -->
<!-- 											<h1 style="text-align: center;">삭제하시겠습니까?</h1> -->
<!-- 											<br> -->
<!-- 											<br> -->
<!-- 											<div> -->
<!-- 												<input type="hidden" name=productnum id=productnum value="" /> -->
<!-- 												<div style="display: inline; float: left;"> -->
<!-- 													<button type="submit" -->
<!-- 														class="input-group-text bg-primary text-light"> -->
<!-- 														<i class="fa fa-fw fa-check text-white"></i> -->
<!-- 													</button> -->
<!-- 												</div> -->
<!-- 												<div style="display: inline-block; float:right;"> -->
<!-- 													<button type="button" -->
<!-- 														class="input-group-text bg-primary text-light" -->
<!-- 														data-bs-dismiss="modal" aria-label="Close"> -->
<!-- 														<i class="fa fa-fw fa-times text-white"></i> -->
<!-- 													</button> -->
<!-- 												</div> -->
<!-- 											</div>	 -->
<!-- 										</form> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="card-body" style="display:inline-block; height:166px"> -->
<%-- 									<a style="display:inline-block; height:70px" href="#" class="h3 text-decoration-none">${dto.a_content}</a> --%>
<!-- 									<ul -->
<!-- 										class="w-100 list-unstyled d-flex justify-content-between mb-0"> -->
<!-- 										<li class="pt-2"><span -->
<!-- 											class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span> -->
<!-- 											<span -->
<!-- 											class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span> -->
<!-- 											<span -->
<!-- 											class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span> -->
<!-- 											<span -->
<!-- 											class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span> -->
<!-- 											<span -->
<!-- 											class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span> -->
<!-- 										</li> -->
<!-- 									</ul> -->
<!-- 									<ul class="list-unstyled d-flex justify-content-center mb-1"> -->
<!-- 										<li> -->
<!-- 										</li> -->
<!-- 									</ul> -->
<%--  									<p class="text-center mb-0">${dto.r_point }</p> --%>

<!-- 								</div> -->
<!-- 							</div> -->
						</div>
	

				</div>

				<div div="row">
					<ul class="pagination pagination-lg justify-content-end">
						<c:if test="${page.prev}">
							<li class="page-item"><a
								class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
								href="javascript:page(${page.getStartPage()-1});">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${page.getStartPage()}"
							end="${page.getEndPage()}" var="idx">
							<li class="page-item"><a
								class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
								href="javascript:page(${idx});">${idx}</a></li>
						</c:forEach>


						<c:if test="${page.next}">
							<li class="page-item"><a
								class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
								href="javascript:page(${page.getEndPage()+1});">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- End Content -->



	


<%@include file ="../include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->




	<script type="text/javascript">
	/*한페이지당 게시물 */
	function page(idx){
	  var pagenum = idx;
	  var contentnum = $("#contentnum option:selected").val();
	  var selectval = $("#selectbox option:selected").val();
	  if(contentnum == 9){
// 	    location.href="${pageContext.request.contextPath}/adminselect?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+selectval
		  location.href="http://localhost:8081/admin/adminselect?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+selectval
	  }else if(contentnum == 18){
	    location.href="http://localhost:8081/admin/adminselect?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+selectval
	
	  }else if(contentnum == 27){
	    location.href="http://localhost:8081/admin/adminselect?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+selectval
	
	  }
	}
	</script>
	<script>
		function chageLangSelect(idx){ 
			var pagenum = idx;
			var contentnum = $("#contentnum option:selected").val();
			var selectval = $("#selectbox option:selected").val(); // select element에서 선택된 option의 value가 저장된다.
			for(var i = 0; i < 22; i++){
				if(selectval == i){
					location.href="http://localhost:8081/admin/adminselect?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+selectval
				}
			}
		}
	</script>
	<script>
	$(document).on("click", ".delete_modal", function () {
		 console.log($(this).data('num'));
	     var prod_num = $(this).data('num');
	     $("#productnum").val(prod_num);
	});
	</script>
	<script>
const menutitles=document.querySelectorAll('.menutitle');
const admin=document.querySelector('#admin');
const header=document.querySelector('header');
const nav = document.querySelector('nav');
const mobilebtn = document.querySelector('#mobilebtn');
const check = document.getElementsByName("menuBtn");


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
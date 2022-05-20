<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
				<li class="menutitle"><input type="radio" id="menuBtn4" name="menuBtn"><label for="menuBtn4">ADMIN</label>
						<ul class="submenu">
							<li><a href="/login">2nd menu</a></li>
							<li><a href="#">2nd menu</a></li>
						</ul>
				</li>
				<li class="side icon">
				    <a href="#" style="padding-right: 20px;">log in</a>
				    <a href="#" style="padding-right: 20px;">sign up</a>
					<a id="modal_btn" href="#"><img src="<%=request.getContextPath()%>/resources/img/shchicon.png"></a>
					<a href="#"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a>
					<a href="#"><img src="<%=request.getContextPath()%>/resources/img/cart.png"></a>
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

	
<section class="ftco-section">
	<div class="mask d-flex align-items-center h-100 gradient-custom-3">
		<div class="container h-100">
			 <div class="row w-100">
            <div class="col-lg-12 col-md-12 col-12">
                <h3 class="display-5 mb-2 text-center" style="padding-top: 50px;">현재 담은 물품</h3>
                <p class="mb-5 text-center">
                    <i class="text-info font-weight-bold">${cartList.size() }</i> 개의 상품이 있어요.</p>
                <table id="shoppingCart" class="table table-condensed table-responsive">
                    <thead>
                    <tr>
                        <th style="width:60%">상품</th>
                        <th style="width:12%">수량</th>
                        <th style="width:8%">가격</th>
                        <th style="width:10%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="prod" items="${prodList}" varStatus="status">
	                    <tr>
	                        <td data-th="Product">
	                            <div class="row">
	                                <div class="col-md-3 text-left">
	                                    ${prod.prod_img_name}
	                                </div>
	                                <div class="col-md-9 text-left mt-sm-2" style="padding-top: 70px;" >
	                                    <h4>${prod.prod_title}</h4>
	                                </div>
	                            </div>
	                        </td>
	                        <td data-th="Quantity">
								<input type="number" id="${prod.prod_num }quan" class="quan btn btn-light" value="${cartList[status.index].product_count}" min="1" style="margin-top: 70px;">
								<input type="hidden" class="total" value="${cartList[status.index].product_count * prod.prod_price}">
	                        </td>
	                        <td data-th="Price" style="padding-top: 85px;" >${prod.prod_price}</td>
	                        <td class="actions" data-th="">
	                            <div class="text-right">
	                                <button id="${prod.prod_num }" onClick="deleteCart(${prod.prod_num})" class="deleteBtn btn btn-white border-secondary bg-white btn-md mb-2"
	                                style="margin-top: 70px;">
	                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="8" height="8" viewBox="0 0 8 8">
	                                        <defs>
	                                            <clipPath id="clip-path">
	                                                <rect width="8"
														height="8" fill="none" />
	                                            </clipPath>
	                                        </defs>
	                                        <g id="close"
														clip-path="url(#clip-path)">
	                                            <path id="close-2"
														data-name="close"
														d="M5.4,4,7.7,1.7A.967.967,0,0,0,7.7.3.967.967,0,0,0,6.3.3L4,2.6,1.7.3A.967.967,0,0,0,.3.3a.967.967,0,0,0,0,1.4L2.6,4,.3,6.3a.967.967,0,0,0,0,1.4A.908.908,0,0,0,1,8a.908.908,0,0,0,.7-.3L4,5.4,6.3,7.7a.967.967,0,0,0,1.4,0,.967.967,0,0,0,0-1.4Z"
														fill="#202124" />
	                                        </g>
	                                    </svg>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div class="float-right text-right">
						<h4 style="padding-left: 1190px;">총 금액</h4>
						 <h1 id="totalPrice" style="border-left-width: 50px;padding-left: 1120px;">원</h1>
					</div>
				</div>
			</div>
				<div class="row mt-4 d-flex align-items-center">
					<div class="col-sm-6 order-md-2 text-right">
						<input type="button" id="check_module" value="결제하기"
							class="btn btn-dark mb-4 btn-lg pl-5 pr-5" onclick='location.href="/cart/payment"'
							style="padding-left: 16px;border-left-width: 585px;border-right-width: 585px;">
					</div>
				</div>
		</div>
	</div>
</section>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function() {
	totalCal();
	$(".quan").change(function() {
		totalCal();
	})
	
	function totalCal() {
		// 이렇게 장바구니에 담긴 제품번호를 가져온다.
		var numList = [];
		<c:forEach items="${prodList}" var="product">
		numList.push("${product.prod_num}"); 
		</c:forEach>
		
		// 제품수량을 가져온다. (변경 내용까지 반영)
		var quanList = [];
		for(const prod of numList) {
			quanList.push($('#'+prod+"quan").val());
		}
		
		var objParams = {
				"numList" : numList,
				"quanList" : quanList
		}
		// 이제 이 데이터 두개만 전달해버리면 컨트롤러에서 계산하고, 총 금액을 전달해주면 됨/
		$.ajax({
			type: "post",
			data: {objParams: JSON.stringify(objParams)},
			url: "http://localhost:8081/cart/gettotal", //총가격 
			success: function(data) {
				 $('#totalPrice').text(data);
			},
			error: function(data) {
				alert('에러 발생');
			}
		})
	}
});

function deleteCart(id) {
	let prod_id = id;
	$.ajax({
		type: "post",
		data: {prod_id : prod_id},
		url: "http://localhost:8081/cart/deletecart",
		success: function(data){
			alert(data);
			window.location.reload();
		}
	})
}
</script>
<script>
	$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "/cart" + '"]').closest('li').addClass('active');
	});

</script> 


	<!-- Modal -->
	
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
	<p><br></p>
	<p><br></p>
	<p><br></p>
	

	<%@include file ="../views/include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->
<script>
const header=document.querySelector('header');
const nav = document.querySelector('nav');
const mobilebtn = document.querySelector('#mobilebtn');
const check = document.getElementsByName("menuBtn");
//웹상 메뉴 
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

	

</body>
</html>
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
	
    <!-- Slick -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slick.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slick-theme.css">

    <!-- Load map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
 
<style>
@import url('https://fonts.googleapis.com/css2?family=Aldrich&display=swap');
/* modal */
.modal_wrap {
    display: none;
    width: 100%;
    height: 30%; /* 모달 내리는 높이 조절 */
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
	z-index: 1;
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
<body style="padding-top: 100px;">
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
				<li class="menutitle"><input type="radio" id="menuBtn4" name="menuBtn"><label for="menuBtn4">ADMIN</label>
						<ul class="submenu">
							<li><a href="/login">2nd menu</a></li>
							<li><a href="#">2nd menu</a></li>
						</ul>
				</li> 
				<li class="side icon" style="padding-left: 84px;">
				    <a href="/user/loginPage" style="padding-right: 20px;">log in</a>
				    <a href="/agreement" style="padding-right: 20px;">sign up</a>
					<a id="modal_btn" href="#"><img src="<%=request.getContextPath()%>/resources/img/shchicon.png"></a>
					<a href="/user/info"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a>
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
	

    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                    ${product.prod_img_name }
                    </div>
                    <div class="row">
                        <!--Start Carousel Wrapper-->
                        <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                            <div class="carousel-inner product-links-wap" role="listbox">
                            </div>
                        </div>
                        <!--End Carousel Wrapper-->
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body" style="height: 552px;" >
                            <h1 class="h2"style="padding-bottom: 50px;">${product.prod_title }</h1>
                            <p class="h3 py-2"> 가격 : ${product.prod_price } ￦</p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                </li>
                                <li class="list-inline-item">
                                </li>
                            </ul>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                </li>
                                <li class="list-inline-item">
                                </li>
                            </ul>
                            <form action="${pageContext.request.contextPath}/product/detail/${product.prod_num}/payment"
                             method="post">
                                <input type="hidden" name="product-title" value="Activewear">
                                <div class="row">
                                    <div class="col-auto">
                                    </div>
                                    <div class="form-group" style="text-align: left;">
			                      	<span style="padding-top: 50px;padding-bottom: 50px;"> 멀티헬스는 전 상품 무료배송입니다. <br><br></span> 
		                           	</div>

                                    
                                    <section>재고 : ${product.prod_inventory } 개 <br><br></section>
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                수량을 선택해주세요
                                               <input class="form-control text-center me-3" id="inputQuantity"
							type="number" name="order_count" value="1" min="1"
							style="max-width: 10rem;margin-top: 5px;" />
                                        </ul>
                                    </div>
                                    </div>
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                        <button id="check_module" type="button" class="btn btn-dark btn-lg" value="buy" >Buy</button> 
                                      
                                    </div>
                                    
                                    <div class="col d-grid">
                                    <input type="hidden" name=prod_num id="prod_num" value="${product.prod_num }"/>
                                        <button type="button" class="btn btn-dark btn-lg" id="insertCart" 
                                        >Add To Cart</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->
		<div class="row about_product" style="text-align: center;" width="1000px">
			<h1 class="page-header" style="padding-top: 100px;padding-bottom: 50px;">상품 상세</h1>
		</div>
    <div id="wrap">
  <div class="center">
    <section> ${product.prod_description_name }</section>
  </div>
</div>
<!-- //wrap -->

    <section class="py-5"style="display:none">
    </section>

<%@include file ="../views/include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->
 

    <!-- <!-- Start Script -->
    <%--<script src="<%=request.getContextPath() %>/resources/js/jquery-1.11.0.min.js"></script> --%>
    <script src="<%=request.getContextPath() %>/resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/templatemo.js"></script>
    <%-- <script src="<%=request.getContextPath() %>/resources/js/custom.js"></script> --%>
    <!-- End Script -->

    <!-- Start Slider Script -->
    <script src="<%=request.getContextPath() %>/resources/js/slick.min.js"></script>
    <script>
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            dots: true,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
    </script>
    <!-- End Slider Script -->
    <a href="#" class="btn_gotop">
  <span class="glyphicon glyphicon-chevron-up">
  </span>
</a>

<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 장바구니로 이동 -->
<script>
$('#insertCart').click(function() {
	//alert($('#inputQuantity').val());
    //alert($('#prod_num').val());

    let prod_num = $('#prod_num').val();
    let inputQuantity = $('#inputQuantity').val();
    
    console.log("상품번호",prod_num);
    console.log("수량",inputQuantity);
    $.ajax({
       type: "post",
       data: {prod_num : prod_num, product_count : inputQuantity},
       url: "http://localhost:8081/cart/insertcart",
       success: function(data){
          alert(data);
          window.location.href="http://localhost:8081/cart"
       }//succee
    })//ajax end
})
	$("#check_module").click(function() {
		let inputQuantity = $("#inputQuantity").val();
		let price =Number(inputQuantity*${product.prod_price})
		var IMP = window.IMP; // 생략가능
		IMP.init('imp26042582');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg : 'inicis', 
			/*
			 'kakao':카카오페이,
			 html5_inicis':이니시스(웹표준결제)
			 'nice':나이스페이
			 'jtnet':제이티넷
			 'uplus':LG유플러스
			 'danal':다날
			 'payco':페이코
			 'syrup':시럽페이
			 'paypal':페이팔
			 */

			pay_method : 'card',
			/*
			 'samsung':삼성페이,
			 'card':신용카드,
			 'trans':실시간계좌이체,
			 'vbank':가상계좌,
			 'phone':휴대폰소액결제
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/*
			 merchant_uid에 경우
			 https://docs.iamport.kr/implementation/payment
			 */
			name : `${product.prod_title}`,
			//결제창에서 보여질 이름
			amount : price,
			//가격
			buyer_email : `${user.username}`,
			buyer_name : `${user.m_name}`,
			buyer_tel : `${user.m_hp}`,
			buyer_addr : `${user.m_add1}`,
			buyer_postcode : `${user.m_add2}`,
			m_redirect_url : 'http://localhost:8081/payments/complete'
			// 결제창에서 보여질 유저이름 
		
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				$("#submit").click(); //테스트용
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				$("#submit").click(); //테스트용
			}
			alert(msg);
		});
	});
</script>
<script>
   $(document).ready(function() {
      $('li.active').removeClass('active');
      $('a[href="' + "/product" + '"]').closest('li').addClass('active');
   });
</script>



<!--  맨위로 버튼 -->
<style>
.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:999;
	border:1px solid #ccc;
	outline:none;
	background-color:black;
	color:#333;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}
</style>

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


<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script>

</body>

</html>
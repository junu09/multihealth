<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sub.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mall.css"> <!-- 이건 payment 만 따로 -->
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
	nav > ul > .icon {width:20%;margin:20px 10px 0 0; }
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
							<li><a href="/review/reviewlist">REVIEW</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
				</li>
				<li  class="menutitle"id="admin" style="display:none"; ><input type="radio" id="menuBtn4" name="menuBtn"><label for="menuBtn4">ADMIN</label>
						<ul class="submenu">
							<li><a href="/login">2nd menu</a></li>
						</ul>
				</li>
				<li class="side icon">
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

	<div id="wrap">
		<div class="container">
			<form action="${pageContext.request.contextPath}/cart" method="get">
				<section class="sub-content order pb-0">
					<br>
					<br>
					<div class="title-area">
						<h2 class="page-title"
							style="margin-left: 20px;"">주문결제</h2>
					</div>

					<div class="lay-st-payment">
						<div class="center-cont-area"
							style="margin-left: 50; margin-left: 300px; margin-right: 250px;">
							<!-- 주문상품 -->
							<div class="cont-group mt0">
								<br>
								<br>
								<div class="toggle-title">
									<h3 class="cont-tit" style="padding-bottom: 70px;padding-left: 310px;padding-top: 30px;">주문상품</h3>
								</div>
								<div class="toggle-content open">
									<!--  table -->
									<table class="tbl-st-col order">
										<colgroup>
											<col style="width: 18.5%;" />
											<col style="width: auto;" />
											<col style="width: 20.98%;" />
											<col style="width: 20.98%;" />
											<col style="width: 60px;" />
										</colgroup>
										<tbody>
											<!--  반복 -->
											<c:forEach var="prod" items="${prodList}" varStatus="status">
												<tr>
													<td class="product-img">${prod.prod_img_name}</td>
													<!-- 반복2 a hreft 똑같이, 상품명,  -->
													<td class="product-info">
														<p class="tit">${prod.prod_title}</p>
														<p class="count">개수 :
															${cartList[status.index].product_count} 개</p>
													</td>
													<td class="price">가격 : ${prod.prod_price} ￦</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- // table -->
								</div>
							</div>
							<!-- //주문상품 -->

							<!-- 주문자 정보 -->
							<div class="cont-group mt0">
								<div class="payment-info payment-box pb-0"
									style="border-top: 3px solid black; margin-top: 45px;">
									<br>
									<br>
									<div class="toggle-title">
										<h3 class="cont-tit" style="padding-bottom: 30px;padding-left: 310px;">주문자 정보</h3>
									</div>
									<div class="toggle-content open">
										<!-- txt-box -->
										<div class="txt-box ty02 write-form" style="padding-left: 100px;">
											<!--  table -->
											<table>
												<colgroup>
													<col style="width: 120px;" />
													<col style="width: auto;" />
												</colgroup>


												<sec:authorize access="isAuthenticated()">
													<sec:authentication property="principal" var="user" />
												</sec:authorize>

												<tbody>
													<tr>
														<th class="">이름</th>
														<td><input type="text" class="inp-txt"
															value="${user.m_name }"
															style="text-align: center; width: 408px; height: 36px;"
															disabled /></td>
													</tr>
													<tr>
														<th class="">휴대폰번호</th>
														<td><input type="text" class="inp-txt"
															value="${user.m_hp }"
															style="text-align: center; width: 408px; height: 36px;"
															disabled /></td>
													</tr>

													<tr>
														<th scope="row" class="">이메일</th>
														<td><input type="text" class="inp-txt"
															value="${user.username }"
															style="text-align: center; width: 408px; height: 36px;"
															disabled /></td>
													</tr>
													<tr>
														<th scope="row" class="">주소</th>
														<td><input type="text" class="inp-txt"
															value="${user.m_add1}"
															style="text-align: center; width: 408px; height: 36px;"
															disabled /></td>
													</tr>

													<tr>
														<th scope="row" class="">상세주소</th>
														<td><input type="text" class="inp-txt"
															value="${user.m_add2}"
															style="text-align: center; width: 408px; height: 36px;"
															disabled /></td>
														<br>
													</tr>
												</tbody>
											</table>
											<!--  //table -->
										</div>
										<!-- //txt-box -->






										<!-- txt-box -->
										<div class="txt-box ty02 write-form">
											<div class="payment-info payment-box pb-0"
												style="border-top: 3px solid black; margin-top: 60px;">
												<br>
												<br>
												<h3 class="cont-tit">
													결제금액 : <span id="" class="price"
														style="padding-left: 20px;">${totalPrice } 원</span>
												</h3>
												<br>
												<br>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- //txt-box -->
				</section>

				<!-- 배송정보수집 -->
				<div id="popDeliTerm" class="pop-wrap alert order"
					style="display: none;">
					<div class="pop-wrap-inner">
						<div class="pop-cont-inner w660">
							<div class="pop-top-wrap">
								<h5 class="pop-tit ty02 bd-none">상품 주문 및 배송정보 수집</h5>
							</div>
							<div class="tbl-wrap">
								<table class="tbl-deli-term">
									<colgroup>
										<col width="15%">
										<col width="42.5%">
										<col width="42.5%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">수탁자</th>
											<th scope="col">위탁업무</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" rowspan="3">배송<br>서비스
											</th>
											<td>(주)멀캠, 입점사에서 사용하는 택배사 정보</td>
											<td>상품 및 경품의 배송</td>
										</tr>
										<tr>
											<td>우체국 EMS</td>
											<td>배송조회</td>
										</tr>
										<tr>
											<td>멀캠 영업소</td>
											<td>물류센터 업무 일체</td>
										</tr>
										<tr>
											<th scope="row">결제<br>처리
											</th>
											<td>NHN한국사이버결제주식회사, ㈜MultiCampus, 카카오페이, 페이코, 네이버페이</td>
											<td>신용카드, 휴대폰, 계좌이체 등을통한 결제처리</td>
										</tr>
										<tr>
											<th scope="row">본인<br>인증
											</th>
											<td>나이스평가정보</td>
											<td>휴대폰 본인인증</td>
										</tr>
										<tr>
											<th scope="row">알림<br>발송
											</th>
											<td>LGU+, 주식회사 케이티, ㈜ 카카오, NHN 주식회사, 휴머스온</td>
											<td>SMS 및 메세지 발송</td>
										</tr>
										<tr>
											<th scope="row">데이터<br>보관
											</th>
											<td>Amazon Web Services Inc.</td>
											<td>데이터 보관</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn-box">
								<a href="#" class="btn bg-gray03"
									onclick="layerPop.hide(this);return false;">창닫기</a>
							</div>
						</div>
					</div>
				</div>
				<!-- //배송정보수집 -->

				<!-- 환불규정 -->
				<div id="popRefund" class="pop-wrap alert order"
					style="display: none;">
					<div class="pop-wrap-inner">
						<div class="pop-cont-inner">
							<p class="txt">
								주문하실 상품, 가격, 배송정보, 할인내역, 환불규정등을 최종 확인하였으며, 구매에 동의합니다.<br>(전자상거래법
								제8조 제2항)
							</p>
							<div class="btn-box">
								<a href="#" class="btn bg-black"
									onclick="layerPop.hide(this);return false;">확인</a>
							</div>
						</div>
					</div>
				</div>
				<!-- //환불규정 -->


				<div class="btn-comm-wrap"
					style="padding-bottom: 150px; padding-top: 100px; width: 500px; padding-left: 125px; margin:0 auto; ">
					<input type="button" class="btn btn-dark btn-lg"
						onclick="history.back()" value="이전화면"
						style="margin-right: 50px; width: 130px;"> 
					<input type="button" class="btn btn-dark btn-lg"
						id="check_module" value="결제하기" style="margin-right: 50px; width: 130px;">
				</div>
			</form>
		</div>
	</div>
	<!-- //container -->


	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

	<script>
		$("#check_module").click(function() {
		 
				var msg = '결제가 완료되었습니다.';

			alert(msg);
				location.href="http://localhost:8081/"
		/* 	
			let inputQuantity = $("#inputQuantity").val();
			let price = parseInt($("#totalPrice").text());
			var IMP = window.IMP;
			IMP.init('imp26042582');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : 'inicis',
				 
				 'kakao':카카오페이,
				 html5_inicis':이니시스(웹표준결제)
				 'nice':나이스페이
				 'jtnet':제이티넷
				 'uplus':LG유플러스
				 'danal':다날
				 'payco':페이코
				 'syrup':시럽페이
				 'paypal':페이팔
				  

				pay_method : 'card',
				
				 'samsung':삼성페이,
				 'card':신용카드,
				 'trans':실시간계좌이체,
				 'vbank':가상계좌,
				 'phone':휴대폰소액결제
				  
				merchant_uid : 'merchant_' + new Date().getTime(),

				name : `${cartList.size() }` + "개의 상품",
				//결제창에서 보여질 이ruf
				amount : `${totalPrice}`,
				//가격
				buyer_email : `${user.username}`,
				buyer_name : `${user.m_name}`,
				buyer_tel : `${user.m_hp}`,
				buyer_addr : `${user.m_add1}`,
				buyer_postcode : `${user.m_add2}`,
				m_redirect_url : 'http://localhost:8081/cart'

			},  function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					$("#submit").click(); //테스트용
				}
				alert(msg);
			});*/
		});
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




	<%@include file="../views/include/footer.jsp"%>
	<!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->
	
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
			menutitles[i].style.width = 15+ '%';
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



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fullpage.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slide.css" />
    <script src="<%=request.getContextPath() %>/resources/js/jquery-1.10.2.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
    <!--flugin-->
    <script src="<%=request.getContextPath() %>/resources/js/jquery.fullpage.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/slide.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.counterup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/templatemo.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Aldrich&display=swap');
* {margin:0; padding:0;}
ul li {list-style:none;}
.clearfix:after{content:'';display:block; clear:both;}
body {overflow-y:scroll; padding-top:100px;}
header {	
	background:linear-gradient(black 100px,rgba(33,41,51,0.7));
	height:100px;
	overflow:hidden;
	transition:height 0.4s;
	position: absolute;
	top:0;
	left:0;
	right:0;
}
input {
    position: fixed;
    left: -9999px;
}
nav {text-align:center; margin:0 auto;font-family: 'Aldrich', sans-serif; font-size:17px;}
nav > ul > li {float:left; line-height:100px; width:12%; margin:0 auto; color:white;}
nav > ul > .side{float:left; width:26%;}
nav > ul > .logo img{margin-top:20px; width:150px;}
nav > ul > .logo #mobilebtn img{display:none;}
nav > ul > .icon img{width:22px;margin:0 10px;}
nav > ul > li ul{ width:100%;}
nav > ul > li ul li{white-space:nowrap;line-height:50px;}
nav > ul > li ul li a{text-decoration: none; color:#9c9c9c; text-decoration: none; background-repeat: no-repeat; background-size: 0% 100%; transition: background-size 0.5s;}
nav > ul > li ul li a:hover{color:#cfcfcf; background-size: 100% 100%; background-image: linear-gradient(transparent 30%, #005ae2 40%);}
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
				
				<div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>

				
					<a href="#"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a>
					<a href="#"><img src="<%=request.getContextPath()%>/resources/img/cart.png"></a>
				</li>											
			</ul>
			
	</nav>
	
</header>
<!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
 <!--contents-->
      <div class="fullPageWrap">
        <div id="fullpage">
          <!--section1-->
          <div class="section" id="section1">
            <ul class="visual">
              <li
                class="list"
                style="background-image: url(resources/img/main_visual_01_01.jpg)"
              >
                <div class="textBox">
                  <p class="tit">멀티 헬스</p>
                  <p class="txt">Shopping & Fitness</p>
                  <p class="dot">멀티 헬스</p>
                </div>
              </li>
              <li
                class="list"
                style="background-image: url(resources/img/main_visual_01_02.jpg)"
              >
                <div class="textBox">
                  <p class="tit"><span>마냥 막막하던</span>운동 루틴</p>
                  <p class="txt">멀티헬스를 통해 편하게 구성해보세요.</p>
                  <p class="dot">편하게 구성하는<br />나만의 루틴</p>
                </div>
              </li>
              <li
                class="list"
                style="background-image: url(resources/img/main_visual_01_03.jpg)"
              >
                <div class="textBox">
                  <p class="tit"><span>전문적인</span>멀티헬스</p>
                  <p class="txt">
                    여러 전문가들의 데이터를 바탕으로 구성되었습니다.
                  </p>
                  <p class="dot">
                    전문적인<br />
                    멀티헬스
                  </p>
                </div>
              </li>
              <li
                class="list"
                style="background-image: url(resources/img/main_visual_01_04.jpg)"
              >
                <div class="textBox">
                  <p class="tit"><span>엄격한</span>멀티헬스</p>
                  <p class="txt">검증된 상품들만 엄선하였습니다.</p>
                  <p class="dot">
                    엄격한<br />
                    멀티헬스
                  </p>
                </div>
                <!--TODO : 슬라이드 시간간격 증가-->
              </li>
            </ul>
          </div>

          <!--section2-->
          <div class="section" id="section2">
            <div class="inner">
              <p class="tit">막막하고 두려웠던 운동<br />멀티헬스와 함께.</p>
              <div class="countBox">
                <p class="count">15</p>
                <p class="txt">멀티헬스 누적 회원수</p>
              </div>
            </div>
          </div>

          <!--section3-->
          <div class="section" id="section3">
            <div class="inner">
              <div class="topBox">
                <p class="tit">운동,<span>모두가 전문가가 되는 날까지</span></p>
                <a href="#" class="btn">전체 상품 보기</a>
              </div>
              <div class="bottomBox">
                <ul>
                  <li>
                    <p class="img">
                      <img src="<%=request.getContextPath()%>/resources/img/icon_01.png" alt="" />
                    </p>
                    <p class="data">
                      <span class="count2">92</span>
                    </p>
                    <p class="txt">총 상품수</p>
                  </li>
                  <li>
                    <p class="img">
                      <img src="<%=request.getContextPath()%>/resources/img/icon_02.png" alt="" />
                    </p>
                    <p class="data"><span class="count2">5,000</span></p>
                    <p class="txt">주문 가구 수</p>
                  </li>
                  <li>
                    <p class="img">
                      <img src="<%=request.getContextPath()%>/resources/img/icon_03.png" alt="" />
                    </p>
                    <p class="data">
                      <span class="count2">1000</span><strong>억</strong>
                    </p>
                    <p class="txt">매출액 <span>( 2022년 기준)</span></p>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <!--section4-->
          <div class="section" id="section4">
            <div class="inner">
              <div class="topBox">
                <p class="txt">어렵고 막막했던</p>
                <p class="tit"><span>운동 루틴</span></p>
              </div>
              <ul class="bottomBox">
                <li class="right">
                  <a href="#">
                    <span class="img01"
                      ><img src="<%=request.getContextPath()%>/resources/img/exercise.png" alt=""
                    /></span>
                  </a>
                  <p class="txt">멀티헬스 <strong>운동루틴 보기</strong></p>
                </li>
              </ul>
            </div>
          </div>

          <!--section6-->
          <div class="section" id="section5">
            <div class="inner">
              <div class="topBox">
                <p class="tit">멀티헬스 <span>HOT</span></p>
              </div>
              <div class="bottomBox">
                <ul class="snsList">
                  <li>
                    <a href="#"><img src="<%=request.getContextPath()%>/resources/img/product_1.jpg" alt="" /></a>
                  </li>
                  <li>
                    <a href="#"><img src="<%=request.getContextPath()%>/resources/img/product_1.jpg" alt="" /></a>
                  </li>
                  <li>
                    <a href="#"><img src="<%=request.getContextPath()%>/resources/img/product_1.jpg" alt="" /></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
           <!--footer-->
          <div class="section fp-auto-height">
            <div class="footer">
              <div class="topBox">
                <ul>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보 취급관리</a></li>
                  <li><a href="#">고객의 소리</a></li>
                </ul>
              </div>
              <div class="bottomBox">
                <h2><img src="img/logo.png" alt="포메인" /></h2>
                <ul class="add">
                  <li>상호 : asdf | 주소 : asdf</li>
                  <li>대표 전화 : 1234-5678 | 사업자등록번호 : 123-456-789</li>
                  <li>ⓒ multihealth</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
           <!--right Navbar-->
        <ul class="rightNav" id="rightNav">
          <li data-menuanchor="firstPage" class="active">
            <a href="#firstPage"><span>메인</span></a>
          </li>
          <li data-menuanchor="secondPage">
            <a href="#secondPage"><span>소개</span></a>
          </li>
          <li data-menuanchor="thirdPage">
            <a href="#thirdPage"><span>상품</span></a>
          </li>
          <li data-menuanchor="fourthPage">
            <a href="#fourthPage"><span>서비스</span></a>
          </li>
          <li data-menuanchor="fifthPage">
            <a href="#fifthPage"><span>HOT</span></a>
          </li>
        </ul>
      </div>
    </div>
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

</script>
</body>
</html>
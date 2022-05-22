<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@include file ="../views/include/index_header.jsp" %> <!-- 공통헤더 삽입 -->
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
                  <p class="tit">MULTI HEALTH</p>
                  <p class="txt">Shopping & Fitness</p>
                  <p class="dot">멀티 헬스</p>
                </div>
              </li>
              <li
                class="list"
                style="background-image: url(resources/img/main_visual_01_04.jpg)"
              >
                <div class="textBox">
                  <p class="tit"><span>SERVICE</span>PT ROUTIN</p>
                  <p class="txt">멀티헬스를 통해 편하게 구성해보세요.</p>
                  <p class="dot">편하게 구성하는<br />나만의 루틴</p>
                </div>
              </li>
              <li
                class="list"
                style="background-image: url(resources/img/main_visual_01_05.jpg)"
              >
                <div class="textBox">
                  <p class="tit"><span>PROFESSIONAL</span>MULTI HEALTH</p>
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
                  <p class="tit"><span>VERIFIED PRODUCT</span>MULTI HEALTH</p>
                  <p class="txt">검증된 상품들만 엄선하였습니다.</p>
                  <p class="dot">
                    엄격한<br />
                    멀티헬스
                  </p>
                </div>
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
                <a href="/productlist" class="btn" >전체 상품 보기</a>
              </div>
              <div class="bottomBox">
                <ul style="padding-top: 30px;padding-bottom: 60px;">
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
                    <p class="txt">총 주문수</p>
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
                <sec:authorize access="isAnonymous()">
                	<a href="/user/loginPage">
                    <span class="img01">
                    <c:forEach items="${exercisetypelist}" var="dto" >
                    	<img src="<%=request.getContextPath() %>resources/images/${dto.et_img1}.jpg" alt="..." style=" padding-left:20px; width:200px;">
                    </c:forEach>
                    </span>
                  </a>
                </sec:authorize>
               	<sec:authorize access="isAuthenticated()">
               		<a href="/ptservice/ptmain">
	               		<span class="img01">
	                    <c:forEach items="${exercisetypelist}" var="dto" >
	                    	<img src="<%=request.getContextPath() %>resources/images/${dto.et_img1}.jpg" alt="..." style=" padding-left:20px; width:200px;">
	                    </c:forEach>
	                    </span>
                  	</a>
               	</sec:authorize>
                  <p class="txt">멀티헬스 <strong>운동루틴 보기</strong></p>
                </li>
              </ul>
            </div>
          </div>
           <!--footer-->
          <div class="section fp-auto-height" style="display:none">
            <div class="footer">
              <div class="topBox">
              </div>
              <div class="bottomBox">
                <h2><img src="img/logowhite.png" alt="" /></h2>
                <ul class="add">
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
        </ul>
      </div>
    </div>
</body>
</html>
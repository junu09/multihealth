<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="user" />
	</sec:authorize>
 
 	<!-- main styles -->
 	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo.css">
   	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fullpage.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slide.css" />
    
 
  	<!-- nav styles -->
 	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/nav.css" />
 <!-- search -->
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
  
	<!-- modal style -->
  	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/modal.css" />
  </head>
  <body>
    <!-- Header -->
    
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
					<sec:authorize access="isAnonymous()"><li class="menutitle"><input type="radio" id="menuBtn2" name="menuBtn"><label for="menuBtn2">PT SERVICE</label>
							<ul class="submenu">
								<li><a href="/user/loginPage">PT ROUTIN</a></li>
								<li><a href="/user/loginPage">ROUTIN LIST</a></li>
								<li><a href="/user/loginPage">SPECIALT PT</a></li>
							</ul>
					</li></sec:authorize>
					<sec:authorize access="hasAuthority('ADMIN') or hasAuthority('USER')"><li class="menutitle"><input type="radio" id="menuBtn2" name="menuBtn"><label for="menuBtn2">PT   SERVICE</label>
							<ul class="submenu">
								<li><a href="/ptservice/ptmain">PT ROUTIN</a></li>
								<li><a href="/ptservice/ptroutinelist">ROUTIN LIST</a></li>
								<li><a href="/ptservice/specialpt">SPECIALT PT</a></li>
							</ul>
					</li></sec:authorize>
					<li class="menutitle"><input type="radio" id="menuBtn3" name="menuBtn"><label for="menuBtn3">COMMUNITY</label>
							<ul class="submenu">
								<li><a href="/review/reviewlist">REVIEW</a></li>
								<li><a href="/announce/announcelist">ANNOUNCEMENT</a></li>
							</ul>
					</li>
					<sec:authorize access="hasAuthority('ADMIN')"><li  class="menutitle"id="admin"><input type="radio" id="menuBtn4" name="menuBtn"><label for="menuBtn4">ADMIN</label>
							<ul class="submenu">
								<li><a href="/admin/admininsert">?????? ??????</a></li>
								<li><a href="/admin/adminselect">?????? ?????? ??? ?????? ??????</a></li>
							</ul>
					</li></sec:authorize>
					<li class="side icon">
					   	<sec:authorize access="isAnonymous()"><a href="/user/loginPage" style="padding-right: 20px;">log in</a></sec:authorize>
					   	<sec:authorize access="isAuthenticated()"><a href="/user/logout" style="padding-right: 20px;">Log Out</a></sec:authorize>
					    <sec:authorize access="isAnonymous()"><a href="/agreement" style="padding-right: 20px;">sign up</a></sec:authorize>
						<a id="two" href="#none" class="button"><img src="<%=request.getContextPath()%>/resources/img/shchicon.png"></a>
						<sec:authorize access="isAnonymous()"><a href="/user/loginPage"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a></sec:authorize>
						<sec:authorize access="isAuthenticated()"><a href="/user/info"><img src="<%=request.getContextPath()%>/resources/img/user.png"></a></sec:authorize>
						<sec:authorize access="isAnonymous()"><a href="/user/loginPage"><img src="<%=request.getContextPath()%>/resources/img/cart.png"></a></sec:authorize>
						<sec:authorize access="isAuthenticated()"><a href="/cart"><img src="<%=request.getContextPath()%>/resources/img/cart.png"></a></sec:authorize>
					</li>											
				</ul>
				
		</nav>
	</header>
    <!-- Close Header -->
<div id="modal-container">
	<div class="modal-background">
		<div class="modal">
			<h2>Search</h2>
			<div class="modal_close"><img src="<%=request.getContextPath()%>/resources/img/close.png"></div>
			<br><br><br>
			<form id="testform" class="form-control" name="testform" onsubmit="return false">
				<input type="text" id="testText" placeholder="????????? ???????????????" style="width:45%;">
				<input type="button" id="btnsubmit" class="btn btn-secondary" value="Click" />
			</form>
		</div>
	</div>
</div>
   <!-- main js -->    

	<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<%--     <script src="<%=request.getContextPath() %>/resources/js/jquery-1.10.2.min.js"></script> --%>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/jquery.fullpage.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/slide.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.counterup.min.js"></script> 
    
   <!-- nav js -->
   <script src="<%=request.getContextPath() %>/resources/js/nav.js"></script>
</body>
</html>
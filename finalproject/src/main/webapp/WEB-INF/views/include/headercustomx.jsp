<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <link rel="apple-touch-icon" href="<%=request.getContextPath() %>/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/img/favicon.ico">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo.css">
    

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome.min.css">

    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/slick-theme.css">


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





   
    <!-- Header -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-light logo h1 align-self-center" href="/">
                MultiHealth
            </a>

            <button class="navbar-toggler border-0 navbar-dark" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link text-white" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="/productlist">SHOP</a>
                        </li>
                        <li class="nav-item">
                            <sec:authorize access="hasAuthority('ADMIN') or hasAuthority('USER')"><a class="nav-link text-white" href="/ptservice/ptmain">PT</a></sec:authorize>
                            <sec:authorize access="isAnonymous()"><a class="nav-link text-white" href="/user/loginPage">Log In</a></sec:authorize>
                            
                        </li>
                        <li class="nav-item">
                            <sec:authorize access="isAnonymous()"><a class="nav-link text-white" href="/agreement">Sign Up</a></sec:authorize>
                            <sec:authorize access="isAuthenticated()"><a class="nav-link text-white" href="/user/logout">Log Out</a></sec:authorize>
                        </li>
                        <li class="nav-item">
                        	<sec:authorize access="hasAuthority('ADMIN')"><a class="nav-link text-white" href="/admin/adminselect">ADMIN</a></sec:authorize>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <!-- <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-white mr-2"></i> 상품검색
                    </a> -->
                    <a class="nav-icon position-relative text-decoration-none" href="/cart">
                        <i class="fa fa-fw fa-cart-arrow-down text-white mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                    </a>
                    <sec:authorize access="isAnonymous()"><a class="nav-icon position-relative text-decoration-none" href="/agreement">
                        <i class="fa fa-fw fa-user text-white mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                    </a></sec:authorize>
                    <sec:authorize access="hasAuthority('ADMIN') or hasAuthority('USER')"><a class="nav-icon position-relative text-decoration-none" href="/user/info">
                        <i class="fa fa-fw fa-user text-white mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                    </a></sec:authorize>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->

</body>
</html>
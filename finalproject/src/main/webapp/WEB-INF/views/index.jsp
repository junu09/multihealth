<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<head>
    <title>MultiHealth</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body>
 
<%@include file ="../views/include/header.jsp" %> <!-- 공통헤더 삽입 -->

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



    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<%=request.getContextPath() %>/resources/img/banner_img_01.png" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>Multihealth</b></h1>
                                <h3 class="h2">멀티헬스와 함께<br> 건강한 생활을 꾸려가보세요</h3>
                                <p>
                                    멀티헬스가 제공하는 다양한 상품과<br> 서비스로 자신만의 헬스케어를 완성시켜보세요. 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<%=request.getContextPath() %>/resources/img/banner_img_02.png" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">루틴 서비스</h1>
                                <h3 class="h2">나만의 운동 루틴 정해보기</h3>
                                <p>
                                    멀티헬스는 다양한 운동 루틴을 제공합니다.<br> 본인만의 운동 루틴을 정하면서<br> 포인트도 쌓아보세요!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<%=request.getContextPath() %>/resources/img/banner_img_03.png" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">헬스 상품 쇼핑몰</h1>
                                <h3 class="h2">헬스케어를 도와줄<br> 다양한 상품들</h3>
                                <p>
                                    멀티헬스는 헬스케어를 도와줄<br> 다양한 상품들을 판매하고 있습니다.<br> 엄격하고 까다로운 기준으로 선별된<br> 다양한 상품들을 구매하여<br> 효율적인 헬스케어를 꾸려가세요!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">베스트 상품들</h1>
                <p>
                    멀티헬스에서 추천하는 이달의 베스트 상품들입니다.
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="/productlist"><img src="<%=request.getContextPath() %>/resources/img/protein1.jpg" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">Protein</h5>
                <p class="text-center"><a href="/productlist" class="btn btn-success">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="/productlist"><img src="<%=request.getContextPath() %>/resources/img/yoga1.jpg" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Yoga&Pilates</h2>
                <p class="text-center"><a href="/productlist" class="btn btn-success">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="/productlist"><img src="<%=request.getContextPath() %>/resources/img/ex1.jpg" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Accessories</h2>
                <p class="text-center"><a href="/productlist" class="btn btn-success">Go Shop</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->

    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">추천 루틴</h1>
                    <p>
                        멀티헬스에서 추천하는 루틴을 확인해보세요!!
                    </p>
                </div>
            </div>
            <div class="row">
            <c:forEach items="${exercisetypelist}" var="dto" >
	                <div class="col-12 col-md-4 mb-4">
	                    <div class="card h-100">
	                    	<sec:authorize access="isAnonymous()"><a href="/user/loginPage">
	                            <img src="<%=request.getContextPath() %>resources/images/${dto.et_img1}.jpg" class="card-img-top" alt="...">
	                        </a></sec:authorize>
	                        <sec:authorize access="isAuthenticated()"><a href="/ptservice/ptmain">
	                            <img src="<%=request.getContextPath() %>resources/images/${dto.et_img1}.jpg" class="card-img-top" alt="...">
	                        </a></sec:authorize>
	                        <div class="card-body">
	                         <c:choose>
	                        	<c:when test="${dto.et_lv eq '1' }"> 
		                         	<ul class="list-unstyled d-flex justify-content-between">
		                                <li>
		                                    <i class="text-warning fa fa-star"></i>
		                                    <i class="text-muted fa fa-star"></i>
		                                    <i class="text-muted fa fa-star"></i>
		                                    <i class="text-muted fa fa-star"></i>
		                                    <i class="text-muted fa fa-star"></i>
		                                </li>
		                                <li class="text-muted text-right">${dto.et_name}</li>
		                            </ul>
		                            <sec:authorize access="isAnonymous()"><a href="/user/loginPage" class="h2 text-decoration-none text-dark">PT Routine</a></sec:authorize>
		                            <sec:authorize access="isAuthenticated()"><a href="/ptservice/ptmain" class="h2 text-decoration-none text-dark">PT Routine</a></sec:authorize>
		                            <p class="card-text">
		                                시작이 어렵다면 가벼운운동으로 루틴을 시작하세요.
		                            </p>
		                       </c:when>
		                       <c:when test="${dto.et_lv eq '2' }"> 
		                         	<ul class="list-unstyled d-flex justify-content-between">
		                                <li>
		                                    <i class="text-warning fa fa-star"></i>
		                                    <i class="text-warning fa fa-star"></i>
		                                    <i class="text-warning fa fa-star"></i>
		                                    <i class="text-muted fa fa-star"></i>
		                                    <i class="text-muted fa fa-star"></i>
		                                </li>
		                                <li class="text-muted text-right">${dto.et_name}</li>
		                            </ul>
		                            <sec:authorize access="isAnonymous()"><a href="/user/loginPage" class="h2 text-decoration-none text-dark">PT Routine</a></sec:authorize>
		                            <sec:authorize access="isAuthenticated()"><a href="/ptservice/ptmain" class="h2 text-decoration-none text-dark">PT Routine</a></sec:authorize>
		                            <p class="card-text">
		                           		꾸준한 운동을 통해 건강을 관리하고 싶다면 루틴을 시작하세요.
		                            </p>
		                       </c:when>
		                        <c:otherwise> 
		                         	<ul class="list-unstyled d-flex justify-content-between">
		                                <li>
		                                    <i class="text-warning fa fa-star"></i>
		                                    <i class="text-warning fa fa-star"></i>
		                                    <i class="text-warning fa fa-star"></i>
		                                    <i class="text-warning fa fa-star"></i>
		                                    <i class="text-warning fa fa-star"></i>
		                                </li>
		                                <li class="text-muted text-right">${dto.et_name}</li>
		                            </ul>
		                            <sec:authorize access="isAnonymous()"><a href="/user/loginPage" class="h2 text-decoration-none text-dark">PT Routine</a></sec:authorize>
		                            <sec:authorize access="isAuthenticated()"><a href="/ptservice/ptmain" class="h2 text-decoration-none text-dark">PT Routine</a></sec:authorize>
		                            <p class="card-text">
		                             	체계적인 운동관리를 원한다면 루틴을 시작하세요.
		                            </p>
		                       </c:otherwise>
	                         </c:choose>                            
	                        </div>
	                    </div>
	                </div>
                </c:forEach> 
            </div>
        </div>
    </section>
    <!-- End Featured Product -->

<%@include file ="../views/include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->

</body>

</html>
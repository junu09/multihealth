<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MultiHealth</title>

<meta name="viewport" content="width=device-width, initial-scale=1"> 
<%@include file ="../views/include/sub_header.jsp" %>

</head>
<body>

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
				<div class="col-lg-9 m-auto tempaltemo-carousel" style="display:none">
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
<<<<<<< HEAD
	<!-- End Script -->
=======
>>>>>>> refs/remotes/origin/seoa
</body>
</html>
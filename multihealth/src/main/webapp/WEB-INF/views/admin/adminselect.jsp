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
	
</head>


<body>
<%@include file ="../include/sub_header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/testboot.css">
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
	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="h2 pb-4">Admin</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> 상품 <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><a class="text-decoration-none" href="admininsert">상품
									등록</a></li>
							<li><a class="text-decoration-none" href="adminselect">상품
									조회 및 수정 삭제</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">상품
									조회</a></li>
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
								onchange="chageLangSelect(1)">
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
					<c:forEach items="${productlist }" var="dto">
						<div class="col-md-4">
							<div class="card mb-4 product-wap rounded-0">
								<div class="card rounded-0">
									${dto.prod_img_name }
									<div
										class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
										<ul class="list-unstyled">											
											<li><a class="btn btn-success text-white mt-2"
												href="adminmodify?productnum=${dto.prod_num }"><i class="fab fa-medium-m"></i></a></li>
											<li><a class="delete_modal btn btn-success text-white mt-2" href="#" data-bs-toggle="modal" data-bs-target="#delete_modal" data-num="${dto.prod_num }"
											    ><i class="fas fa-trash"></i></a></li>
										</ul>
									</div>
								</div>
								
								<!-- Modal -->
								<div class="modal fade bg-white" id="delete_modal"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-lg" role="document">
	
										
										<form action="admindelete" method="get"
											class="modal-content modal-body border-0 p-0" >
											<h1 style="text-align: center;">삭제하시겠습니까?</h1>
											<br>
											<br>
											<div>
												<input type="hidden" name=productnum id=productnum value="" />
												<div style="display: inline; float: left;">
													<button type="submit"
														class="input-group-text bg-primary text-light">
														<i class="fa fa-fw fa-check text-white"></i>
													</button>
												</div>
												<div style="display: inline-block; float:right;">
													<button type="button"
														class="input-group-text bg-primary text-light"
														data-bs-dismiss="modal" aria-label="Close">
														<i class="fa fa-fw fa-times text-white"></i>
													</button>
												</div>
											</div>	
										</form>
									</div>
								</div>
								<div class="card-body" style="display:inline-block; height:166px">
									<a style="display:inline-block; height:70px" href="#" class="h3 text-decoration-none">${dto.prod_title }</a>
									<ul
										class="w-100 list-unstyled d-flex justify-content-between mb-0">
										<li class="pt-2"><span
											class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
											<span
											class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
											<span
											class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
											<span
											class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
											<span
											class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
										</li>
									</ul>
									<ul class="list-unstyled d-flex justify-content-center mb-1">
										<li><i class="text-warning fa fa-star"></i> <i
											class="text-warning fa fa-star"></i> <i
											class="text-muted fa fa-star"></i> <i
											class="text-muted fa fa-star"></i> <i
											class="text-muted fa fa-star"></i></li>
									</ul>
									<p class="text-center mb-0">${dto.prod_price }</p>
								</div>
							</div>
						</div>
					</c:forEach>

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
	<!-- End Script -->
</body>
</html>
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
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/review.css">
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
				<h1 class="h2 pb-4">Review</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> 리뷰 <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><a class="text-decoration-none" href="/review/reviewinsert">리뷰
									등록</a></li>
							<li><a class="text-decoration-none" href="/review/reviewlist">리뷰
									조회 및 수정 삭제</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">리뷰
									</a></li>
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
								onchange="chageLangSelect(1)" style="visibility:hidden;">
								<c:forEach items="${categorylist }" var="cdto"
									varStatus="status">
									<option value="${cdto.category_num}" <c:if test="${cdto.category_num eq category}">selected</c:if>>${cdto.category_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-3 pb-4">
						<div class="d-flex" style="visibility:hidden;">
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

								<div class="col-lg-9">
					<div class="row">
						<div class="col-md-10">
							<form class="form-horizontal" action="/review/reviewinsertresult" method="post"
								enctype="multipart/form-data">
								<input type=hidden name=r_num value=null><br>
								<input type=hidden name=prod_num value= ${product.prod_num }>
								<br>
								<div class="form-group">
									<label for="prod_title" class="col-sm-2 control-label">상품명</label>
									<div class="col-sm-10">
										<input type=text class="form-control" id=prod_title
											name=prod_title value="${product.prod_title}" readonly><br>
									</div>
								</div>
								<div class="form-group">
									<label for="prod_img" class="col-sm-2 control-label">이미지</label>
									<div class="col-sm-10">
										<input type=file class="form-control" id=r_image
											name="r_image"><br>
									</div>
								</div>
								<div class="form-group">
									<label for="prod_inventory" class="col-sm-2 control-label">별점</label>
									<div class="col-sm-10">
										<input type=text class="form-control" id=r_point
											name=r_point><br>
									</div>
								</div>
								<div class="form-group">
									<label for="prod_inventory" class="col-sm-2 control-label">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" rows="15" id=r_content
											name=r_content style="resize: none; background-color: #fff;"></textarea><br>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type=submit class="btn btn-primary">리뷰 등록</button>
									</div>
								</div>
							</form>
						</div>
					</div>
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
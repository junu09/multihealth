<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MultiHealth</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>
<body>
 <%@include file ="../include/sub_header.jsp" %> <!-- 공통헤더 삽입 -->
 
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
						<div class="col-md-10">
							<form class="form-horizontal" action="/admin/insertresult" method="post"
								enctype="multipart/form-data">
								<input type=hidden name=p_num value=null><br>
								<div class="form-group">
									<label for="category_num" class="col-sm-2 control-label">카테고리</label>
									<div class="col-sm-10">
										<select class="form-control" id="category_num"
											name="category_num" onchange="chageLangSelect(1)">
											<c:forEach items="${categorylist }" var="cdto"
												varStatus="status">
												<option value="${cdto.category_num}"
													<c:if test="${cdto.category_num eq category}">selected</c:if>>${cdto.category_name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label for="prod_title" class="col-sm-2 control-label">타이틀</label>
									<div class="col-sm-10">
										<input type=text class="form-control" id=prod_title
											name=prod_title><br>
									</div>
								</div>
								<div class="form-group">
									<label for="prod_price" class="col-sm-2 control-label">가격</label>
									<div class="col-sm-10">
										<input type=text class="form-control" id=prod_price
											name=prod_price><br>
									</div>
								</div>
								<div class="form-group">
									<label for="prod_inventory" class="col-sm-2 control-label">재고</label>
									<div class="col-sm-10">
										<input type=text class="form-control" id=prod_inventory
											name=prod_inventory><br>
									</div>
								</div>
								<div class="form-group">
									<label for="prod_img" class="col-sm-2 control-label">이미지</label>
									<div class="col-sm-10">
										<input type=file class="form-control" id=prod_img
											name="prod_img"><br>
									</div>
								</div>
								<div class="form-group">
									<label for="prod_description" class="col-sm-2 control-label">설명</label>
									<div class="col-sm-10">
										<input type=file class="form-control" id=prod_description
											name=prod_description><br>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type=submit class="btn btn-primary">상품 등록</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	

<%@include file ="../include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->

</body>
</html>
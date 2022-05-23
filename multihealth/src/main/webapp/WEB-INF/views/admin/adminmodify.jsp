<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MultiHealth</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<%@include file ="../include/sub_header.jsp" %>

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
									조회</a></li>
							<li><a class="text-decoration-none" href="#">상품 수정</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">상품
									수정</a></li>
						</ul>
					</div>
					<div class="col-md-3 pb-4">
						<div class="d-flex">
							<select class="form-control" id="selectbox" name="selectbox"
								onchange="chageLangSelect(1)">
								<option value="category_num">Category</option>
								<c:forEach items="${categorylist }" var="cdto"
									varStatus="status">
									<option value="${cdto.category_num}"
										<c:if test="${cdto.category_num eq category}">selected</c:if>>${cdto.category_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<form name="modifyform" class="form-horizontal"
							action="adminmodify?productnum=${admindto.prod_num }"
							method="post" enctype="multipart/form-data">
							<input type=hidden name=prod_num value='${admindto.prod_num }'><br>
							<div class="form-group">
								<label for="category_num" class="col-sm-2 control-label">카테고리</label>
								<div class="col-sm-10">
									<select class="form-control" id="category_num"
										name="category_num" onchange="chageLangSelect(1)">
										<c:forEach items="${categorylist }" var="cdto"
											varStatus="status">
											<option value="${cdto.category_num}"
												<c:if test="${cdto.category_num eq admindto.category_num}">selected</c:if>>${cdto.category_name}</option>
										</c:forEach>
									</select> <br>
								</div>
							</div>
							<div class="form-group">
								<label for="prod_title" class="col-sm-2 control-label">타이틀</label>
								<div class="col-sm-10">
									<input type=text class="form-control" id=prod_title
										name=prod_title value='${admindto.prod_title }'><br>
								</div>
							</div>
							<div class="form-group">
								<label for="prod_price" class="col-sm-2 control-label">가격</label>
								<div class="col-sm-10">
									<input type=text class="form-control" id=prod_price
										name=prod_price value='${admindto.prod_price }'><br>
								</div>
							</div>
							<div class="form-group">
								<label for="prod_inventory" class="col-sm-2 control-label">재고</label>
								<div class="col-sm-10">
									<input type=text class="form-control" id=prod_inventory
										name=prod_inventory value='${admindto.prod_inventory }'>
									<br>
								</div>
							</div>
							<div class="form-group">
								<label for="prod_img" class="col-sm-2 control-label">이미지</label>
								<div class="col-sm-10">
									${admindto.prod_img_name} 
									<input type=file class="form-control"
										id=prod_img name="prod_img"><br>
									<input type=hidden id=prod_img_before name=prod_img_before value='${admindto.prod_img_name}'>
								</div>
							</div>
							<div class="form-group">
								<label for="prod_description" class="col-sm-2 control-label">설명</a></label>
								<div class="col-sm-10">
									<details class=des>
										<summary>설명 미리보기</summary>
										<p>
											${admindto.prod_description_name}
										</p>
									</details>
									<input type=file class="form-control"
										id=prod_description name="prod_description"><br>
									<input type=hidden id=prod_description_before name=prod_description_before value='${admindto.prod_description_name}'>
								</div>
							</div><br> 
							<input type=hidden id=view_count name=view_count value='${admindto.view_count}'>
							<input type=hidden id=prod_point name=prod_point value='${admindto.prod_point}'>
							<input type="submit" style="float:left;" class="btn btn-primary" value="상품수정"/>
							<input type="button" style="float:right; margin-right:16%;" class="btn btn-primary" onclick="location.href = 'http://localhost:8081/admin/adminselect'" value="취소"/>
						</form>

					</div>



				</div>
			</div>

		</div>
	</div>
	<!-- End Content -->



<%@include file ="../include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->




	<script>
		function chageLangSelect(idx) {
			var pagenum = idx;
			var contentnum = $("#contentnum option:selected").val();
			var selectval = $("#selectbox option:selected").val(); // select element에서 선택된 option의 value가 저장된다.
			for (var i = 1; i < 22; i++) {
				if (selectval == i) {
					location.href = "http://localhost:8081/admin/adminselect?pagenum="
							+ pagenum
							+ "&contentnum="
							+ contentnum
							+ "&categorynum=" + selectval
				}
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			$("#prod_img").on('change', function() {
				readURL(this);
			});
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('.card-img').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			$("#prod_description").on('change', function() {
				readURL2(this);
			});
		});
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('.des img').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>


	<!-- End Script -->
</body>
</html>
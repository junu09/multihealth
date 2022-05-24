<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<title>상품 조회</title>
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
									조회 및 수정 삭제</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6" >
						<ul class="list-inline shop-top-menu pb-3 pt-1" style="text-align: center;">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">상품
									등록 성공</a></li>
						</ul>
					</div>
					<div class="col-md-3 pb-4">
					</div>
				</div>

				<div class="row" style="padding-left:25%; padding-right:25%">
				<p><br></p>
				<p><br></p>
				<p><br></p>
					<button class="btn btn-dark" onclick="location.href='http://localhost:8081/admin/admininsert'">상품 등록</button>
					<p><br></p>
					<button class="btn btn-dark" onclick="location.href='http://localhost:8081/admin/adminselect'">상품 조회</button>
				<p><br></p>
				<p><br></p>
				<p><br></p>
				</div>

			</div>

		</div>
	</div>
	<!-- End Content -->




<%@include file ="../include/footer.jsp" %> <!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->



	<!-- End Script -->
</body>
</html>
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
<%-- <%@include file ="../include/header.jsp" %> <!-- 공통헤더 삽입 --> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/review.css">
	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="h2 pb-4">공지사항</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> 공지사항 <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><a class="text-decoration-none" href="reviewlist">리뷰
									조회</a></li>
							<sec:authorize access="hasAuthority('USER')">
								<li><a class="text-decoration-none" href="ablereviewlist">리뷰
										등록</a></li></sec:authorize>
										<sec:authorize access="hasAuthority('USER')">
								<li><a class="text-decoration-none" href="ablereviewmod">리뷰
										수정</a></li></sec:authorize>
										<sec:authorize access="hasAuthority('USER')">
								<li><a class="text-decoration-none" href="ablereviewdel">리뷰
										삭제</a></li></sec:authorize>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">공지사항 등록하기
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
						<div class="d-flex" style="display:none;">
								<!-- 이거 9 18 27 -->
							<select class="form-control" name="contentnum" id="contentnum" onchange="page(1)" style="visibility:hidden;">
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
						<div class="col-md-10">
							<form class="form-horizontal" action="/announce/announceinsertresult" method="post"
								enctype="multipart/form-data">
								<input type=hidden name=a_num value=null><br>
								<div class="form-group">
									<label for="a_title" class="col-sm-2 control-label">타이틀</label>
									<div class="col-sm-10">
										<input type=text class="form-control" id=a_title
											name=a_title><br>
									</div>
								</div>
								<div class="form-group">
									<label for="prod_img" class="col-sm-2 control-label">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" rows="15" id=a_content
											name=a_content style="resize: none; background-color: #fff;"></textarea><br>
									</div>
								</div>
								<input type=hidden name=a_date value=now()><br>
								<input type=hidden name=a_count value=0><br>
							</form>
						</div>
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
	  if(contentnum == 9){
// 	    location.href="${pageContext.request.contextPath}/adminselect?pagenum="+pagenum+"&contentnum="+contentnum+"&categorynum="+selectval
		  location.href="http://localhost:8081/announce/announcelist?pagenum="+pagenum+"&contentnum="+contentnum
	  }else if(contentnum == 18){
	    location.href="http://localhost:8081/announce/announcelist?pagenum="+pagenum+"&contentnum="+contentnum
	
	  }else if(contentnum == 27){
	    location.href="http://localhost:8081/announce/announcelist?pagenum="+pagenum+"&contentnum="+contentnum
	
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
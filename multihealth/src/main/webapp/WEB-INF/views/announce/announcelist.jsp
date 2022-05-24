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
							<sec:authorize access="hasAuthority('ADMIN')"><li><a class="text-decoration-none" href="announceinsertform">공지사항
									등록</a></li></sec:authorize>
							<sec:authorize access="hasAuthority('ADMIN')">
								<li><a class="text-decoration-none" href="announcelist">공지사항
									조회</a></li>
							</sec:authorize>
							<sec:authorize access="isAnonymous() OR hasAuthority('USER')">
							<li><a class="text-decoration-none" href="announcelist">공지사항
									조회</a></li></sec:authorize>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">공지사항
									</a></li>
						</ul>
					</div>
					<div class="col-md-3 pb-4">
						<div class="d-flex">
							<select class="form-control" id="selectbox" " name="selectbox"
								onchange="chageLangSelect(1)" style="display:none">
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
					
						<div class="col-md-12">
						<table class="table">
							<thead>
							<tr>
								<th>제목</th>
								<th>날짜</th>
								<th>   </th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${announcelist }" var="dto" varStatus="status">
							<tr>
								<td><a href="http://localhost:8081/announce/announcedetail?anum=${dto.a_num}" style="color:#000;">${dto.a_title }</a></td>
								<td>${dto.a_date }</td>
								<sec:authorize access="hasAuthority('ADMIN')"><td><button class="delete_btn btn btn-secondary" value="${dto.a_num }">삭제</button></td></sec:authorize>
								
							</tr>
							</c:forEach>
							</tbody>
						</table>

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
	$(document).on("click", ".delete_btn", function () {
		
		 var a_num = $(this).val();
		 location.href="http://localhost:8081/announce/announcedelete?a_num="+a_num
	});
	</script>
	<!-- End Script -->
</body>
</html>
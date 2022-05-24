<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 
   <%@include file ="../views/include/sub_header.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mall.css"> <!-- 이건 payment 만 따로 -->

<div id="wrap">
		<div class="container">
			<form action="${pageContext.request.contextPath}/cart" method="get">
				<section class="sub-content order pb-0">
					<br>
					<br>
					<div class="title-area">
						<h2 class="page-title"
							style="margin-left: 20px;margin-bottom: 100px;"> 주문 상품 </h2>
							
							<!-- 주문 내역 내용 -->
			<div id="orderPage" class="pageSection" >
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th style="width: 25%">상품명</th>
								<th style="width: 25%">이미지</th>
								<th style="width: 25%">주문수량</th>
								<th style="width: 25%">결제 금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${orderList }">
								<tr>
									<%-- <td>${order.order_date }</td> --%>
									<td>${prod.prod_num }</td>
									<td>${order.o_count }</td>
									<td>${totalPrice }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-sm-6 order-md-2 text-right">
						<input type="button" value="홈으로 이동"
							class="btn btn-dark mb-4 btn-lg pl-5 pr-5" onclick='location.href="/cart'
							style="padding-left: 16px;border-left-width: 585px;border-right-width: 585px;margin-top: 100px;">
      					</div>
			         </div>
				   </div>
				</section>
			</form>
		</div>
	</div>

	<%@include file="../views/include/footer.jsp"%>
	<!-- 공통 푸터 삽입, css, js 파일 함유 jquery 포함-->
	
</body>
</html>
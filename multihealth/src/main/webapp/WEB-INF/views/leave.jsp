<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#delete-btn").click(function() {
			if (confirm("정말로 회원탈퇴 하시겠습니까?")) {
				// 폼 내부의 데이터를 전송할 주소
				document.form1.action = "/user/leave";
				document.form1.submit(); // 제출
				
			}
			location.replace('/user/loginPage');
		});		
	});
</script>

<%@include file ="../views/include/sub_header.jsp" %>

</head>
<body>


	<section class="container py-5">
		<div class="row text-center pt-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h2">정말로 탈퇴 하시겠습니까?</h1>
				<p style="color: red;">회원탈퇴를 진행하시면 계정을 복구할 수 없습니다.</p>
				<br>
				<p>그래도 원하시면 회원탈퇴 버튼을 눌러주세요.</p>
				
				<form name="form1" method="post" class="leavename">
					<div>
						아이디: <input type="email" class="form-control mt-1" id="email" name="m_mail" value="${user.username }" readonly="readonly">
					</div>
					<br>
					<br>
					<button id="delete-btn" class="leavebutton btn btn-danger">회원탈퇴</button>
				</form>
			</div>
		</div>
	</section>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
	<!-- Start Footer -->
			<footer class="bg-dark" id="tempaltemo_footer">
				<div class="container">
					<div class="row">

						<div class="col-md-4 pt-5">
							<h2 class="h2 text-light border-bottom pb-3 border-light logo">MultiHealth</h2>
							<ul class="list-unstyled text-light footer-link-list">
								<li><i class="fas fa-map-marker-alt fa-fw text-light"></i>
									서울특별시 강남구 대치동 889-41</li>
								<li><i class="fa fa-phone fa-fw text-light"></i> <a
									class="text-light" href="tel:1544-9001">1544-9001</a></li>
								<li><i class="fa fa-envelope fa-fw text-light"></i> <a
									class="text-light" href="mailto:erioll0@naver.com">erioll0@naver.com</a>
								</li>
							</ul>
						</div>

						<div class="col-md-4 pt-5">
							<h2 class="h2 text-light border-bottom pb-3 border-light">PRODUCT</h2>
							<ul class="list-unstyled text-light footer-link-list">
								<li><a class="text-light" href="/productlist?categorynum=1">Protein</a></li>
								<li><a class="text-light" href="/productlist?categorynum=4">Yoga&Pilates</a></li>
								<li><a class="text-light" href="/productlist?categorynum=12">Fitness Equiment</a></li>								
							</ul>
						</div>

						<div class="col-md-4 pt-5">
							<h2 class="h2 text-light border-bottom pb-3 border-light">PT</h2>
							<ul class="list-unstyled text-light footer-link-list">
								<sec:authorize access="isAnonymous()"><li><a class="text-light" href="/user/loginPage">PT</a></li></sec:authorize>
								<sec:authorize access="isAuthenticated()"><li><a class="text-light" href="/ptservice/ptmain">PT</a></li></sec:authorize>
								<sec:authorize access="isAnonymous()"><li><a class="text-light" href="/user/loginPage">Make Routine</a></li></sec:authorize>
								<sec:authorize access="isAuthenticated()"><li><a class="text-light" href="/ptservice/ptmain">Make Routine</a></li></sec:authorize>
								<sec:authorize access="isAnonymous()"><li><a class="text-light" href="/user/loginPage">Routine List</a></li></sec:authorize>
								<sec:authorize access="isAuthenticated()"><li><a class="text-light" href="/ptservice/ptmain">Routine List</a></li></sec:authorize>
								<sec:authorize access="isAnonymous()"><li><a class="text-light" href="/user/loginPage">Special PT</a></li></sec:authorize>
								<sec:authorize access="isAuthenticated()"><li><a class="text-light" href="/ptservice/ptmain">Special PT</a></li></sec:authorize>
							</ul>
						</div>
					</div>
					
					<div class="row text-light mb-4">
						<div class="col-12 mb-3">
							<div class="w-100 my-3 border-top border-light"></div>
						</div>
						<div class="col-auto me-auto">
							<ul class="list-inline text-left footer-icons">
								<li
									class="list-inline-item border border-light rounded-circle text-center">
									<a class="text-light text-decoration-none" target="_blank"
									href="http://facebook.com/"><i
										class="fab fa-facebook-f fa-lg fa-fw text-light"></i></a>
								</li>
								<li
									class="list-inline-item border border-light rounded-circle text-center">
									<a class="text-light text-decoration-none" target="_blank"
									href="https://www.instagram.com/"><i
										class="fab fa-instagram fa-lg fa-fw text-light"></i></a>
								</li>
								<li
									class="list-inline-item border border-light rounded-circle text-center">
									<a class="text-light text-decoration-none" target="_blank"
									href="https://twitter.com/"><i
										class="fab fa-twitter fa-lg fa-fw text-light"></i></a>
								</li>
								<li
									class="list-inline-item border border-light rounded-circle text-center">
									<a class="text-light text-decoration-none" target="_blank"
									href="https://www.linkedin.com/"><i
										class="fab fa-linkedin fa-lg fa-fw text-light"></i></a>
								</li>
							</ul>
						</div>
					</div>				
				</div>

				<div class="w-100 bg-black py-3">
					<div class="container">
						<div class="row pt-2">
							<div class="col-12">
								<p class="text-left text-light">
									Copyright &copy; 2021 Company Name | Designed by <a
										rel="sponsored" target="_blank">MultiHealth</a>
								</p>
							</div>
						</div>
					</div>
				</div>

			</footer>
			<!-- End Footer -->
			
    <!-- Start Script -->
    <script src="<%=request.getContextPath() %>/resources/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>        
    <script src="<%=request.getContextPath() %>/resources/js/templatemo.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/custom.js"></script>    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
	  	
  	<!-- search -->
  	<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
  
    <!-- End Script -->			
			
</body>
</html>
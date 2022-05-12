<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- Start Footer -->
			<footer class="bg-dark" id="tempaltemo_footer">
				<div class="container">
					<div class="row">

						<div class="col-md-4 pt-5">
							<h2 class="h2 text-light border-bottom pb-3 border-light logo">MultiHealth</h2>
							<ul class="list-unstyled text-light footer-link-list">
								<li><i class="fas fa-map-marker-alt fa-fw text-light"></i>
									회사주소</li>
								<li><i class="fa fa-phone fa-fw text-light"></i> <a
									class="text-light" href="tel:010-020-0340">010-1234-5678</a></li>
								<li><i class="fa fa-envelope fa-fw text-light"></i> <a
									class="text-light" href="mailto:info@company.com">담당자 이메일주소</a>
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
						<div class="col-auto">
							<label class="sr-only" for="subscribeEmail">이메일 주소 검색창</label>
							<div class="input-group mb-2">
								<input type="text" class="form-control bg-white border-light"
									id="subscribeEmail" placeholder="Email address">
								<div class="input-group-text btn-primary text-light">Subscribe
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="w-100 bg-black py-3">
					<div class="container">
						<div class="row pt-2">
							<div class="col-12">
								<p class="text-left text-light">
									Copyright &copy; 2021 Company Name | Designed by <a
										rel="sponsored" href="https://templatemo.com" target="_blank">수정가능</a>
								</p>
							</div>
						</div>
					</div>
				</div>

			</footer>
			<!-- End Footer -->
	
			
</body>
</html>
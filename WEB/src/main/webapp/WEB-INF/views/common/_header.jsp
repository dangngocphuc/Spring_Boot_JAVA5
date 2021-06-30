<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!-- Header -->
<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">Miễn phí vận chuyển với đơn hàng
					trên 2 triệu!Hotline: 0983 151 780</div>
				<div class="right-top-bar flex-w h-full">
					<security:authorize access="!isAuthenticated()">
						<a href="${pageContext.request.contextPath}/login">Login</a>
						<a href="${pageContext.request.contextPath}/registration">Register</a>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<security:authentication property="principal.username" />
						<a href="${pageContext.request.contextPath}/registration">Profile</a>
						<a href="${pageContext.request.contextPath}/logout">Logout</a>
					</security:authorize>

				</div>
			</div>
		</div>

		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="Home" class="logo"> <img
					src="https://bizweb.dktcdn.net/100/339/085/themes/699262/assets/logo.png?1617599688437"
					alt="IMG-LOGO">
				</a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li class="active-menu"><a href="index.html">SNEAKER</a>
							<ul class="sub-menu">
								<li class="nav-item"><a href="">ADIDAS</a></li>
								<li class="nav-item"><a href="">NIKE</a></li>
								<li class="nav-item"><a href="">VANS</a></li>
							</ul></li>
						<li><a href="/product">ALL PRODUCT</a></li>
						<li class="label1" data-label1="hot"><a href="">DISCOUNT</a></li>
						<li><a href="contact.jsp">CONTTACT</a></li>
						<li><a href="blog.jsp">BOLOG</a></li>
						<li><a href="about.jsp">ABOUT</a></li>
					</ul>
				</div>
				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
						<i class="zmdi zmdi-search"></i>
					</div>
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="2">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>
					<a href="#"
						class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
						data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
					</a>
				</div>
			</nav>
		</div>
	</div>
	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button
				class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img
					src="http://localhost:8080/resource/site/images/icons/icon-close2.png"
					alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search"
					placeholder="Search...">
			</form>
		</div>
	</div>
</header>
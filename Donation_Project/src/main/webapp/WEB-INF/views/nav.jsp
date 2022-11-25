<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Insert title here</title>
</head>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	
	<nav class="site-nav" style="background-color: #6998AB">
		<div class="container">
			<div class="site-navigation">
			
				<!-- 로고 & 메뉴 -->
				<a href="index.go" class="logo m-0">DonDow <span class="text-primary">.</span></a>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li class="active"><a href="index.go">Home</a></li>
					<li class="has-children">
						<a href="#">Introduce</a>
						<ul class="dropdown">
							<li><a href="#">About Us</a></li>
							<li class="has-children">
								<a href="#">How to Donate ?</a>
								<ul class="dropdown">
									<li><a href="#">일반 기부</a></li>
									<li><a href="#">정기 후원</a></li>
								</ul>
							</li>
							<li><a href="#">Created By</a></li>
						</ul>
					</li>
					<li><a href="board.go?page=1">Donation</a></li>
					<c:choose>
						<c:when test="${isLogined == true }">
							<li><a href="mypage.go">My Page</a></li>
							<li><a href="logout.do">Logout</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="member.go">Login</a></li>				
						</c:otherwise>
					</c:choose>
				</ul>

				<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
					<span></span>
				</a>
			</div>
		</div>
	</nav>
</body>
</html>
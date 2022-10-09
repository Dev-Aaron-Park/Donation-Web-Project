<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="resources/favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.animateNumber.min.js"></script>
<script src="resources/js/jquery.waypoints.min.js"></script>
<script src="resources/js/jquery.fancybox.min.js"></script>
<script src="resources/js/aos.js"></script>
<script src="resources/js/moment.min.js"></script>
<script src="resources/js/daterangepicker.js"></script>
<script src="resources/js/typed.js"></script>
<script src="resources/js/custom.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="resources/css/daterangepicker.css">
<link rel="stylesheet" href="resources/css/aos.css">
<link rel="stylesheet" href="resources/css/style.css">

<!-- Login -->
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="resources/css/member/login.css">

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

	<nav class="site-nav" style="background-color: #1A374D">
		<div class="container">
			<div class="site-navigation">
				<a href="index.go" class="logo m-0">DonDow <span class="text-primary">.</span></a>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li class="active"><a href="index.go">Home</a></li>
					<li class="has-children">
						<a href="#">Introduce</a>
						<ul class="dropdown">
							<li><a href="elements.html">About Us</a></li>
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
					<li><a href="services.html">Donation</a></li>
					<li><a href="about.html">My Page</a></li>
					<li><a href="member.go">Login</a></li>
				</ul>

				<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
					<span></span>
				</a>

			</div>
		</div>
	</nav>

<!-- 	<div class="hero hero-inner">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mx-auto text-center">
					<div class="intro-wrap">
						<h1 class="mb-0">Log in & Register</h1>
					</div>
				</div>
			</div>
		</div>
	</div> -->

	<div class="contents">
		<div class="loginContainer">
	        <div class="forms">
	        
				<!-- Login Form -->
	            <div class="form login">
	                <span class="title">Login</span>
	
	                <form action="#">
	                    <div class="input-field">
	                        <input type="text" placeholder="Enter your email" required>
	                        <i class="uil uil-envelope icon"></i>
	                    </div>
	                    <div class="input-field">
	                        <input type="password" class="password" placeholder="Enter your password" required>
	                        <i class="uil uil-lock icon"></i>
	                        <i class="uil uil-eye-slash showHidePw"></i>
	                    </div>
	
	                    <div class="checkbox-text">
	                        <div class="checkbox-content">
	                            <input type="checkbox" id="logCheck">
	                            <label for="logCheck" class="text">Remember me</label>
	                        </div>
	                        
	                        <a href="#" class="text">Forgot password?</a>
	                    </div>
	
	                    <div class="input-field button">
	                        <input type="button" value="Login">
	                    </div>
	                </form>
	
	                <div class="login-signup">
	                    <span class="text">Not a member?
	                        <a href="#" class="text signup-link">Signup Now</a>
	                    </span>
	                </div>
	            </div>
	
	            <!-- Registration Form -->
	            <div class="form signup">
	                <span class="title">Registration</span>
	
	                <form action="signup.do" name="signupForm" method="POST" onsubmit="">
	                    <div class="input-field">
	                        <input name="member_id" type="text" placeholder="Enter your name" required>
	                        <i class="uil uil-user"></i>
	                    </div>
	                    <div class="input-field">
	                        <input name="member_email" type="text" placeholder="Enter your email" required>
	                        <i class="uil uil-envelope icon"></i>
	                    </div>
	                    <div class="input-field">
	                        <input name="member_pw" type="password" class="password" placeholder="Create a password" required>
	                        <i class="uil uil-lock icon"></i>
	                    </div>
	                    <div class="input-field">
	                        <input name="member_pwc" type="password" class="password" placeholder="Confirm a password" required>
	                        <i class="uil uil-lock icon"></i>
	                        <i class="uil uil-eye-slash showHidePw"></i>
	                    </div>
	
	                    <div class="checkbox-text">
	                        <div class="checkbox-content">
	                            <input type="checkbox" id="termCon">
	                            <label for="termCon" class="text">I accepted all terms and conditions</label>
	                        </div>
	                    </div>
	
	                    <div class="input-field button">
	                        <input type="submit" value="Signup">
	                    </div>
	                </form>
	
	                <div class="login-signup">
	                    <span class="text">Already a member?
	                        <a href="#" class="text login-link">Login Now</a>
	                    </span>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>

    <script src="resources/js/member/login.js"></script>
	
</body>
</html>
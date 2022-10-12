<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Login -->
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="resources/css/member/login.css">

<title>Insert title here</title>
</head>
<body>

	<div class="contents">
		<div class="loginContainer">
	        <div class="forms">
	        
				<!-- Login Form -->
	            <div class="form login">
	                <span class="title">Login</span>
	
	                <form action="login.do" name="loginForm" method="POST" onsubmit="">
	                    <div class="input-field">
	                        <input name="member_id" type="text" placeholder="Enter your ID" required>
	                        <i class="uil uil-user"></i>
	                    </div>
	                    <div class="input-field">
	                        <input name="member_pw" type="password" class="password" placeholder="Enter your password" required>
	                        <i class="uil uil-lock icon"></i>
	                        <i class="uil uil-eye-slash showHidePw"></i>
	                    </div>
	
	                    <div class="checkbox-text">
	                        <a href="#" class="text alertStart">Forgot password?</a>
	                    </div>
	
	                    <div class="input-field button">
	                        <input type="submit" value="Login">
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
	                <form action="signup.do" name="signupForm" method="POST" onsubmit="return checkSignup();">
	                    <div class="input-field">
	                        <input name="member_id" type="text" placeholder="Enter your ID" required>
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
	<script src="resources/js/custom.js"></script>
</body>
</html>
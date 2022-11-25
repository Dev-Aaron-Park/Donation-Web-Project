<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Sidebar Start -->
	<div class="sidebar pe-4 pb-3">
		<nav class="navbar bg-light navbar-light">
			<a href="#" class="navbar-brand mx-4 mb-3">
				<h3 class="text-primary">
					<i class="fa fa-hashtag me-2"></i>My Page
				</h3>
			</a>
			<div class="d-flex align-items-center ms-4 mb-4">
				<div class="position-relative">
					<img class="rounded-circle"
						src="resources/profilePhoto/${sessionScope.loginMember.member_photo }"
						alt="" style="width: 40px; height: 40px;">
					<div
						class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
				</div>
				<div class="ms-3">
					<h6 class="mb-0">${sessionScope.loginMember.member_id }</h6>
					<c:choose>
						<c:when test="${sessionScope.loginMember.member_permissions == 9 }">
							<span>Operator</span>
						</c:when>
						<c:when test="${sessionScope.loginMember.member_permissions == 8 }">
							<span>Manager</span>
						</c:when>
						<c:otherwise>
							<span>Member</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="navbar-nav w-100">
				<a href="mypage.myaccount.go" class="nav-item nav-link active"><i
					class="fa fa-tachometer-alt me-2"></i>My Account</a>
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Donation</a>
					<div class="dropdown-menu bg-transparent border-0">
						<a href="mypage.donation.reg.go" class="dropdown-item">Registration</a>
						<a href="mypage.donation.recv.go" class="dropdown-item">Receive Donations</a> 
						<a href="mypage.donation.edit.go" class="dropdown-item">Edit Post</a>
					</div>
				</div>
				<c:if test="${sessionScope.loginMember.member_permissions >= 8 }">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
							<i class="fa fa-th me-2"></i>Management
						</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="mypage.mng.member" class="dropdown-item">Member</a>
							<a href="mypage.mng.post?page=1" class="dropdown-item">Post</a> 
						</div>
					</div>
				</c:if>
				<a href="#" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
				<a href="form.html" class="nav-item nav-link"><i
					class="fa fa-keyboard me-2"></i>Forms</a> <a href="table.html"
					class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
				<a href="#" class="nav-item nav-link"><i
					class="fa fa-chart-bar me-2"></i>Charts</a>
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
					<div class="dropdown-menu bg-transparent border-0">
						<a href="signin.html" class="dropdown-item">Sign In</a> <a
							href="signup.html" class="dropdown-item">Sign Up</a> <a
							href="404.html" class="dropdown-item">404 Error</a> <a
							href="blank.html" class="dropdown-item">Blank Page</a>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<!-- Sidebar End -->
	
	<div class="container-fluid pt-4 px-4">
		<form action="mypage.edit.do" name="accountEditForm" method="POST"
			onsubmit="return checkAccoutEdit();" enctype="Multipart/form-data">
			<div class="row g-4">
				<div class="col-sm-12 col-xl-6">
					<div class="bg-light rounded h-100 p-4">
						<h6 class="mb-4">User Information</h6>
						<div class="form-floating mb-3">
							<input name="member_id" type="text" class="form-control"
								id="floatingInput" readonly="readonly"
								value="${sessionScope.loginMember.member_id }"> <label
								for="floatingInput">ID</label>
						</div>
						<div class="form-floating mb-3">
							<input name="member_email" type="text" class="form-control"
								id="floatingInput" placeholder="name@example.com"
								value="${sessionScope.loginMember.member_email }"> <label
								for="floatingInput">Email</label>
						</div>
						<div class="form-floating mb-3">
							<input name="member_pw" type="password" class="form-control"
								id="floatingPassword" placeholder="Password" required autocomplete="new-password"> <label
								for="floatingPassword">Password</label>
						</div>
						<div class="mb-3" style="margin-top: 30px;">
							<h6 class="mb-4">Photo Edit</h6>
							<input name="member_photo" class="form-control" type="file"
								id="formFile">
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-xl-6">
					<div class="bg-light rounded h-100 p-4">
						<h6 class="mb-4">Profile Photo</h6>
						<div class="position-relative" align="center">
							<img class="rounded-circle"
								src="resources/profilePhoto/${sessionScope.loginMember.member_photo }"
								style="width: 300px; height: 300px;">
						</div>
					</div>
				</div>
				<!-- Edit Button -->
				<div style="width: 100%" align="center">
					<button type="submit" class="btn btn-primary" style="width: 40%">Edit</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<a href="mypage.myaccount.go" class="nav-item nav-link"><i
					class="fa fa-tachometer-alt me-2"></i>My Account</a>
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Donation</a>
					<div class="dropdown-menu bg-transparent border-0">
						<a href="mypage.donation.reg.go" class="dropdown-item">Registration</a>
						<a href="mypage.donation.recv.go" class="dropdown-item">Receive
							Donations</a> <a href="mypage.donation.edit.go" class="dropdown-item">Edit
							Post</a>
					</div>
				</div>
				<c:if test="${sessionScope.loginMember.member_permissions == 9 }">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle active"
							data-bs-toggle="dropdown"> <i class="fa fa-th me-2"></i>Management
						</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="mypage.mng.member" class="dropdown-item">Member</a> <a
								href="mypage.mng.post?page=1" class="dropdown-item">Post</a>
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
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">Requested Post</h6>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">User</th>
								<th scope="col">Donation Amount</th>
								<th scope="col">Title</th>
								<th scope="col">Status</th>
								<th scope="col">Judgements</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="post" items="${reqPostList }">
								<tr class="boardhov" ondblclick="postDetailGo(${post.board_no });">
									<th scope="row">${post.board_no }</th>
									<td>${post.board_creator }</td>
									<td><fmt:formatNumber value="${post.board_donation_amount }" pattern="#,###"/>&nbsp;???</td>
									<td>${post.board_business_name }</td>
									<td>Awaiting approval</td>
									<td>
										<a onclick="reqPostDecision(${post.board_no});">Decision</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid pt-4 px-4">
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">Initiated Donation Requests</h6>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">User</th>
								<th scope="col">Donation Amount</th>
								<th scope="col">Title</th>
								<th scope="col">Status</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="post" items="${initPostList }">
								<tr class="boardhov" ondblclick="postDetailGo(${post.board_no });">
									<th scope="row">${post.board_no }</th>
									<td>${post.board_creator }</td>
									<td><fmt:formatNumber value="${post.board_donation_amount }" pattern="#,###"/>&nbsp;???</td>
									<td>${post.board_business_name }</td>
									<td>Initiated</td>
									<td>
										<a onclick="initPostDelete(${post.board_no}, 'management');">Delete</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div align="center">
						<c:forEach var="p" begin="1" end="${pageCount }">
							<a href="mypage.mng.post?page=${p }">&nbsp;${p }&nbsp;</a>
						</c:forEach>
					</div>
					<div align="right" style="margin-bottom: 10px;">
						<form action="mypage.mng.post.search">
							<input name="keyword"> <button>Search</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
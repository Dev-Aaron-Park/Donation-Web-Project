<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Banner -->
	<div align="center">
		<img src="resources/customImg/donation_banner.png" style="margin-top: 120px" height="100px">
	</div>
	
	<!-- Contents -->
	<div class="untree_co-section">
		<div class="container">
			<div class="row">
				<c:forEach var="post" items="${initPostList }">
					<div class="col-6 col-md-6 col-lg-3" style="min-width: 570px;">
						<div class="media-1" style="align-items: center;">
							<a onclick="postDetailGo(${post.board_no });" class="d-block mb-3" style="cursor: pointer;">
								<img src="resources/boardPhoto/${post.board_photo_1 }" alt="Image" class="img-fluid photoCard">
							</a>
							<div class="d-flex">
								<div>
									<h3>
										<a onclick="postDetailGo(${post.board_no });" style="cursor: pointer;">${post.board_business_name }</a>
									</h3>
									<p><fmt:formatNumber value="${post.board_donation_amount }" pattern="#,###"/>&nbsp;₩</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<script src="resources/js/custom.js"></script>
</body>
</html>
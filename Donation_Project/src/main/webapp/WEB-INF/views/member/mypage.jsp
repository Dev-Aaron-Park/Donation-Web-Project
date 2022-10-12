<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="resources/images/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/mypage/mypage_bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/mypage/mypage_style.css" rel="stylesheet">
</head>

<body>

	<div style="background-color: #FFFFFF">
	    <div class="container-xxl position-relative bg-white d-flex p-0" style="background-color: #F3F6F9">
	
	        <!-- Sidebar Start -->
	        <div class="sidebar pe-4 pb-3">
	            <nav class="navbar bg-light navbar-light">
	                <a href="#" class="navbar-brand mx-4 mb-3">
	                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>My Page</h3>
	                </a>
	                <div class="d-flex align-items-center ms-4 mb-4">
	                    <div class="position-relative">
	                        <img class="rounded-circle" src="resources/images/user.jpg" alt="" style="width: 40px; height: 40px;">
	                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
	                    </div>
	                    <div class="ms-3">
	                        <h6 class="mb-0">Jhon Doe</h6>
	                        <span>Admin</span>
	                    </div>
	                </div>
	                <div class="navbar-nav w-100">
	                    <a href="mypage.myaccount.go" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>My Account</a>
	                    <div class="nav-item dropdown">
	                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
	                        <div class="dropdown-menu bg-transparent border-0">
	                            <a href="button.html" class="dropdown-item">Buttons</a>
	                            <a href="typography.html" class="dropdown-item">Typography</a>
	                            <a href="element.html" class="dropdown-item">Other Elements</a>
	                        </div>
	                    </div>
	                    <a href="#" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
	                    <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
	                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
	                    <a href="#" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
	                    <div class="nav-item dropdown">
	                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
	                        <div class="dropdown-menu bg-transparent border-0">
	                            <a href="signin.html" class="dropdown-item">Sign In</a>
	                            <a href="signup.html" class="dropdown-item">Sign Up</a>
	                            <a href="404.html" class="dropdown-item">404 Error</a>
	                            <a href="blank.html" class="dropdown-item">Blank Page</a>
	                        </div>
	                    </div>
	                </div>
	            </nav>
	        </div>
	        <!-- Sidebar End -->
	
	
	        <!-- Content Start -->
	        <div class="content">
	        	<div class="container-fluid pt-4 px-4">
	        		<div class="row g-4">
			           	<div class="col-sm-12 col-xl-6">
		                    <div class="bg-light rounded h-100 p-4">
		                        <h6 class="mb-4">User Information</h6>
		                        <div class="form-floating mb-3">
		                            <input type="text" class="form-control" id="floatingInput" readonly="readonly" value="${sessionScope.loginMember.member_id }">
		                            <label for="floatingInput">ID</label>
		                        </div>
		                        <div class="form-floating mb-3">
		                            <input type="text" class="form-control" id="floatingInput"
		                                placeholder="name@example.com" readonly="readonly" value="${sessionScope.loginMember.member_email }">
		                            <label for="floatingInput">Email</label>
		                        </div>
		                        <div class="form-floating mb-3">
		                            <input type="password" class="form-control" id="floatingPassword"
		                                placeholder="Password">
		                            <label for="floatingPassword">Password</label>
		                        </div>
		                    </div>
		                </div>
			            <div class="col-sm-12 col-xl-6">
		                    <div class="bg-light rounded h-100 p-4">
		                       <h6 class="mb-4">Profile Photo</h6>
		                       <div class="position-relative" align="center">
	                    		   <img class="rounded-circle" src="resources/images/testimonial-1.jpg" style="width: 200px; height: 200px;">
	                 		   </div>
		                       <div class="mb-3" style="margin-top: 60px;">
	                 			   <h6 class="mb-4">Photo Edit</h6>
		                           <input class="form-control" type="file" id="formFile">
		                       </div>
		                    </div>
		                </div>
		                <!-- Edit Button -->
						<div style="width: 100%" align="center">
							<button type="submit" class="btn btn-primary" style="width: 40%">Edit</button>
					    </div>
	        		</div>
	        	</div>

	
	            <!-- Footer Start -->
	            <div class="container-fluid pt-4 px-4">
	                <div class="bg-light rounded-top p-4">
	                    <div class="row">
	                        <div class="col-12 col-sm-6 text-center text-sm-start">
	                            &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
	                        </div>
	                        <div class="col-12 col-sm-6 text-center text-sm-end">
	                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
	                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
	                        </br>
	                        Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- Footer End -->
	        </div>
	        <!-- Content End -->
	
	        <!-- Back to Top -->
	        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
	    </div>
	</div>
	
    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
    <script src="resources/js/custom.js"></script>
</body>

</html>
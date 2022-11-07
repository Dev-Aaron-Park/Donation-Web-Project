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
	
	        <!-- Content Start -->
	        <div class="content">
	        	<jsp:include page="${mypageContents }"></jsp:include>

	            <!-- Footer Start -->
	            <div class="container-fluid pt-4 px-4" style="margin-top: 200px;">
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
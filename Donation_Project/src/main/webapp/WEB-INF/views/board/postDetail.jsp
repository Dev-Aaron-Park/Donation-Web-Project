<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

	<script type="text/javascript">
		$(function(){
			$('.bxslider').bxSlider({
				mode: 'fade',
				captions: true,
				slideWidth: 600
			});
		});
	</script>
	
</head>	
<body>

	<div style="margin-top: 100px;" align="center">
		<div class="container-xxl position-relative bg-white d-flex p-0 postDetailLayout">
			<div class="container-fluid pt-4 px-4">
				<div class="row vh-100 bg-light rounded mx-0" style="justify-content: flex-start;">
					<div class="col-md-6 text-center">
						<input class="form-control form-control-lg mb-3 postDetailInput" 
							type="text" readonly="readonly"
							value="${post.board_business_name }"
                            aria-label=".form-control-lg example">
                    	<textarea class="form-control form-control-lg mb-3 postDetailInput postDetailTextArea" style="height: 400px;" readonly="readonly">${post.board_content }</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
   	<div align="center" style="margin-top: 30px;">
		<div class="bxslider postDetail PhotoSlider" style="width: 800px;">
			<div><img src="resources/boardPhoto/${post.board_photo_1 }"></div>
			<div><img src="resources/boardPhoto/${post.board_photo_2 }"></div>
			<div><img src="resources/boardPhoto/${post.board_photo_3 }"></div>
		</div>
	</div>
	
	<script src="resources/js/custom.js"></script>
</body>
</html>
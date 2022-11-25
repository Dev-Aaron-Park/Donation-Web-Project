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
	
	<form action="board.post.edit.do" name="" method="POST" enctype="Multipart/form-data">
		<div style="margin-top: 100px;" align="center">
			<div class="container-xxl position-relative bg-white d-flex p-0 postDetailLayout">
				<div class="container-fluid pt-4 px-4">
					<div class="row vh-100 bg-light rounded mx-0" style="justify-content: flex-start;">
						<div class="col-md-6 text-center">
							<input name="board_no" value="${post.board_no }" readonly="readonly" type="hidden">
							<input name="board_business_name" class="form-control form-control-lg mb-3 postDetailInput" 
								type="text" readonly="readonly"
								value="${post.board_business_name }"
	                            aria-label=".form-control-lg example">
	                    	<textarea name="board_content" class="form-control form-control-lg mb-3 postDetailInput postDetailTextArea" style="height: 400px;" maxlength="1000">${post.board_content }</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	   	<div class="container-fluid pt-4 px-4" style="z-index: 0; position: relative; width: 937px; margin-bottom: 190px; margin-top: 30px;">
				<h6>Photo</h6>
				<label for="formFile" class="form-label"></label> <input name="board_photo_1" class="form-control" type="file" id="formFile" required>
				<label for="formFile" class="form-label"></label> <input name="board_photo_2" class="form-control" type="file" id="formFile" required>
				<label for="formFile" class="form-label"></label> <input name="board_photo_3" class="form-control" type="file" id="formFile" required>
		</div>
		
		<div align="right" style="margin-right: 450px; position: static;">
			<button class="btn btn-primary">Complete</button>
		</div>
	</form>
	
	<script src="resources/js/custom.js"></script>
</body>
</html>
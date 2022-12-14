<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
		$(function(){
			$('.bxslider').bxSlider({
				mode: 'fade',
				captions: true,
				slideWidth: 600
			});
			
			$("#donationOpenBtn").click(function(){
				$(".paymentCard").css("opacity", "1");
			});
			
			$("#donationCloseBtn").click(function(){
				$(".paymentCard").css("opacity", "0");
				$("#amountResult").val("0");
				$("#agreeChk").prop("checked", false);
				$("#payChk").prop("checked", false);
			});
		});
		
		function count(amount)  {
			  const resultElement = $('input[name=amountResult]').attr('value');
			  number = parseInt(resultElement) + amount;
			  $('input[name=amountResult]').attr('value', number);
		}
	</script>

</head>
<body>

	<div style="margin-top: 100px;" align="center">
		<div
			class="container-xxl position-relative bg-white d-flex p-0 postDetailLayout">
			<div class="container-fluid pt-4 px-4">
				<div class="row vh-100 bg-light rounded mx-0"
					style="justify-content: flex-start;">
					<div class="col-md-6 text-center">
						<input class="form-control form-control-lg mb-3 postDetailInput"
							type="text" readonly="readonly"
							value="${post.board_business_name }"
							aria-label=".form-control-lg example">
						<textarea
							class="form-control form-control-lg mb-3 postDetailInput postDetailTextArea"
							style="height: 400px;" readonly="readonly">${post.board_content }</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div align="center" style="margin-top: 30px;">
		<div class="bxslider postDetail PhotoSlider" style="width: 800px;">
			<div>
				<img src="resources/boardPhoto/${post.board_photo_1 }">
			</div>
			<div>
				<img src="resources/boardPhoto/${post.board_photo_2 }">
			</div>
			<div>
				<img src="resources/boardPhoto/${post.board_photo_3 }">
			</div>
		</div>
	</div>

	<div align="left" style="margin-left: 450px; position: static;">
		<a onclick="initPostEdit(${post.board_no})" class="btn btn-primary">Edit</a>
		<a onclick="initPostDelete(${post.board_no}, 'postDetail');"
			class="btn btn-primary"
			style="background-color: #B71C1C; border: red;">Delete</a>
	</div>


	<!-- Side -->
	<div align="right">
		<div class="postDetailSideCard">
			<div class="sideItems" align="center">????????? %</div>
			<div class="sideItems" align="center">?????? ?????? :
				${post.board_donation_amount }</div>
			<div class="sideItems" align="center">?????? ?????? :
				${post.board_donation_amount }</div>
			<div class="sideItems" align="center">?????? ?????? :
				${post.board_donation_amount }</div>
			<div class="sideItems" align="center">??? ?????? ??????</div>
			<div class="sideItems" align="center">
				<a href="#" id="donationOpenBtn">????????????</a>
			</div>
		</div>
	</div>

	<div align="center" id="donationWindow">
		<div class="paymentCard">
			<div align="right" style="margin-right: 20px; margin-top: 20px;">
				<a href="#" id="donationCloseBtn">X</a>
			</div>
			<div>
				<input name="amountResult" id="amountResult" value="0"> ???
			</div>
			<div style="display: flex;" class="amountBtn">
				<input type='button' onclick='count(100)' value='+1??????' /> <input
					type='button' onclick='count(1000)' value='+1??????' /> <input
					type='button' onclick='count(5000)' value='+5??????' /> <input
					type='button' onclick='count(10000)' value='+1??????' /> <input
					type='button' onclick='count(50000)' value='+5??????' />
			</div>
			<div style="display: flex;" align="center">
				<div style="width: 100%; margin-left: auto; margin-right: auto;">
					<input type="radio" name="paychk" value="card" disabled="disabled">
					?????? ?????? <input type="radio" id="payChk" name="payChk" value="kakao">
					????????? ??????
				</div>
			</div>
			<div>
				<input type="checkbox" id="agreeChk"> ???????????? ?????? ??? ?????? ????????? ??????
			</div>
			<br>
			<div>
				<button onclick="kakaoPayReqEvent(${post.board_no});"
					id="donationCompBtn">????????????</button>
			</div>
		</div>
	</div>

	<div style="width: 100%; margin-top: 25px;" align="center">
		<div class="col-sm-12 col-xl-6" align="center">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">Comment Table</h6>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">User</th>
							<th scope="col">Date</th>
							<th scope="col">Comment</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>John</td>
							<td>2022-11-12</td>
							<td>?????? ????????? !</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Mark</td>
							<td>2022-11-07</td>
							<td>????????? !</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Jacob</td>
							<td>2022-10-28</td>
							<td>?????? ???????????????.</td>
						</tr>
					</tbody>
				</table>
				<form action="board.comment.do" method="POST">
					<div class="form-floating">
						<input name="comment_board_no" value="${post.board_no }" readonly="readonly" type="hidden">
						<input name="co	mment_member" value="${sessionScope.loginMember.member_id }" readonly="readonly" type="hidden">
						<textarea name="comment_text" class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea" style="height: 45px; resize: none;" maxlength="80"></textarea>
						<button class="btn btn-primary" style="margin-top: 10px;">Write</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script src="resources/js/custom.js"></script>
</body>
</html>
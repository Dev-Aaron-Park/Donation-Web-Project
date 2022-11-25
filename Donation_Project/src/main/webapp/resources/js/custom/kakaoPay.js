var tid = null;

function kakaoPayReqEvent(no) {
		/*var w = window.open("", "_blank", "width=500,height=600");*/
		var amount = $('input[name=amountResult]').attr('value');
		$.ajax({
			url : "https://kapi.kakao.com/v1/payment/ready",
			type: "POST",
			data : {
				cid: "TC0ONETIME",
				partner_order_id: "test1",
				partner_user_id: "test1",
				item_name: "item_name",
				quantity: 1,
				total_amount: amount,
				tax_free_amount: 0,
				approval_url: "http://localhost/donation/board.post.go?no=" + no,
				cancel_url: "http://localhost/donation/board.post.go?no=" + no,
				fail_url: "http://localhost/donation/board.post.go?no=" + no
			},
			beforeSend : function(req) {
				req.setRequestHeader("Authorization", "KakaoAK 7ab954beb42e5056093a8355d78bc9ef");
				req.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			},
			success : function(payData) {
				console.log(payData);
				tid = payData.tid;
				alert(tid);
				sessionStorage.setItem("tid", payData.tid);
				window.location.href = payData.next_redirect_pc_url;
			},
			error : function(errorData) {
				console.log(errorData);
			}
		});
}

function kakaoPayCompEvent() {
	$("#payTestBtn").click(function(){
		var queryString = window.location.search;
		var urlParams = new URLSearchParams(queryString);
		console.log(typeof(urlParams.get('pg_token')));
		console.log(urlParams.get('pg_token'));
		$.ajax({
			url : "https://kapi.kakao.com/v1/payment/approve",
			type: "POST",
			data : {
				cid: "TC0ONETIME",
				tid: sessionStorage.getItem("tid"),
				partner_order_id: "test1",
				partner_user_id: "test1",
				pg_token: String(urlParams.get('pg_token')),
			},
			beforeSend : function(req) {
				req.setRequestHeader("Authorization", "KakaoAK 7ab954beb42e5056093a8355d78bc9ef");
				req.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			},
			complete : function(payData) {
				console.log(payData);
			}
		});
	});
}

$(function() {
});
function reqPostDecision(no) {
	Swal.fire({
		title: 'Are you sure you want to approve this post?',
		showDenyButton: true,
		showCancelButton: true,
		confirmButtonText: 'Approve',
		denyButtonText: `Reject`,
	}).then((result) => {
		/* Read more about isConfirmed, isDenied below */
		if (result.isConfirmed) {
			Swal.fire('Approved !', 'Post No.'+no, '')
			location.href="mypage.mng.post?no="+no+"&dec=1";
		} else if (result.isDenied) {
			Swal.fire('Rejected !', 'Post No.'+no, '')
			location.href="mypage.mng.post?no="+no+"&dec=0";
		}
	})
	
}

function initPostDelete(no) {
	Swal.fire({
		title: 'Are you sure?',
		text: "You won't be able to revert this!",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes, delete it!'
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire('Deleted!', 'Your file has been deleted.', 'success')
			location.href="mypage.mng.post.del?no="+no;
		}
	})
}

function postDetailGo(no) {
	location.href = "board.post.go?no=" + no;
}

function memberPermChange(id, per) {
	Swal.fire({
		title: 'Are you sure?',
		text: "Change the user's permission to Normal.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes, change it!'
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire('Changed!', 'User permissions have changed.', 'success')
			location.href="mypage.mng.member?id="+id+"&per="+per;
		}
	})
}

function memberAddAdmin(id) {
	Swal.fire({
		title: 'Are you sure?',
		text: "Change the user's permission to Manager.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes, change it!'
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire('Changed!', 'User permissions have changed.', 'success')
			location.href="mypage.mng.member?id="+id;
		}
	})
}
function checkSignup() {
	var id = document.signupForm.member_id;
	var pw = document.signupForm.member_pw;
	var pwc = document.signupForm.member_pwc;
	var email = document.signupForm.member_email;
	
	if (isUnValidString(id)) {
		id.value = "";
		id.focus();
		Swal.fire({
            icon: 'error',
            title: 'Sign Up Failed',
            text: 'Please Check Your ID.',
        });
		return false;
	}
	
	if (isNotEquals(pw, pwc) || isNotIncluded(pw, "1234567890")
			|| isNotIncluded(pw, "abcdefghijklmnopqrstuvwxyz")) {
		pw.value = "";
		pwc.value = "";
		pw.focus();
		Swal.fire({
            icon: 'error',
            title: 'Sign Up Failed',
            text: 'Please Check Your Password.',
        });
		return false;
	}
	
	if (isNotEmail(email)) {
		email.value = "";
		email.focus();
		Swal.fire({
            icon: 'error',
            title: 'Sign Up Failed',
            text: 'Please Check Your Email.',
        });
		return false;
	}
	
	return true;
}
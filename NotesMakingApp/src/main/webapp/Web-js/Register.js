$(document).ready(function () {
	$("#error_fname").text(" ");
	$("#error_lname").text(" ");
	$("#error_mail").text(" ");
	$("#error_phno").text(" ");
	$("#error_Password").text(" ");
	$("#error_Confirm-Password").text(" ");
	var error_fname = true;
	var error_lname = true;
	var error_mail = true;
	var error_phno = true;
	var error_password = true;
	var error_confirm_password = true;
	RegisterProcess();
	$("#RegisterForm").submit(function () {
		error_fname = true;
		error_lname = true;
		error_phno = true;
		error_password = true;
		error_confirm_password = true;
		checkFname();
		checkLname();
		checkMail();
		checkPhno();
		checkPassword();		
		checkConfirmPassword();
		if (error_fname === true && error_lname === true && error_mail === true && error_phno === true && error_password === true && error_confirm_password === true) {
			DetailsToDB();
			alert("Registration Success");
			return true;
		}
		else {
			alert("Registration failed");
			return false;
		}
	})
	function RegisterProcess() {
		$("#Reg_fname").focusin(function () {
			$("#error_fname").text(" ");
		});
		$("#Reg_fname").focusout(function () {
			checkFname();
		});
		$("#Reg_lname").focusin(function () {
			$("#error_lname").text(" ");
		});
		$("#Reg_lname").focusout(function () {
			checkLname();
		});
		$("#Reg_mail").focusin(function () {
			$("#error_mail").text(" ");
		});
		$("#Reg_mail").keyup(function () {
			checkMail();
		})
		$("#Reg_mail").focusout(function () {
			checkMail();
		});
		$("#Reg_phno").focusin(function () {
			$("#error_phno").text(" ");
		});
		$("#Reg_phno").focusout(function () {
			checkPhno();
		});
		$("#Reg_Password").focusin(function () {
			$("#error_Password").text(" ");
		});
		$("#Reg_Password").focusout(function () {
			checkPassword();
		});
		$("#Reg_Confirm-Password").focusin(function () {
			var Password = $("#Reg_Password").val();
			if(Password == ""){
				$("#Reg_Password").focus();
				$("#error_Password").text("*Password is Mandatory");
				return;
			}
			$("#error_Confirm-Password").text(" ");
		});
		$("#Reg_Confirm-Password").focusout(function () {
			checkConfirmPassword();
		});
	}
	function checkFname() {
		var fname = $("#Reg_fname").val();
		var pattern = /^([^1-9\s\W]*)*$/g;
		if (fname == "") {
			$("#error_fname").text("*Firstname is mandatory");
			error_fname = false;
			return;
		}
		if(pattern.test(fname)==false){
			$("#error_fname").text("*Firstname should contain only alphabets");
			error_fname = false;
			return;
		}
	}
	function checkLname() {
		var lname = $("#Reg_lname").val();
		var pattern = /^([^1-9\s\W]*)*$/g;
		if (lname == "") {
			$("#error_lname").text("*Lastname is mandatory");
			error_lname = false;
			return;
		}
		if(pattern.test(lname)==false){
			$("#error_lname").text("*Lastname should contain only alphabets");
			error_lname = false;
			return;
		}
	}
	function checkMail() {
		var mail = $("#Reg_mail").val();
		var pattern = /^[a-zA-Z0-9_]+@[a-z]+[.]+[a-z.]+$/g;
		if (mail == "") {
			$("#error_mail").text("*Mail is mandatory");
			error_mail = false;
			return;
		}
		if(pattern.test(mail)==false){
			$("#error_mail").text("*Enter valid mail");
			error_mail = false;
			return;
		}
		$.ajax({
			url: "CheckMailAvailability",
			method: "POST",
			data: { mail: mail, },
			cache: false,
			success: function (data) {
				if (data != "available") {
					$("#error_mail").text(data);
					error_mail = false;
				}
				else {
					/* $("#error_mail").text(" "); */
					error_mail = true;
				}
			}
		})
	}
	function checkPhno() {
		var phno = $("#Reg_phno").val();
		var pattern = /^[6-9][0-9]{9}$/g;
		if (phno == "") {
			$("#error_phno").text("*Phno is mandatory");
			error_phno = false;
			return;
		}
		if(pattern.test(phno)==false){
			$("#error_phno").text("*Enter Valid Phone number");
			error_phno = false;
			return;
		}
	}
	function checkPassword() {
		var Password = $("#Reg_Password").val();
		var pattern = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+?/{}])(?=\S+$).{8,17}$/g; 
		if (Password == "") {
			$("#error_Password").text("*Password is mandatory");
			error_password = false;
			return;
		}
		if(pattern.test(Password)==false){
			$("#error_Password").text("*Enter Valid Password");
			error_password = false;
			alert("Password must contain\n * one digit\n *one Alphabet[both caps and small]\n *one special Character\n *In range 8-17");
			return;
		}
	}
	function checkConfirmPassword() {
		var confirm_password = $("#Reg_Confirm-Password").val();
		var Password = $("#Reg_Password").val();	
		if (confirm_password == "") {
			$("#error_Confirm-Password").text("*Confirm-Password is mandatory");
			error_confirm_password = false;
			return;
		}
		if (Password != confirm_password) {
			$("#error_Confirm-Password").text("*Enter the same Password");
			error_confirm_password = false;
			return;
		}
	}
	function DetailsToDB() {
		var vfname = $("#Reg_fname").val();
		var vlname = $("#Reg_lname").val();
		var vmail = $("#Reg_mail").val();
		var vuserid = getUserId(vmail);
		var vphno = $("#Reg_phno").val();
		var vPassword = $("#Reg_Password").val();
		$.ajax({
			url: "RegistrationProcess",
			method: "POST",
			data: {
				fname: vfname,
				lname: vlname,
				mail: vmail,
				userid: vuserid,
				phno: vphno,
				Password: vPassword,
			},
			cache: false,
			success: function (data){},
			error: function (data) { }
		})
	}
	function getUserId(mail) {
		var m = mail.split("@");
		var ans = m[0];
		return ans;
	}
})
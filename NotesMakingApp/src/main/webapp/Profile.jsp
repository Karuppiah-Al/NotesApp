<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<meta charset="ISO-8859-1">
		<jsp:include page="taskManaging.jsp" flush="true"></jsp:include>
		<title>Profile</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#div_re_password").hide();
				var userid = $("#username").val();
				fetching();
				var prev_password ;
				$("#Change").click(function(){
					$("#password").prop("disabled",false);
					$("#password").val("");
					$("#password").focus();
					$("#div_re_password").show();
				})
				$("#error_fname").text(" ");
				$("#error_lname").text(" ");
				$("#error_phno").text(" ");
				$("#error_Password").text(" ");
				$("#error_Confirm-Password").text(" ");
				var error_fname = false;
				var error_lname = false;
				var error_phno = false;
				var error_password = false;
				var error_confirm_password = false;
				function checkFname() {
					var fname = $("#fname").val();
					var pattern = /^([^1-9\s\W]*)*$/g;
					if (fname == "") {
						$("#error_fname").text("*Firstname is mandatory");
						$("#error_fname").addClass("paddingspan");
						error_fname = true;
						return;
					}
					if(pattern.test(fname)==false){
						$("#error_fname").text("*Firstname should contain only alphabets");
						$("#error_fname").addClass("paddingspan");
						error_fname = true;
						return;
					}
				}
				function checkLname() {
					var lname = $("#lname").val();
					var pattern = /^([^1-9\s\W]*)*$/g;
					if (lname == "") {
						$("#error_lname").text("*Lastname is mandatory");
						$("#error_lname").addClass("paddingspan");
						error_lname = true;
						return;
					}
					if(pattern.test(lname)==false){
						$("#error_lname").text("*Lastname should contain only alphabets");
						$("#error_lname").addClass("paddingspan");
						error_lname = true;
						return;
					}
				}
				function checkPhno() {
					var phno = $("#phno").val();
					var pattern = /^[6-9][0-9]{9}$/g;
					if (phno == "") {
						$("#error_phno").text("*Phno is mandatory");
						$("#error_phno").addClass("paddingspan");
						error_phno = true;
						return;
					}
					if(pattern.test(phno)==false){
						$("#error_phno").text("*Enter Valid Phone number");
						$("#error_phno").addClass("paddingspan");
						error_phno = true;
						return;
					}
				}
				function checkPassword() {
					var Password = $("#password").val();
					var pattern = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+?/{}])(?=\S+$).{8,17}$/g; 
					if (Password == "") {
						$("#error_Password").text("*Password is mandatory");
						error_password = true;
						return;
					}
					if(pattern.test(Password)==false){
						$("#error_Password").text("*Enter Valid Password");
						error_password = true;
						alert("Password must contain\n * one digit\n *one Alphabet[both caps and small]\n *one special Character\n *In range 8-17");
						return;
					}
				}
				function checkConfirmPassword() {
					var confirm_password = $("#retype-password").val();
					var Password = $("#password").val();
					if(prev_password==Password){
						return;
					}
					if (confirm_password == "") {
						$("#error_Password").text("*Confirm-Password is mandatory");
						error_confirm_password = true;
						return;
					}
					if (Password != confirm_password) {
						$("#error_Password").text("*Enter the same Password");
						error_confirm_password = true;
						return;
					}
				}
				$("#form").submit(function(){
					error_fname = false;
					error_lname = false;
					error_phno = false;
					error_password = false;
					error_confirm_password = false;
					checkFname();
					checkLname();
					checkPhno();
					checkPassword();		
					checkConfirmPassword();
					if (error_fname === false && error_lname === false && error_phno === false && error_password === false && error_confirm_password === false) {
						updating();
						alert("Updation Success");
						$("#error_fname").text(" ");
						$("#error_lname").text(" ");
						$("#error_phno").text(" ");
						$("#error_Password").text(" ");
						$("#error_fname").removeClass("paddingspan");
						$("#error_lname").removeClass("paddingspan");
						$("#error_phno").removeClass("paddingspan");
						$("#error_Password").removeClass("paddingspan");
						$("#retype-password").val("");
						$("#div_re_password").hide();
					}
					else {
						alert("Updation failed");
					}
					return false;
				})
				function fetching(){
					$.ajax({
						url:"ProfileProcess",
						method:"POST",
						data:{
							operation:"fetching",
							userid:userid,
						},
						success:function(data){
							if(data==="Something error happened"){
								alert("failed");
								return;
							}
							var values = data.split(",");
							$("#fname").val(values[0]);
							$("#lname").val(values[1]);
							$("#mail").val(values[2]);
							$("#phno").val(values[3]);
							$("#password").val(values[4]);
							prev_password = $("#password").val();
						},
						error:function(data){}
					})					
				}
				function updating(){
					var fname = $("#fname").val();
					var lname = $("#lname").val();
					var phno = $("#phno").val();
					var password = $("#password").val();					
					var values = fname+","+lname+","+phno+","+password;
					$.ajax({
						url:"ProfileProcess",
						method:"POST",
						data:{
							operation:"updating",
							userid:userid,
							values:values,
						},
						success:function(data){
							$("#Profile-tab--button").find("a").text("");
							$("#Profile-tab--button").find("a").append(fname+'<i class="fa fa-user" aria-hidden="true" style="padding-left: 10px"></i>');
						},
						error:function(data){}
					})
				}
			})
		</script>
		<style type="text/css">
			#Profile-tab-button{
				background: linear-gradient(to top right, #33ccff 0%, #ff99cc 100%);
				border-radius: 5px;
			}
			*{
				box-sizing: border-box;
				margin: 0;
			}
			html body{
				height:100%;
				overflow: auto;
			}
			.content{
				overflow:auto;
				margin-top:110px; 
				position:absolute; 
				left:20%;
				right:20%;
				width:50%;
				min-width:60%;
				text-align:center; 
				border:2px solid black;
				border-radius: 4px;
				box-shadow: 2px 2px 10px 10px grey;
				min-height: 75%;
				height:auto;
			}
			.content .content-header{
				padding-top:10px; 
			}
			.content .content-inputs{
				padding: 20px;
			}
			.divforlabelandinput{
				margin-top:10px;
				display: flex;	
				flex-wrap: wrap;
				padding-left:40px; 
			}
			.divfornameandcontact{
				width:100%;
				min-width:100px;
				display: block;
				text-align: left;
			}
			.divforpassword{
				width:100%;
				min-width:100px;
				display: block;
				text-align: left;
				
			}
			.content .content-inputs .content-inputs-name .content-inputs-name-fname{
				margin-bottom: 10px;
			}
			.content .content-inputs .content-inputs-contacts .content-inputs-contacts-mail{
				margin-bottom: 10px;
			}
			label{
				width:150px;
				font-size: larger;
			}
			input[type=text]{
				width:70%;
				border-radius:3px; 
				border: 2px solid black;
				padding: 8px;
			}
			input[type=text]:active {
				outline: none;
			}
			input[type=password]{
				width:200px;
				border-radius:3px; 
				border: 2px solid black;
				padding: 8px;
			} 
			input[type=button]{
				width:140px;
				color:white;
				padding: 9px;
				background-color:#6666c2;
				border-radius: 5px; 
			}
			input[type=submit]{
				margin-top:20px;
				width:140px;
				color:white;
				padding: 9px;
				background-color:#6666c2;
				border-radius: 5px;
			}
			input[type=button]:hover,input[type=submit]:hover{
				background: linear-gradient(to top right, #33ccff 0%, #ff99cc 100%);
			}
			span{
				transform:translate(50px);
				color:red;
				text-decoration: underline;
			}
			.paddingspan{
				padding-left:20%;
			}
		</style>
	</head>
	<body>
		<% String fname = (String)session.getAttribute("fname") ;
    		if(fname==null){%>
    			<jsp:forward page="header.jsp"></jsp:forward>
    		<%}
    	%>
		<% String username = (String)session.getAttribute("username") ; %>
    	<input type="hidden" id="username" value="<%=username%>" name="username">
		<div class="content">
			<div class="content-header">
				<h1>Profile<i class="fa fa-user" aria-hidden="true" style="padding-left: 10px"></i></h1>
			</div>
			<div class="content-inputs">
				<form id="form" method="post">
					<div class="content-inputs-name divforlabelandinput">
						<div class="content-inputs-name-fname divfornameandcontact">
							<label for="fname">FirstName</label>
							<input type="text" name="fname" id="fname"><span id="error_fname"></span>
						</div>
						<div class="content-inputs-name-lname divfornameandcontact">
							<label for="lname">LastName</label>
							<input type="text" name="lname" id="lname"><span id="error_lname"></span>
						</div>					
					</div>
					<div class="content-inputs-contacts divforlabelandinput">
						<div class="content-inputs-contacts-mail divfornameandcontact">
							<label for="mail">Mail ID</label>
							<input type="text" name="mail" id="mail" disabled="disabled">
						</div>	
						<div class="content-inputs-contacts-phno divfornameandcontact">
							<label for="phno">Phone Number</label>
							<input type="text" name="phno" id="phno"><span id="error_phno"></span>
						</div>					
					</div>
					<div class="contents-inputs-password divforlabelandinput">
						<div class="contents-inputs-password divforpassword">
							<label for="password">Password</label>
							<input type="Password" name="password" id="password" disabled="disabled">
							<input type="button" value="Change" id="Change" name="changepassword"><br>
							<div id="div_re_password">
								<label for="retype-password">Re-Password</label>
								<input type="Password" name="retype-password" style="margin-top: 3px" id="retype-password">
							</div>
							<span id="error_Password"></span>
						</div>				
					</div>
					<input type="submit" value="Update" id="submit">
				</form>
			</div>
		</div>
	</body>
</html>
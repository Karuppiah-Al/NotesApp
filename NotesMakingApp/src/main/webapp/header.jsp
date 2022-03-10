<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <!-- <script src="js/jquery-1.11.3.min.js"></script> -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="Web-js/header.js"></script>
        <link rel="stylesheet" href="Web-css/Login.css"> 
        <link rel="stylesheet" href="Web-css/Register.css"> 
        <link rel="stylesheet" href="Web-css/header.css">         
        <script type="text/javascript">
        	$(document).ready(function(){
                $('#Login').click(function(){
                	makeLoginVisible();
                });
                $('#Register').click(function(){
                	makeRegVisible();
                });
                $('.content').click(function(){
                	makeContentVisible();
                });
                $(".Login-content").find("a").click(function(){
                	makeRegVisible();
                })
                $(".close-btn").click(function(){
                	makeContentVisible();
                })
                function makeLoginVisible(){
                	$('.Register').removeClass('active');
                    $('.content').addClass('blur');
                    $('.header').addClass('blur');
                    $('.Login').addClass('active');
                }
                function makeContentVisible(){
                	$('.content').removeClass('blur');
                    $('.header').removeClass('blur');
                    $('.Login').removeClass('active');
                    $('.Register').removeClass('active');
                }
                function makeRegVisible(){
                	$('.Login').removeClass('active');
                    $('.content').addClass('blur');
                    $('.header').addClass('blur');
                    $('.Register').addClass('active');
                }
                $("#log_error_mail").text(" ");
                $("#log_error_password").text(" ");
                var log_error_mail = true;
                var log_error_password = true;
                var log_mail;
                var log_password;
                LoginProcess();
                $("#Loginform").submit(function(){
                	log_error_mail = false; 
                    logcheckMail();
                    logcheckPassword();
                    if(log_error_mail===false && log_error_password===false){
                    	return true;
                    }
                    else{
                    	$("#log_error_password").text("*Invalid Mail Or Password");
                    	return false;
                    }                    
                })
                function LoginProcess(){
                	$("#log_mail").focusin(function(){
                		$("#log_error_mail").text(" ");
                		$("#log_error_mail").css("padding","10px");
                	})
                	$("#log_mail").keyup(function(){
                		logcheckMail();
                		$("#log_error_mail").css("padding","5px");
                	})
                	$("#log_mail").focusout(function(){
                		logcheckMail();
                		$("#log_error_mail").css("padding","5px");
                	})
                	$("#log_password").focusin(function(){
                		$("#log_error_password").text(" ");
                		$("#log_error_password").css("padding","10px");
                	})
                	$("#log_password").keyup(function(){
                		logcheckMail();
                		logcheckPassword();
                		$("#log_error_password").css("padding","5px");
                	})
                	$("#log_password").focusout(function(){
                		logcheckMail();
                		logcheckPassword();
                		$("#log_error_password").css("padding","5px");
                	})
                }
                function logcheckMail(){
                	log_mail = $("#log_mail").val();
                	if(log_mail==""){
                		$("#log_error_mail").text("*Mail is Mandatory");
                		$("#log_error_mail").show();
                		log_error_mail=true;
                	}
                }
                function logcheckPassword(){                	
                	log_mail = $("#log_mail").val();
                	log_password = $("#log_password").val();
                	if(log_password == ""){
                		$("#log_error_password").text("*Password is Mandatory");
                		$("#log_error_password").show();
                		log_error_password=true;
                	}                	
               		$.ajax({
               			url:"LoginProcess",
               			method:"POST",
               			data:{
               				mail:log_mail,
               				password:log_password,
               			},
               			success:function(data){
               				const val = data.split(",");
               				if(val[0]!=="no" && val[1]!=="no"){
               					$("#log_userid").val(val[0]);
               					$("#log_fname").val(val[1]);
               					log_error_mail=false;
               					log_error_password=false;
               				}
               				else{                					                           		                            		
                           		log_error_password=true;
               				}
               			},
               			error:function(data){}
               		})
                	
                }
            });	
        </script>
        <script type="text/javascript" src="Web-js/Register.js"></script>
        <style type="text/css"> </style>
    </head>
    <body>
        <div class="header">
                <ul class="navbar">
                    <li><a href="#Home">Home</a></li>
                    <li><a href="#About">About</a></li>
                    <li><a href="#info">info</a></li> 
                    <li><a href="#Contact">Contact</a></li>                   
                </ul>
                <ul class="credentials">
                	<li><button id="Login">Login<i class="fa fa-sign-in" aria-hidden="true" style="padding-left:10px "></i></button></li>
                	<li><button id="Register">Register<i class="fa fa-user-plus" aria-hidden="true" style="padding-left:10px "></i></button></li>	
                </ul>
        </div>
        <div class="content blur">
            <div id="Home">
                    <img src="images/BeFunky-sample.jpg">
                    <div class="content-info">
                        <h1>Welcome </h1><br><p>Here You can save your notes and can make todo list.Kindly Register and Login to get access to the Service.Thank you once again!</p>
                    </div>
            </div>
            <div id="About">                
                    <div class="content-info">
                        <h1>About </h1><br><p>This web application alows the user to take notes and can shedule Todo list. It is a Web-Project done during Bootathon-II </p>
                    </div>
                    <img src="https://assets.nintendo.com/image/upload/c_pad,f_auto,h_613,q_auto,w_1089/ncom/en_US/games/switch/n/notes-switch/hero?v=2021120506">
            </div>
             <div id="info">
             		<img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg">
                    <div class="content-info">
                        <h1>info </h1><br><p>Done by <br> --------</p>
                    </div>                   
            </div>
            <div id="Contact">                    
                    <div class="content-info">
                        <h1>Contact </h1><br><p>Mail:abcd@gmail.com<br>Phno:88******67</p>
                    </div>
                    <img src="https://cdn.pixabay.com/photo/2018/03/22/02/37/email-3249062__480.png"> 
            </div>
        </div>
        <div class="Login">
            <div class="Login-header">
                <h1>Login<i class="fa fa-sign-in" aria-hidden="true" style="padding-left:10px "></i></h1>
                <button class="close-btn"><i class="fa fa-times" aria-hidden="true"></i></button>
            </div>
            <div class="Login-content">
                <form id="Loginform" method="post" action="Login-2.jsp">
                	<input id="log_userid" type="hidden" name="log_userid"><input id="log_fname" type="hidden" name="log_fname">
                    <input id="log_mail" type="text" placeholder="Mail" name="mail" value=""><br>
                    <p id = "log_error_mail"></p>                    
                    <input id="log_password" type="password" placeholder="Password" name="password" value=""><br>
                    <p id = "log_error_password"></p>
                    <input type="submit" value="Submit">
                </form>
                <div class="reference"><p>Doesn't have an account?</p><a href="#">click here</a></div>                
            </div>
        </div>
        <div class="Register active">
            <div class="Register-header">
                <h1>Register<i class="fa fa-user-plus" aria-hidden="true" style="padding-left:10px "></i></h1>
                <button class="close-btn"><i class="fa fa-times" aria-hidden="true"></i></button>
            </div>
            <div class="Register-content">
                <form id="RegisterForm" method="post">
                    <input id="Reg_fname" type="text" placeholder="FirstName" name="fname"> 
                    <input id="Reg_lname" type="text" placeholder="LastName" name="lname"><br>
                    <p id="error_fname">Firstname</p>
                    <p id="error_lname">Lastname</p><br>
                    <input id="Reg_mail" type="text" placeholder="Mail" name="mail">                    
                    <input id="Reg_phno"type="text" placeholder="Phno" name="phno"><br>
                    <p id="error_mail">Mail</p>
                    <p id="error_phno">Phno</p><br>
                    <input id="Reg_Password" type="password" placeholder="Password" name="Password">                    
                    <input id="Reg_Confirm-Password" type="password" placeholder="Confirm-Password" name="Confirm-Password"><br>
                    <p id="error_Password">Password</p>
                    <p id="error_Confirm-Password">Confirm-Password</p><br>
                    <input id="Reg_submit"type="submit" value="Register">
                    <input type="button" value="Clear">
                </form>
            </div>
        </div>
    </body>
</html>

























<!-- <html>
    <head>
        <title></title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Login.css"> 
        <link rel="stylesheet" href="Register.css"> 
        <script type="text/javascript">
	        history.pushState(null, null, location.href);
	        window.onpopstate = function () {
	            history.go(1);
	        };
    	</script>
        <script type="text/javascript">
        	$(document).ready(function(){
                $('#Login').click(function(){
                	$('.Register').removeClass('active');
                    $('.content').addClass('blur');
                    $('.Login').addClass('active');
                });
                $('#Register').click(function(){
                	$('.Login').removeClass('active');
                    $('.content').addClass('blur');
                    $('.Register').addClass('active');
                });
                $('.content').click(function(){
                    $('.content').removeClass('blur');
                    $('.Login').removeClass('active');
                    $('.Register').removeClass('active');
                });
            });
        </script>
        <style type="text/css">
            *{
            	border:0;
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            	body{
           			padding-top:65px;
            		position: absolute;
            		background: linear-gradient(to top right, #33ccff 0%, #ff99cc 100%);
            		background-repeat: no-repeat;
            		background-attachment: fixed;
            	}
                .header-body{
                    display: inline-flex;
                    flex-wrap:wrap;
                	position: fixed; 
                	top:0;
                	left:0;
                	right:0;
                    background-color: #6666c2;
					width: 100%;
					min-width: 80%;
                }
                		.lists{
                			border:2px solid black; 
                			width: 50%;
                		} 
                        ul{
                        	display:block;
                        	border:2px solid black; 
                        	/* margin-top:10px; */
                            list-style: none;
                            /* padding: 10px 5px 10px 0px; */
                        }
                        a,li{
                            display: inline;
                            list-style: none;
                            text-decoration: none;
                            color: white;
                            font-size: large;
                        }
                            a{
                                padding: 20px 25px 20px 25px;  
                            }
                            a:link{
                            	text-decoration: none;
                            	color:white;
                            }
            .Credential{
            	/* padding:20px 10px 20px 40px ; */
                float: right;
            }
            	#Login,#Register{
            		padding:10px 20px 10px 20px;
            		font-size:larger;
            		color: white;
            		background-color: #a361c7;
            	}
                .Login,.Register{
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%,-50%) scale(0);
                    border: 1px solid black;
                    border-radius:10px;
                    z-index: 10;
                    background-color: white;
                    width: 500px;
                    height:300px;
                    max-width: 80%;
                }
                .active{
					transform: translate(-50%,-50%) scale(1);
				}
            .content{
                padding: 50px;
            }
            	.blur{
					filter:blur(16px);
					position: fixed;
				}
                     #Home,#About,#Contact,#info{
                     	pointer-events: none;
                        display: flex;                    
                    }
                    .content-info>h1{
                    	font-family: monospace;
                    	font-size: 50px;
                    	color: white;
                    }
                    .content-info{
                    	display: block;
                    }
                    img{
                    	padding:10px;
                        size: 20%;
                    }
        </style>
    </head>
    <body>
        <div class="header-body">
           <div class="lists">
           	   <nav>
                <ul class="ul-task">
                    <li><a href="#Home">Home</a></li>
                    <li><a href="#About">About</a></li>
                    <li><a href="#Contact">Contact</a></li>
                    <li><a href="#info">info</a></li>
                    
                </ul>
               </nav>
           </div>
           <div class="Credential">
           		<input type="submit" id="Login" value="Login">
           		<input type="submit" id="Register" value="Register">
        	</div>
        </div>
        <div class="content">
            <div id="Home">
                    <img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg">
                    <div class="content-info">
                        <h1>Home </h1><br><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus animi dignissimos maxime amet fugit! Consectetur omnis labore, provident debitis dolorum nulla minima excepturi quasi magni modi cupiditate ullam doloremque cumque.</p>
                    </div>
            </div>
            <div  id="About">                
                    <div class="content-info">
                        <h1>About </h1><br><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus animi dignissimos maxime amet fugit! Consectetur omnis labore, provident debitis dolorum nulla minima excepturi quasi magni modi cupiditate ullam doloremque cumque.</p>
                    </div>
                    <img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg">
            </div>
            <div id="Contact">
                    <img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg">
                    <div class="content-info">
                        <h1>Contact </h1><br><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus animi dignissimos maxime amet fugit! Consectetur omnis labore, provident debitis dolorum nulla minima excepturi quasi magni modi cupiditate ullam doloremque cumque.</p>
                    </div> 
            </div>
            <div id="info">
                    <div class="content-info">
                        <h1>info </h1><br><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus animi dignissimos maxime amet fugit! Consectetur omnis labore, provident debitis dolorum nulla minima excepturi quasi magni modi cupiditate ullam doloremque cumque.</p>
                    </div>
                    <img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg">
            </div>
        </div>
        <div class="Login ">
            <div class="Login-header">
                <h1>Login</h1>
            </div>
            <div class="Login-content">
                <form action="Login-2.jsp">
                    <input type="text" placeholder="Username" name="uname"><br>
                    <input type="password" placeholder="Password"><br>
                    <input type="submit" value="Submit">
                </form>
            </div>
        </div>
        <div class="Register">
            <div class="Register-header">
                <h1>Register</h1>
                
            </div>
            <div class="Register-content">
                <form action="">
                    <input type="text" placeholder="FullName">
                    <input type="text" placeholder="LastName"><br>
                    <input type="text" placeholder="MailID">
                    <input type="text" placeholder="Ph No"><br>
                    <input type="password" placeholder="Password" name="Password">
                    <input type="password" placeholder="Password" name="Confirm-Password"><br>
                    <input type="submit" value="Register">
                    <input type="button" value="Clear">
                </form>
            </div>
        </div>
    </body>
</html> -->
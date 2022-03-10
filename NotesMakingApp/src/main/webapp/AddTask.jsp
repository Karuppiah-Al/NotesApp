<html>
    <head>
        <title>AddTask</title>
        <!-- <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script> -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="Web-css/AddTask.css">
        <script type="text/javascript" src="Web-js/AddTask.js"></script>
        <jsp:include page="taskManaging.jsp" flush="true"></jsp:include>
        <script type="text/javascript">
        	$(document).ready(function(){
        		var l;
        		var username = $("#username").val() ;
        		fetchTasks();
        		$(".Add ").hover(function(){
                    $(".options").css("display","block");
                    $(".options").addClass("animation");  
                    $(".Add").addClass("indexout");
        		},function(){
                    $(".options").css("display","none");
                    $(".options").removeClass("animation");
                    $(".Add").removeClass("indexout");
        		});
        		$(".View-options").find("a").click(function(){
        			var id = $(this).attr("id");
					if(id=="Taskbtn"){
						$("#Taskbtn").addClass("active");
						$("#Todobtn").removeClass("active");
						$(".task-box").addClass("activetab");
						$(".task-box").removeClass("notvisible");
        				$(".todo-box").addClass("notvisible");
					}
					else{
						$("#Todobtn").addClass("active");
						$("#Taskbtn").removeClass("active");
						$(".todo-box").addClass("activetab");
						$(".todo-box").removeClass("notvisible");
						$(".task-box").addClass("notvisible");
					}
        		});
        		$("#Task-getter-button").click(function(){
        			$(".task-getter-box").addClass("show");
        			$(".main").addClass("blur");
        			$("body").css("background","hsla(180,0%,50%,0.25)");
        		});
        		$("#task-getter-box-close").click(function(){
        			$(".task-getter-box").find("input[type=text]").val(" ");
        			$(".task-getter-box").find("textarea").val(" ");
        			$(".task-getter-box").find("span").html(" ");
        			$(".task-getter-box").removeClass("show");
        			$(".main").removeClass("blur");
        			$("body").css("background-color","white");
        		});
        		$("#task-getter-box-add").click(function(){
        			var flag = false;
        			var notesid = getNotesid(username);
        			var vnote = $("#notes").val();
        			var vtitle = $("#title").val();
        			var jcreated_on = new Date();
        			var vcreated_on = jcreated_on.getFullYear()+'-'+(jcreated_on.getMonth()+1)+'-'+jcreated_on.getDate() ;
        			var vedited_on = jcreated_on.getFullYear()+'-'+(jcreated_on.getMonth()+1)+'-'+jcreated_on.getDate();
        			if(vnote.length!=0){
        				 if(l==2){
        					 $(".task-box").find(".content").html(" ");
        					 l++;
        				 }
	        			 $.ajax({
	        				url:"Insertion",
	        				method:"POST",
	        				data:{
	        					notesid:notesid,				
	        					userid:username,
	        					statusid:1,
	        					note:vnote,
	        					title:vtitle,
	        					created_on:vcreated_on,
	        					edited_on:vedited_on,
	        				},
	        				cache:false,
	        				success:function(data,textstatus,jqXHR){
	        					alert("Success");
	        				},
	        				error:function(jqXHR, textStatus, errorThrown){}
	        			});  
        				/* $(".task-box").find(".content").append('<div class="tasks-stored" id="'+notesid+'"><h3>'+vtitle+'</h3><!-- title --><div class="tasks-stored-settings" id = "'+notesid+'-options"><ul class="tasks-stored-options"><li><a href="#">Save</a></li><li><a href="#">Archieve</a></li><li><a href="#">Delete</a></li></ul><button><i class="fa fa-angle-left" aria-hidden="true"></i></button></div><textarea >'+vnote+'</textarea><!-- task --></div>'); */
        				var saveIcon = '<i class="fa fa-floppy-o" id="save" aria-hidden="true"></i>';
			 			var archieveIcon='<i class="fa fa-star-o" id="archieve" aria-hidden="true"></i>';
			 			var deleteIcon='<i class="fa fa-trash-o" id="delete" aria-hidden="true"></i>';
			 			const options = '<ul class="tasks-stored-options"><li><a href="#">'+saveIcon+'</a></li><li><a href="#">'+archieveIcon+'</a></li><li><a href="#">'+deleteIcon+'</a></li></ul><button><i class="fa fa-angle-left" aria-hidden="true"></i></button>';
			 			$(".task-box").find(".content").append('<div class="tasks-stored" id="'+notesid+'"><h3>'+vtitle+'</h3><div class="tasks-stored-settings" id = "'+notesid+'-options">'+options+'</div><!-- title --><textarea >'+vnote +'</textarea><!-- task --></div>');
        				optionDisplay();
        				autoSize();
        			}
        		});
        		function getNotesid(username){
        			var date = new Date;
        			var notesid = 'NOTEID'+username.substring(0,4).toUpperCase();
        			notesid+=date.getFullYear()+''+(date.getMonth()+1)+''+date.getDate()+date.getTime(); 
        			return notesid;
        		}
        		function fetchTasks(){
        			$.ajax({
        				url:"Fetching",
        				method:"GET",
        				data:{
        					statusid:1,
        					username:username,
        				},
        				success:function(data){
        					l = data.length;
        					if(l>2){
        						let obj = $.parseJSON(data);
   						 		$.each(obj,function(key,value){//0,1,2
   						 			var saveIcon = '<i class="fa fa-floppy-o" id="save" aria-hidden="true"></i>';
   						 			var archieveIcon='<i class="fa fa-star-o" id="archieve" aria-hidden="true"></i>';
   						 			var deleteIcon='<i class="fa fa-trash-o" id="delete" aria-hidden="true"></i>';
   						 			const options = '<ul class="tasks-stored-options"><li><a href="#">'+saveIcon+'</a></li><li><a href="#">'+archieveIcon+'</a></li><li><a href="#">'+deleteIcon+'</a></li></ul><button><i class="fa fa-angle-left" aria-hidden="true"></i></button>';
   						 			$(".task-box").find(".content").append('<div class="tasks-stored" id="'+value.notesid+'"><h3>'+value.title+'</h3><div class="tasks-stored-settings" id = "'+value.notesid+'-options">'+options+'</div><!-- title --><textarea >'+value.notes+'</textarea><!-- task --></div>'); 
   						 		});
   						 		optionDisplay();
	   						 	autoSize();
        					}
        					else{
        						$(".task-box").find(".content").append('<h1>Sorry! currently no Tasks are to view</h1><img src="https://iconarchive.com/download/i18743/iconshock/real-vista-project-managment/task-notes.ico" alt="no image">');
        						$(".task-box").find(".content").css("display","block");
        					}
        				},
        				error:function(data){}
        			});
        		}
        		function optionDisplay(){
        			var flag = true;
        			var id;
	        		$(".tasks-stored-settings button").click(function(){	        			
	        			id = $(this).closest(".tasks-stored-settings").attr("id");
	        			if(flag==true){
    						$("#"+id).find("button").css({"transform":"rotate(180deg)","font-size":"50px"});
		        			$("#"+id).find(".tasks-stored-options").css("display","inline-block");
		        			flag = false;
    					}
	        			else{
	        				$("#"+id).find("button").css({"transform":"rotate(360deg)","font-size":"xx-large"});
	        				$("#"+id).find(".tasks-stored-options").css("display","none");
	        				flag = true;
	        			}
	        			$("#"+id).find(".fa").click(function(){
	        				var operation = $(this).attr("id");	 
	        				
	        				var idname = $(this).closest(".tasks-stored").attr("id");
	        				if(operation=="save"){
	        					noteFunction(idname,1)	
	        				}
	        				if(operation=="archieve"){
	        					noteFunction(idname,2)
	        				}
	        				if(operation=="delete"){
	        					noteFunction(idname,3)
	        				}
	        			});
	        		});
        		}
        		function noteFunction(idname,operationid){
        			var vtitle = $("#"+idname).children("h3").text();
        			var vnotes = $("#"+idname).children("textarea").val();
        			alert(idname+" "+vtitle+" "+operationid);
        			$.ajax({
        				url:"NoteFunctions",
        				method:"POST",
        				data:{
        					userid:username,
        					title:vtitle,
        					notes:vnotes,
        					notesid:idname,
        					statusid:operationid,
        					edited_on: new Date().getFullYear()+'-'+(new Date().getMonth()+1)+'-'+new Date().getDate(),
        				},
        				success:function(data){
        					alert(data); 
        					 $(".task-box").find(".content").html(""); 
        					fetchTasks();
        				},
        				error:function(data){}
        			})
        		}
        		function autoSize(){
        			$(".task-box").find("textarea").each(function () {
						this.setAttribute("style", "height:" + (this.scrollHeight+5) + "px;overflow:auto;min-height:100px;text-align:justify;");
					}).on("input", function () {
						this.style.height = "auto";
						this.style.height = (this.scrollHeight+5) + "px";
					});
        		}
        	});
        </script>
        <style type="text/css">
        	html body{
        		height:100%;
        		overflow: auto; 
        		background-color: white;
        	}
        	.task-getter-box{
        		position: fixed;
        		top:150px;
        		left:350px;
        		border:2px solid black;
        		border-radius:5px;
        		display:none;
        		width:50%;
        		height:60%!important;
        		overflow:auto;
        		min-height:50%;
        		text-align: left;
        		padding: 10px;
        		box-shadow: 3px 3px 10px 10px #6666c2;
        	}
        	.blur{
        		filter:blur(16px);
        		pointer-events: none;
        	}
        	.show{
        		background-color:white;
        		display:block;
        		z-index:300;
        	}
        	.close-btn{
        		border:0;
        		font-size:x-large;
        		float:right;
        		color:#6666c2;
        		margin-right: 10px;
        		background-color: white;
        	}
        	.task-getter-box label{
        		color:rgba(31, 87, 139, 0.938) ;
        		font-weight: bolder;
        		font-size: xx-large;
        	}
        	.task-getter-box input[type=text],.task-getter-box textarea,.task-getter-box input[type=button]{
        	 	width:100%;
        	 	border:2px solid #6666c2;
        	 	border-radius:5px;
        	 	font-weight: bold;
        	 	margin: 3px 0px;
        	}
        	.task-getter-box input[type=text]{
        		height: 40px;
        	}
        	.task-getter-box textarea{
        		height: 150px;
        	}
        	.task-getter-box input[type=button]{
        		background-color: #6666c2;
        		color:white;
        		font-size: x-large;
        		height: 50px;
        	}
        	/* ############################################################################## */
        	.task-box .content{
        		padding:20px;
        		padding-left:90px;
        		display:block; 	
        	}
        	 .task-box .content .tasks-stored{
        	 	padding:10px;
        	 	float:left;
        	 	border:2px solid rgba(0,0,0,0.2);
        	 	border-radius:5px;
        	 	margin:10px;
        	 	width:100%;
        	 	min-height:100px;
        	 	box-shadow: 5px 10px 5px -5px grey;
        	 }
        	 /* .task-box .content .tasks-stored:after{
				content:" ";
				display:block;
				margin:0 auto;
				width:70%;
				padding-top: 20px;
				border-bottom: 2px solid black;
				box-shadow: 0 10px 10px -5px  grey;        	         	 
        	 } */
        	 .task-box .content .tasks-stored h3{
        	 	width:60%;
        	 	text-align: left;
        	 	float:left;
        	 }
        	 .task-box .content .tasks-stored  button{
        	 	border:none;
        	 	float:right;
        	 	font-size: xx-large;
        	 	background-color: white;
        	 }
        	 .task-box .content .tasks-stored .tasks-stored-options{
        	 	list-style:none;
        	 	float:right;  
        	 	display:none;
        	 	/* border: 2px solid rgba(31, 87, 139, 0.938) ;  */
        	 }
        	 .task-box .content .tasks-stored .tasks-stored-options li{
        	 	width:60px;
        	 	padding:5px;
        	 	display: inline-block; 
        	 }
        	 .task-box .content .tasks-stored .tasks-stored-options li a{
        	 	text-decoration: none;
        	 	color:#6666c2;
        	 	border: 2px solid #6666c2; 
        	 	display: block;
        	 	border-radius:3px;
        	 	font-size: xx-large;
        	 }
        	 .task-box .content .tasks-stored .tasks-stored-options li a:hover{
        	 	color:white;
        	 	background-color: #6666c2;
        	 }
        	 .content .tasks-stored textarea{
        	 	overflow:auto; 
        	 	border:2px solid #9468a1;
        	 	border-radius:5px;
        	 	width:100%;
        	 }
        </style>
    </head>
    <body>
    	<% String fname = (String)session.getAttribute("fname") ;
    		if(fname==null){%>
    			<jsp:forward page="header.jsp"></jsp:forward>
    		<%}
    	%>
    	<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" ); %>
    	<% String username = (String)session.getAttribute("username") ; %>    	
    	<input type="hidden" id="username" value="<%=username%>" name="username">
    	<div class="main ">
	    	<div class="Add">
	    		<button class="+button"><i class="fa fa-plus" aria-hidden="true"></i></button>
	    		<div class="options">
	                <ul>
	                    <li id="Task-getter-button"><a href="#">Task<i class="fa fa-tasks" aria-hidden="true"></i></a></li>
	                    <li id="Todo-getter-button"><a href="#">To-do<i class="fa fa-check-square" aria-hidden="true"></i></a></li>
	                </ul>
	            </div>	    		
	    	</div>
	    	<div class="view-options">
	    		<ul>
	    			<li><a href="#" id="Taskbtn" class="active" >Task</a></li>
	    			<li><a href="#" id="Todobtn" >To-do</a></li>
	    		</ul>
	    	</div>
	    	<div class="actual">
		    	<div class="todo-box notvisible" >
		    		<div class="content">
		            	<h1>Sorry! currently no To-do Lists are to view</h1>
		            	<img src="https://iconarchive.com/download/i18743/iconshock/real-vista-project-managment/task-notes.ico" alt="no image">
		        	</div>
		    	</div>
		    	<div class="task-box activetab" >
		    		<div class="content"><!-- 
		            	<div class="tasks-stored" id=""><h3>box1</h3>
	            		<div class="tasks-stored-settings" id = "box1"><ul class="tasks-stored-options"><li><a href="#">Save</a></li><li><a href="#">Archieve</a></li><li><a href="#">Delete</a></li></ul><button><i class="fa fa-angle-left" aria-hidden="true"></i></button></div>	
		            	<textarea >A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.</textarea></div> -->
		        	</div>
		    	</div>
	    	</div>
    	</div>
    	<div class="task-getter-box ">
       		<label>Title</label><button class="close-btn" id="task-getter-box-close"><i class="fa fa-times" aria-hidden="true"></i></button>
       		<input type="text" id="title"><br>
       		<label>Add the Task here</label><br>
       		<textarea id = "notes" ></textarea><br>
       		<input id="task-getter-box-add" type="button" value="Add" ><br>
       		<span id="result" ></span>
       	</div>
    </body>
</html>






















<!-- <style type="text/css">
/* *{
  	padding:0;
  	margin:0;
  	box-sizing: border-box;
}
.Add{
  	position: fixed;
  	right:5px;
  	bottom:30px;
}
.Add button{
  	background-color:white; 
border: 5px solid rgba(31, 87, 139, 0.938) ;
color: rgba(31, 87, 139, 0.938) ;
padding: 20px;
text-align: center;
text-decoration: none;
display: inline-block;
margin: 4px;
cursor: pointer;
font-size:xx-large;
border-radius: 50%;
box-shadow: 0 6px #999;
float: right;
}
.Add button:hover{
	background-color:rgba(31, 87, 139, 0.938) ;
  	color: white;
}
.Add button:active {
	box-shadow: 0 5px #666;
	transform:translateY(4px);
}
.Add .options{
	width: 200px;
	display: none;
	border-radius:10px;
	transform:translate(-50px);
}
.Add .options ul{
	list-style: none;
	float: left;
	width: 200px; 
	text-align:center;
	border-radius:10px;
	border:2px solid  rgba(31, 87, 139, 0.938) ;
	border-radius:10px;
	background-color: rgb(7, 247, 47);
}
.Add .options ul li{
	float: right;
	display:block;
	width: 200px;
	text-align: centre;
	border-radius:10px;
	padding: 10px;
}
.Add .options ul li a{
	border-radius:10px;
	text-decoration: none;
	color: white ;
	display:block;
	padding:10px;
	margin:-10px -11px -10px -9px;
	font-size:large;
	
}
.Add .options ul li a .fa{
	padding-left: 10px;
}
.Add .options ul li a:hover{
	background-color: rgba(31, 87, 139, 0.938) ;
	color: white;				
	font-weight: bolder;
}
.view-options{
	padding:0;
	top:100px;
	left: 100px;
	right:100px;
	position:fixed;
}
.view-options ul{
	padding:0;
	margin:10px;
	display:flex;
	list-style: none;
	border-bottom:2px solid rgba(31, 87, 139, 0.938) ;
}
.view-options ul li{
	display:inline-block;
	padding: 10px;
	width:100px;
	text-align: center;
}
.view-options ul li a{
	margin:-10px;
	display:block;
	padding:10px;
	text-decoration: none;
	color:rgba(31, 87, 139, 0.938) ;
	font-size: larger;
	border-radius: 10px 10px 0 0;
}
.view-options ul li a.active{
	font-weight: bolder;
	color:rgba(31, 87, 139, 0.938) ;
	border-top: 2px solid rgba(31, 87, 139, 0.938) ;
	border-left: 2px solid rgba(31, 87, 139, 0.938) ;
	border-right: 2px solid rgba(31, 87, 139, 0.938) ;
	border-bottom:5px solid white;
	transform: translateY(4px);
}
.todo-box,.task-box{
	padding-top:0;
	top:170px;
	position:absolute;
	left: 100px;
	height: 400px;
	border-top: 0px;
	border-left: 2px;
	border-right: 2px;
	border-bottom: 2px;
	border-color:rgba(31, 87, 139, 0.938) ;
	border-style:solid;
	border-radius:10px;
	right:100px;
	transform: translateY(-5px);
}
.todo-box .content,.task-box .content{
	text-align: center;
}
.activetab{
	z-index: 100;
	display: block;
}
.notvisible{
	z-index:-1;
	display:none;
}
.indexout{
	z-index:200;
} */
</style> -->
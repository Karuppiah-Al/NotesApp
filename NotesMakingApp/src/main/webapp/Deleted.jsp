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
        <link rel="stylesheet" href="Web-css/Deleted.css">
        <script type="text/javascript" src="Web-js/AddTask.js"></script>
        <jsp:include page="taskManaging.jsp" flush="true"></jsp:include>
        <script type="text/javascript">
        	$(document).ready(function(){
        		var l;
        		var username = $("#username").val() ;
        		fetchTasks();
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
        		function fetchTasks(){
        			$.ajax({
        				url:"Fetching",
        				method:"GET",
        				data:{
        					statusid:3,
        					username:username,
        				},
        				success:function(data){
        					l = data.length;
        					if(l>2){
        						let obj = $.parseJSON(data);
   						 		$.each(obj,function(key,value){//0,1,2
   						 			var saveIcon = '<i class="fa fa-recycle" id="save" aria-hidden="true"></i>';
   						 			/* var archieveIcon='<i class="fa fa-star-o" id="archieve" aria-hidden="true"></i>'; */
   						 			var deleteIcon='<i class="fa fa-trash-o" id="delete" aria-hidden="true"></i>';
   						 			const options = '<ul class="tasks-stored-options"><li><a href="#">'+saveIcon+'</a></li><li><a href="#">'+deleteIcon+'</a></li></ul><button><i class="fa fa-angle-left" aria-hidden="true"></i></button>';
   						 			$(".task-box").find(".content").append('<div class="tasks-stored" id="'+value.notesid+'"><h3>'+value.title+'</h3><div class="tasks-stored-settings" id = "'+value.notesid+'-options">'+options+'</div><!-- title --><textarea readonly>'+value.notes+'</textarea><!-- task --></div>'); 
   						 		});//<li><a href="#">'+archieveIcon+'</a></li>
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
	        					noteFunction(idname,5)	
	        				}
	        				/* if(operation=="archieve"){
	        					noteFunction(idname,2)
	        				} */
	        				if(operation=="delete"){
	        					noteFunction(idname,4)
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
						this.setAttribute("style", "height:" + (this.scrollHeight+5) + "px;overflow:auto;");
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
        	/* ############################################################################## */
        	.task-box .content{
        		padding:70px;
        		display:block; 	
        	}
        	 .task-box .content .tasks-stored{
        	 	padding:10px;
        	 	float:left;
        	 	border:2px solid black;
        	 	border-radius:5px;
        	 	margin:10px;
        	 	width:100%;
        	 	box-shadow: 5px 5px 5px grey;
        	 }
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
        	 .task-box .content .tasks-stored .tasks-stored-options li a .fa{
        	 	display:block;
        	 }
        	 .task-box .content .tasks-stored .tasks-stored-options li a:hover{
        	 	color:white;
        	 	background-color: #6666c2;
        	 }
        	 #delete{
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
    	<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" ); %>
    	<% String username = (String)session.getAttribute("username") ; %>
    	<input type="hidden" id="username" value="<%=username%>" name="username">
    	<div class="main">
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
		    		<div class="content"></div>
		    	</div>
	    	</div>
    	</div>
    </body>
</html>




















<%-- <html>
    <head>
        <title></title>
        <!-- <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script> -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <jsp:include page="taskManaging.jsp" flush="true"></jsp:include>
        <link rel="stylesheet" href="Web-css/ViewNotes.css">
    </head>
    <body>
        <div class="content">
            <h1>Sorry! currently no Deleted tasks are to view</h1>
            <img src="https://iconarchive.com/download/i18743/iconshock/real-vista-project-managment/task-notes.ico" alt="no image">
        </div>
    </body>
</html> --%>
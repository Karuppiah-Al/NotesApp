<!-- <!DOCTYPE html>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
       	<link rel="stylesheet" href="taskmanaging.css">
       	<script type="text/javascript" src="taskManaging.js"></script>
    </head>
    <body>
        <header>
        	<nav class="navbar" id="taskbar">
                    <a href="ViewTask.jsp">
                        View <i class="fa fa-sticky-note" aria-hidden="true" style="padding-left: 5px"></i>
                       <div class="Sub-menu-1">
                       	 <ul>
                            <li>Task</li>
                            <li>Todo</li>
                            <li>Remainders</li>
                        </ul>  
                       </div>                                            	                       
                    </a>
                    <a href="AddTask.jsp">
                        Add	<i class="fa fa-plus" aria-hidden="true" style="padding-left: 4px"></i>   
                        <div class="Sub-menu-1">
                       	 <ul>
                            <li><a href="#">Task</a></li>
                            <li><a href="#">Todo</a></li>
                            <li><a href="#">Remainders</a></li>
                        </ul>  
                       </div>                   
                    </a>
                    <a href="Deleted.jsp">Delete<i class="fa fa-trash" aria-hidden="true" style="padding-left: 4px"></i></a>
                    <a href="Archieved.jsp">Archieve<i class="fa fa-archive" aria-hidden="true" style="padding-left: 4px"></i></a>
             </nav>
             <nav class="navbar" id="account">
                    <a href="#"><i class="fa fa-fw fa-user"></i>Log Out</a>
                    <a href="#"><i class="fa fa-tag" aria-hidden="true"></i>Help</a>
            </nav>
        </header>
    </body>
</html> --> 


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="Web-js/taskManaging.js"></script>
        <link rel="stylesheet" href="Web-css/taskmanaging.css">
        <script>
        	$(document).ready(function(){
        		
        	})
        </script>
    </head>
    <body>
    	<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" ); %>
    	<% String fname = (String)session.getAttribute("fname") ;
    		if(fname==null){%>
    			<jsp:forward page="header.jsp"></jsp:forward>
    		<%}
    	%>
    	
        <div class="menu-bar">
            <ul>
            	<li id="Add-tab--button"><a href="AddTask.jsp" >Add <i class="fa fa-plus" aria-hidden="true" style="padding-left: 5px"></i></a></li>
                <li id="Archieved-tab--button"><a href="Archieved.jsp" >Archieve <i class="fa fa-archive" aria-hidden="true" style="padding-left: 5px"></i></a></li>
                <li id="Deleted-tab--button"><a href="Deleted.jsp" >Delete <i class="fa fa-trash" aria-hidden="true" style="padding-left: 5px"></i></a></li>
                <li><a href="">Help <i class="fa fa-tag" aria-hidden="true" style="padding-left: 5px"></i></a></li>
                <li id="Profile-tab--button"><a href="Profile.jsp"><%=fname%><i class="fa fa-fw fa-user" aria-hidden="true" style="padding-left: 5px"></i></a></li>
                <li><a href="Logout.jsp">Log out <i class="fa fa-sign-out" aria-hidden="true" style="padding-left: 5px"></i></a></li>
            </ul><!-- <form action="Logout.jsp"><input type="submit" value="Logout"></form> -->
        </div>
    </body>
</html>
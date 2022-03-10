<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
		<script src="https://kit.fontawesome.com/c79ca39292.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    	<script type="text/javascript">
    		$(document).ready(function(){
    			var i = 1;
    			$("#add").click(function(){
    				newli();
    			})
    			$("#input").keypress(function(e){
    				if(e.which==13){
    					newli();
    				}
    			})
    			function newli(){
    				var text = $("#input").val();
    				$(".list").append('<li><input type="checkbox" id="list'+i+'">'+text+'<button class="delete"><i class="fas fa-window-close"></i></button></li>');
    				i++;
    				$("#input").val("");
    				$("#input").focus();
    			}
    		})
    	</script>
    	<style type="text/css">
    		*{
    			box-sizing: border-box;
    			margin: 0;
    			padding: 0;
    		}
    		html body{
    			height:100%;
    		}
    		.main{
    			display: flex;
    			flex-wrap: wrap;
    		}
    		.content{
    			border:2px solid black;
    			padding:10px;
    		}
    		.content #input{
    			outline:none;
    			width:75%;
    		}
    		.content #add{
    			width:25%;
    		}
    		.content .list{
    			list-style: none;
    			margin: 0px;
    			padding: 0px;
    		}
    		.content .list li{
    			position:relative;
    			width:100%;
    			padding:4px;
    		}
			.content .list .delete{
				position:absolute;
				font-size: xx-large;
				border:none;
				background: none;
				margin-top:-11px;
				margin-bottom:-10px;
				right: 0;
			}
    	</style>
	<title>Insert title here</title>
	</head>
	<body>	
		<!-- <button id="add">Add</button> -->
		<div class="main">	
			<div class="content">			
				<div><p>Sample1</p></div>
				<input type="text" id = "input"><button id="add">add</button>			
				<ul class="list">
					<!-- <li><input type="checkbox" id="list">aaaa<button class="delete"><i class="fas fa-window-close"></i></button></li> -->
				</ul>
			</div>
		</div>
	</body>
</html>
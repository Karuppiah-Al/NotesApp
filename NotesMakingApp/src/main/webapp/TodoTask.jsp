<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TodoList</title>
    <script src="https://kit.fontawesome.com/c79ca39292.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
   	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/libraries/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Web-css/todolist.css">
    <script type="text/javascript" src="Web-js/todolist.js"></script>
</head>
<body>

    <div class="list-container" id="list-containerid">

        <div class="button-container " id="button-containerid" >
            <button  class="addbutton buttonhover" id="addid">Add +</button>
        </div>
        <div class="pop-container" id="pop-containerid">
            <div class="header-part" id="header-partid">
                <div class="title">
                    <input type="text" id = "titleinput" placeholder="Enter the Title">
                </div>
                <div class="title-buttons" id="title-buttonsid">
                    <button id="addlistbutton" class="tbtn buttonhover" onclick="addlist(this)"> +</button>
                    <button id="savebutton" class="tbtn buttonhover" onclick="savelist(this)">save</button>
                    <button id="closebutton" class="tbtn buttonhover" onclick="hidepopup(this)">&times;</button>
                </div>
            </div>
            <div id="lists" class="listsbox">   </div>
        </div>
        <div class="box-container" id="box-containerid">

        </div>

        <div class="enter-list" id="enter-litid">
            <div class="data">
                <input type="text" id="data-input" placeholder=" Enter the data">
            </div>
            <div class="action-buttons">
                <button id="ok"> OK </button>
                <button id="cancel"> CANCEL </button>
            </div>
        </div>
    </div>
</body>
</html>
    
<html>
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
        <link rel="stylesheet" href="AddImgorPdf.css">
    </head>
    <body>
        <form action="">
            <div class="messagebox">
                    <label for="head"><h1>Add Img/Pdf</h1></label><br>
                <div class="title">
                    <label for="title">Title</label><br>
                    <input type="text" name="title"/><br>
                </div>
                <div class="content">
                    <label for="content">Add Notes here..</label><br>
                    <input type="file" name="img/pdf"/><br>
                    <input type="submit" value="Submit"/>
                </div>
            </div>
        </form>
    </body>
</html>
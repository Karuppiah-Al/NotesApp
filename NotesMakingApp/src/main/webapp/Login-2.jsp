<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = request.getParameter("log_userid");
		String fname = request.getParameter("log_fname");
		session.setAttribute("username",username);
		session.setAttribute("fname",fname);
	%>
	<jsp:forward page="AddTask.jsp"></jsp:forward>
</body>
</html>
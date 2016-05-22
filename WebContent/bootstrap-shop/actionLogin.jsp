<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="conn.Database"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

Database database = new Database(username,password);

int success = database.login(username,password);

if(success == 1){
	session.setAttribute("user",database);

	response.sendRedirect("index.jsp");
}
else{
	out.println(username + password);
	out.println("No.");
	
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="conn.Database" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Database database = (Database) session.getAttribute("user");
if (database == null){
	String username = "You are not logged in.";
	String password = "Nothing.";
	
	database = new Database(username,password);}

int pID = Integer.parseInt(request.getParameter("pID"));

int success = database.deleteGame(pID);

if(success != 0 ){
	response.sendRedirect("products.jsp");
}
else{
	out.println("There was an error in processing your request.");
}


%>
</body>
</html>
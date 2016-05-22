<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,conn.Database" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.text.DateFormat,java.text.SimpleDateFormat,java.text.ParseException,java.util.Date" %>

<%
	//Literal copy paste from index page cause i got lazy
	Database database = (Database) session.getAttribute("user");
	if (database == null){
	String username = "You are not logged in.";
	String password = "Nothing.";
	
	database = new Database(username,password);
	
	}
	String name = request.getParameter("name");
	String comment = request.getParameter("comment");
	int pID = Integer.parseInt(request.getParameter("pID"));
	int rating = Integer.parseInt(request.getParameter("rating"));
	
	//Setting date to current date
	Date Date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("h:mm a MM/dd/yyyy");
	String DateString = format.format(Date);
	
	//Calling insert function
	int success = database.insertComment(pID,name,comment,DateString,rating);
	
	if(success == 0){
		out.println("There was an error in adding your comment.");
	}
	else {
		response.sendRedirect("comments.jsp?pID="+pID);
	}
%>
	
</body>
</html>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.*,conn.Database" %> 
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
	
	database = new Database(username,password);
}

String title = request.getParameter("title");
String company = request.getParameter("company");
String date = request.getParameter("date");
String desc = request.getParameter("desc");
double price = Double.parseDouble(request.getParameter("price"));
String img = request.getParameter("img");
String own = request.getParameter("own");

//Getting genres
String [] gen = request.getParameterValues("genre");
int [] genre = new int[gen.length];

//Parsing genres to integer
for(int i = 0; i < gen.length; i++){
	genre[i] = Integer.parseInt(gen[i]);
}

int success = database.insertGame(title, company, date, desc, price, img, own,genre);

if(success != 0){
	response.sendRedirect("products.jsp?genre=0");
}
else{
	out.println("There was an error in processing your request.");
}

%>
</body>
</html>
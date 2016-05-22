<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="conn.Database,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
Database database = (Database) session.getAttribute("user");
if (database == null){
	String username = "You are not logged in.";
	String password = "Nothing.";
	
	database = new Database(username,password);
}
//Redirects to index if any other user tries to make a change in the database
if(!database.getID().equals("admin")){
	response.sendRedirect("index.jsp");
}
ResultSet rs = database.selectGenre();
%>
</head>
<body>


<hr class="soften">
<h2>Which genre would you like to delete?</h2>
<hr class="soften">



	<li><a>Genre</a>
	<ul>
	<%ResultSet genreRS = database.selectGenre();
	while(genreRS.next()){
		%>
		<li><a  href="deleteGenre2.jsp?genre=<%=genreRS.getInt("genre_id")%>"><i
				class="icon-chevron-right"></i><%=genreRS.getString("genre_name")%> </a></li>
		<%}	%>
	</ul></li>
	
	

</body>
</html>
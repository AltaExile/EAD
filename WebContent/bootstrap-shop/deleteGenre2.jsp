<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int genreID = Integer.parseInt(request.getParameter("genre"));
%>

<form action="actionDeleteGenre.jsp">
<h2>Are you sure?</h2>
<input type="hidden" name="genreID" value=<%=genreID %>>
<button type="submit">Yes</button>
<a href="deleteGenre.jsp"><button>No</button></a>
</form>

</body>
</html>
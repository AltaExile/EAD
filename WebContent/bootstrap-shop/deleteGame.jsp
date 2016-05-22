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
int pID=Integer.parseInt(request.getParameter("pID"));
%>

<form action="actionDelete.jsp">
<h2>Are you sure?</h2>
<input type="hidden" name="pID" value=<%=pID %>>
<button type="submit">Yes</button>
<a href="product.jsp?pID="<%=pID %>><button>No</button></a>
</form>

</body>
</html>
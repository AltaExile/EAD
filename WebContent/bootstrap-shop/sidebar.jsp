<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="utility.GenreDB" %>
<%@page import="javax.servlet.*" %> 
<%@page import="conn.Database" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
//GenreDB genreDB = new GenreDB();
%>
</head>
<body>
<div id="sidebar" class="span3">
					<!-- <div class="well well-small">
						<a id="myCart" href="product_summary.html"><img
							src="themes/images/ico-cart.png" alt="cart">3 Items in your
							cart <span class="badge badge-warning pull-right">$155.00</span></a>
					</div> -->
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<li class="subMenu open"><a>Genre</a>
							<ul>
							<%genreRS = genreDB.selectGenre();
							while(genreRS.next()){
								%>
								<li><a  href="products.jsp?genre=<%=genreRS.getString("genre_id")%>"><i
										class="icon-chevron-right"></i><%=genreRS.getString("genre_name")%> </a></li>
								<%}	%>
							</ul></li>
					<br/> 
					<div class="thumbnail" >
						<img src="${pageContext.request.contextPath}/bootstrap-shop/themes/images/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
</body>
</html>
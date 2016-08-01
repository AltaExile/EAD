<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,object.User,conn.Database,utility.GenreDB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String name = "You are not logged in.";
	String isAdmin = "";
	String address = "";
	String email = "";
	String contact = "";
	String password = "";
	
	User uBean = (User) session.getAttribute("uBean");
	if(uBean != null){
		name = uBean.getName();
		isAdmin = uBean.getisAdmin();
		address = uBean.getAddress();
		email = uBean.getEmail();
		contact = uBean.getContactNo();
		password = uBean.getPassword();
	}

%>
<%
GenreDB genreDB = new GenreDB();
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">
					Welcome! <strong><%=name %></strong>
				</div>
				<div class="span6">
					<!-- <div class="pull-right">
						<span class="btn btn-mini">Price (TBD)</span> <a
							href="product_summary.html"><span
							class="btn btn-mini btn-primary"><i
								class="icon-shopping-cart icon-white"></i> (TBD) Items in your
								cart </span> </a>
					</div> -->
				</div>
			</div>
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="index.jsp"><img
						src="${pageContext.request.contextPath}/bootstrap-shop/themes/images/logo.png" alt="Bootsshop" /></a>
					<form class="form-inline navbar-search" method="get"
						action="products.jsp">
						<input name="search" class="srchTxt" type="text" placeholder="Search here!"/> 
						<select name="genre" class="srchTxt">
						<option value="0">All</option>
						<%ResultSet genreRS = genreDB.selectGenre();
							while(genreRS.next()){
								%>	
								<option value="<%=genreRS.getString("genre_id")%>"><%=genreRS.getString("genre_name")%></option>
								<%}	%>
						</select>
						<label class="radio">
						<input type="radio" name="own" value="Yes" > Pre-owned
						</label>
						<label class="radio">
						<input type="radio" name="own" value="No" > New
						</label>
						<button type="submit" id="submitButton" class="btn btn-primary">Search!</button>
					</form>
<<<<<<< HEAD
					<div class="pull-right" style="padding-top:10px;">
					<a href="product_summary.jsp"><button class="btn btn-large" >Cart</button></a>
					</div>
					<% if(isAdmin.equals("Y")){ %>
						<ul class="nav" style="padding-left:15px; margin-top:20px;">
						<li class="dropdown" style="color:white;">
						<a href="#" class="dropdown-toggle" style="line-height:10px;"
												data-toggle="dropdown">Dropdown <b class="caret"></b></a>
												<ul class="dropdown-menu" style="min-width:120px">
													<li><a href="InsertGame.jsp">Insert Game</a></li>
													<li><a href="genres.jsp">Genres</a></li>
													<li><a href="imageUpload.jsp">Images?</a></li>
													<li><a href="stockReport.jsp">Stock Report</a></li>
												</ul></li>
										</ul>
						<%} else if(isAdmin.equals("N")){ %>
						<ul class="nav" style="padding-left:15px; margin-top:20px;">
						<li class="dropdown" style="color:white;">
						<a href="#" class="dropdown-toggle" style="line-height:10px;"
												data-toggle="dropdown">Dropdown <b class="caret"></b></a>
												<ul class="dropdown-menu" style="min-width:120px">
													<li><a href="modDetails.jsp">Update User Profile</a></li>
													<li><a href="gamesPurchased.jsp">Games Purchased</a></li>
												</ul></li>
										</ul>
						<% }%>
					<ul id="topMenu" class="nav pull-right" style="position:relative;float:left;padding:0px;">
=======
					
						<div>
						<a href="InsertGame.jsp"><span class="btn" style="margin-left:0px;margin-top:20px;margin-bottom:0px;margin-right:0px
						<% if (!database.getID().equals("admin")){out.println(";display: none");}%>">Insert game</span></a> <br>
						<a href="genres.jsp"><span class="btn" style="margin-left:0px;margin-top:20px;margin-bottom:0px;margin-right:0px
						<% if (!database.getID().equals("admin")){out.println(";display: none");}%>">Genres</span></a>
						<a href="imageUpload.jsp"><span class="btn" style="margin-left:0px;margin-top:20px;margin-bottom:0px;margin-right:0px
						<% if (!database.getID().equals("admin")){out.println(";display: none");}%>">Images?</span></a>
						
										
					<ul id="topMenu" class="nav pull-right" style="position:relative;float:top;">
>>>>>>> d5c9eec204b34b3edbe493e913ee86f403ac66a3
						<li class=""><a href="#login" role="button"
							data-toggle="modal" style="padding-top:10px;<% if(!name.equals("You are not logged in.")){out.println(";display: none");}%>">
							<span class="btn btn-large btn-success">Login</span></a> 
							<div id="login" class="modal hide fade in" tabindex="-1"
								role="dialog" aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">—</button>
									<h3>Login here!</h3>
								</div>
								<div class="modal-body">
									<form method = "post" action="../login">
											<input type="text" name="email" placeholder="Email"></br>
											<input type="password" name="password" placeholder="Password"></br>
										<a href="login.jsp">No account?</a></br>
										<input type="submit" class="btn btn-success" value="Login">
										<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
									</form>
								</div>
							</div></li>        
						</ul>                                        
						<ul id="topMenu" class="nav pull-right" style="position:relative;float:left;padding:0px;">	
							<li>
							<%if(uBean!=null){%>
							<a href="../Logout" class="btn btn-large btn-success">Logout</a>
							<%} %>
							</li>
					</ul>
					</div>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>
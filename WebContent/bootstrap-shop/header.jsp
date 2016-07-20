<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">
					Welcome! <strong><%= database.getID()%></strong>
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
						src="themes/images/logo.png" alt="Bootsshop" /></a>
					<form class="form-inline navbar-search" method="get"
						action="products.jsp">
						<input name="search" class="srchTxt" type="text" placeholder="Search here!"/> 
						<select name="genre" class="srchTxt">
							<option value ="0">All</option>
							<option value = "1">Action</option>
							<option value = "2">Action-Adventure</option>
							<option value = "3">Adventure</option>
							<option value = "4">Role-Playing</option>
							<option value = "5">Simulation</option>
							<option value = "6">Strategy</option>
							<option value = "7">Sports</option>
							<option value = "8">Etc</option>
						</select>
						<label class="radio">
						<input type="radio" name="own" value="Yes" > Pre-owned
						</label>
						<label class="radio">
						<input type="radio" name="own" value="No" > New
						</label>
						<button type="submit" id="submitButton" class="btn btn-primary">Search!</button>
					</form>
					
						<div>
						<a href="InsertGame.jsp"><span class="btn" style="margin-left:0px;margin-top:20px;margin-bottom:0px;margin-right:0px
						<% if (!database.getID().equals("admin")){out.println(";display: none");}%>">Insert game</span></a> <br>
						<a href="genres.jsp"><span class="btn" style="margin-left:0px;margin-top:20px;margin-bottom:0px;margin-right:0px
						<% if (!database.getID().equals("admin")){out.println(";display: none");}%>">Genres</span></a>
						<a href="imageUpload.jsp"><span class="btn" style="margin-left:0px;margin-top:20px;margin-bottom:0px;margin-right:0px
						<% if (!database.getID().equals("admin")){out.println(";display: none");}%>">Images?</span></a>
						
										
					<ul id="topMenu" class="nav pull-right" style="position:relative;float:top;">
						<li class=""><a href="#login" role="button"
							data-toggle="modal" style="padding-top:0px;<% if (!database.getID().equals("You are not logged in.")){out.println(";display: none");}%>"><span
								class="btn btn-large btn-success">Login</span></a>
							<div id="login" class="modal hide fade in" tabindex="-1"
								role="dialog" aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">—</button>
									<h3>Login here!</h3>
								</div>
								<div class="modal-body">
									<form action="actionLogin.jsp" method="post">
										<div class="control-group">
											<input type="text" name="username" placeholder="Username">
										</div>
										<div class="control-group">
											<input type="password" name="password" placeholder="Password">
										</div>
										<br>
										<input type="submit" class="btn btn-success" value="Login">
										<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
									</form>
								</div>
							</div></li>
							<%if(!database.getID().equals("You are not logged in.")){%>
							<a href="actionLogout.jsp" class="btn btn-large btn-success"> Logout</a>
							<%} %>
					</ul>
					</div>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>
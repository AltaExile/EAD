<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.*" %> 
<%@page import="conn.Database" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Importing JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<!--Less styles -->
<!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="themes/bootshop/bootstrap.min.css" media="screen" />
<link href="themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon" href="themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
	<script>
  function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#cover')
                    .attr('src', e.target.result)
            };

            reader.readAsDataURL(input.files[0]);
        }
  }
<%
Database database = (Database) session.getAttribute("user");
if (database == null){
	String username = "You are not logged in.";
	String password = "Nothing.";
	
	database = new Database(username,password);
}
%>
<%//Redirects to index if any other user tries to make a change in the database
if(!database.getID().equals("admin")){
	response.sendRedirect("index.jsp");
}
//Sets variables for placeholder text
int pID = 9999;
if(request.getParameter("pID") != null){
	pID = Integer.parseInt(request.getParameter("pID"));
}
database.pidSearch(pID);
int [] genreID = database.setGenre(pID); // Gets the list of genre for this game
ResultSet rs = database.selectGenre();

%>
</script>
</head> 
<body>
<%@include file="header.jsp" %>
<!-- Header End====================================================================== -->
<div id="mainBody">
<div class="container">
	<hr class="soften">
	<h1>Update Existing Game</h1>
	<hr class="soften"/>	
	<form action = "actionUpdate.jsp">
	<div class="row">
	<div class="span4">
	
			<div class="control-group" style="margin-bottom:0px">
			<label class="control-label" for="input14">Game ID</label>
			<div class="controls">
			  <input type="text" class="input-small" id="input14" name="pID" value="<%=pID%>" readonly>
			</div>
			</div>
			
			
			<label class="control-label" for="input11" style="margin-bottom: 0px">Game Title</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="input11" name="title" value="<%=database.getpTitle()%>">
            </div>
			
			<label class="control-label" for="input12">Company</label>
            <div class="controls">
              <input type="text" class="input-medium" id="input12" name="company" value="<%=database.getpCompany()%>">
            </div>
			
		    <label class="control-label" for="fileInput">Game Cover Upload</label>
            <div class="controls">
              <input class="input-file" id="fileInput" type="file" onchange="readURL(this)">
            </div>
			
			<label class="control-label" for="input12">File Name</label>
            <div class="controls">
              <input type="text" class="input-medium" id="input12" name="img" value="<%=database.getpImg()%>">
            </div>
			
			<label class="control-label" for="textarea">Description</label>
            <div class="controls">
              <textarea class="input-xlarge" id="textarea1" rows="3" name="desc" ><%=database.getpDesc()%></textarea>
    </div>
	</div>
		<div class="span3">
			
            <label  for="input12">Genre</label>
              <label class="checkbox">
              <%
              out.println("This game is part of genre no.");
              for(int i = 0; i<genreID.length;i++){
              out.println(genreID[i]);
              }
            	  %>
              
              
              <%while(rs.next()){ %>
				<label><input type="checkbox" name="genre" id="optionsCheckbox" value="<%=rs.getInt("genre_id")%>" 
				<%-- <%if(rs.getInt("genre_id") == genreID[i]){i++;out.println("checked");}%> --%>/>
				<%=rs.getString("genre_name")%></label>
				<%}%>
              </label>
            
			<label class="control-label" for="input12">Price (SGD)</label>
            <div class="controls">
              <input type="text" class="input-medium" id="input12" name="price" value ="<%=database.getpPrice()%>"/>
            </div>
         
			<label class="control-label" for="input12">Release Date</label>
            <div class="controls">
              <input type="date" class="input-medium" id="input12" name="date" value ="<%=database.getpDate()%>">
            </div>
			
			<label class="control-label" for="input12"></label>
             <label class="checkbox">
			<label><input type="radio" name="own" value="yes" <%if(database.getpOwn().equals("yes")){out.println("checked");} %>/> Preowned</label>
			<label><input type="radio" name="own" value="no"<%if(database.getpOwn().equals("no")){out.println("checked");} %>/> New</label>
			</div>
			
			

			<div class="span4">
			<img src="images/default.jpg" alt="images/default.jpg" style="display: inline" id="cover">
			</div>
			</div>
			
			<div class="form-actions">
            <button type="submit" class="btn btn-primary" name="btnSubmit">Save changes</button>
            <button class="btn">Cancel</button>
			</div>
	</form>
</div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	<%@include file="footer.jsp" %>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	
	<script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>
	
	<!-- Themes switcher section ============================================================================================= -->
<div id="secectionBox">
<link rel="stylesheet" href="themes/switch/themeswitch.css" type="text/css" media="screen" />
<script src="themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
	<div id="themeContainer">
	<div id="hideme" class="themeTitle">Style Selector</div>
	<div class="themeName">Oregional Skin</div>
	<div class="images style">
	<a href="themes/css/#" name="bootshop"><img src="themes/switch/images/clr/bootshop.png" alt="bootstrap business templates" class="active"></a>
	<a href="themes/css/#" name="businessltd"><img src="themes/switch/images/clr/businessltd.png" alt="bootstrap business templates" class="active"></a>
	</div>
	<div class="themeName">Bootswatch Skins (11)</div>
	<div class="images style">
		<a href="themes/css/#" name="amelia" title="Amelia"><img src="themes/switch/images/clr/amelia.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spruce" title="Spruce"><img src="themes/switch/images/clr/spruce.png" alt="bootstrap business templates" ></a>
		<a href="themes/css/#" name="superhero" title="Superhero"><img src="themes/switch/images/clr/superhero.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cyborg"><img src="themes/switch/images/clr/cyborg.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cerulean"><img src="themes/switch/images/clr/cerulean.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="journal"><img src="themes/switch/images/clr/journal.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="readable"><img src="themes/switch/images/clr/readable.png" alt="bootstrap business templates"></a>	
		<a href="themes/css/#" name="simplex"><img src="themes/switch/images/clr/simplex.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="slate"><img src="themes/switch/images/clr/slate.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spacelab"><img src="themes/switch/images/clr/spacelab.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="united"><img src="themes/switch/images/clr/united.png" alt="bootstrap business templates"></a>
		<p style="margin:0;line-height:normal;margin-left:-10px;display:none;"><small>These are just examples and you can build your own color scheme in the backend.</small></p>
	</div>
	<div class="themeName">Background Patterns </div>
	<div class="images patterns">
		<a href="themes/css/#" name="pattern1"><img src="themes/switch/images/pattern/pattern1.png" alt="bootstrap business templates" class="active"></a>
		<a href="themes/css/#" name="pattern2"><img src="themes/switch/images/pattern/pattern2.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern3"><img src="themes/switch/images/pattern/pattern3.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern4"><img src="themes/switch/images/pattern/pattern4.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern5"><img src="themes/switch/images/pattern/pattern5.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern6"><img src="themes/switch/images/pattern/pattern6.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern7"><img src="themes/switch/images/pattern/pattern7.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern8"><img src="themes/switch/images/pattern/pattern8.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern9"><img src="themes/switch/images/pattern/pattern9.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern10"><img src="themes/switch/images/pattern/pattern10.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern11"><img src="themes/switch/images/pattern/pattern11.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern12"><img src="themes/switch/images/pattern/pattern12.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern13"><img src="themes/switch/images/pattern/pattern13.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern14"><img src="themes/switch/images/pattern/pattern14.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern15"><img src="themes/switch/images/pattern/pattern15.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern16"><img src="themes/switch/images/pattern/pattern16.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern17"><img src="themes/switch/images/pattern/pattern17.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern18"><img src="themes/switch/images/pattern/pattern18.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern19"><img src="themes/switch/images/pattern/pattern19.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern20"><img src="themes/switch/images/pattern/pattern20.png" alt="bootstrap business templates"></a>
		 
	</div>
	</div>
</div>
<span id="themesBtn"></span>
</body>
</html>
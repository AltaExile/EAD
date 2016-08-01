<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.*,conn.Database" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
<%@include file="relStyle.jsp" %>

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
<style>
#payment div{
margin-top:100px;
}
</style>
<script>
<% 
Database database = (Database) session.getAttribute("user");
if (database == null){
	String username = "You are not logged in.";
	String password = "Nothing.";
	
	database = new Database(username,password);
}
%>
<%@page import="servlet.*" %>
<%@page import="utility.*" %>
</script>
</head>
<body>
	<%@include file = "header.jsp" %>
	<!-- Header End====================================================================== -->
	
	<div id="carouselBlk">
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<a href="products.jsp"><img style="max-width:400px;"
							src="${pageContext.request.contextPath}/bootstrap-shop/images/1.png" alt="special offers" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="products.jsp"><img style="max-width:400px;"
							src="${pageContext.request.contextPath}/bootstrap-shop/images/2.png" alt="" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="products.jsp"><img style="max-width:400px;"
							src="${pageContext.request.contextPath}/bootstrap-shop/images/3.png" alt="" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="products.jsp"><img style="max-width:400px;"
							src="${pageContext.request.contextPath}/bootstrap-shop/images/4.png" alt="" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="products.jsp"><img style="max-width:400px;"
							src="${pageContext.request.contextPath}/bootstrap-shop/images/5.png" alt="" /></a>
					</div>
				</div>
				
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="right carousel-control" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<%@include file="sidebar.jsp" %>
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<!-- <div class="well well-small">
						<h4>
							Featured Products <small class="pull-right">200+ featured
								products</small>
						</h4>
						<div class="row-fluid">
							<div id="featured" class="carousel slide">
								<div class="carousel-inner">
									<div class="item active">
										<ul class="thumbnails">
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/b1.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/b2.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/b3.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/b4.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/5.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/6.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/7.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/themes/images/products/8.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/9.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/10.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/11.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/1.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/2.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/3.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/4.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.jsp"><img
														src="${pageContext.request.contextPath}/images/products/5.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.jsp">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<a class="left carousel-control" href="#featured"
									data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
									href="#featured" data-slide="next">&rsaquo;</a>
							</div>
						</div>
					</div> -->
					<!-- <h4>Latest Products</h4>
					<ul class="thumbnails">
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.jsp"><img
									src="${pageContext.request.contextPath}/images/products/6.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>

									<h4 style="text-align: center">
										<a class="btn" href="product_details.jsp"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.jsp"><img
									src="${pageContext.request.contextPath}/themes/images/products/7.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.jsp"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.jsp"><img
									src="${pageContext.request.contextPath}/themes/images/products/8.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.jsp"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.jsp"><img
									src="${pageContext.request.contextPath}/themes/images/products/9.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.jsp"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.jsp"><img
									src="${pageContext.request.contextPath}/themes/images/products/10.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.jsp"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.jsp"><img
									src="${pageContext.request.contextPath}/themes/images/products/11.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.jsp"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
					</ul> -->
			<h1>Hey! This is empty for now, so check out our categories! :D</h1>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer ================================================================== -->
	<%@include file="footer.jsp" %>
	<!-- Footer End ================================================================== -->
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>

	<!-- Themes switcher section ============================================================================================= -->
	<div id="secectionBox">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-shop/themes/switch/themeswitch.css"
			type="text/css" media="screen" />
		<script src="themes/switch/theamswitcher.js" type="text/javascript"
			charset="utf-8"></script>
		<div id="themeContainer">
			<div id="hideme" class="themeTitle">Style Selector</div>
			<div class="themeName">Oregional Skin</div>
			<div class="images style">
				<a href="themes/css/#" name="bootshop"><img
					src="themes/switch/images/clr/bootshop.png"
					alt="bootstrap business templates" class="active"></a> <a
					href="themes/css/#" name="businessltd"><img
					src="themes/switch/images/clr/businessltd.png"
					alt="bootstrap business templates" class="active"></a>
			</div>
			<div class="themeName">Bootswatch Skins (11)</div>
			<div class="images style">
				<a href="themes/css/#" name="amelia" title="Amelia"><img
					src="themes/switch/images/clr/amelia.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="spruce" title="Spruce"><img
					src="themes/switch/images/clr/spruce.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="superhero" title="Superhero"><img
					src="themes/switch/images/clr/superhero.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="cyborg"><img src="themes/switch/images/clr/cyborg.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="cerulean"><img
					src="themes/switch/images/clr/cerulean.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="journal"><img src="themes/switch/images/clr/journal.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="readable"><img
					src="themes/switch/images/clr/readable.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="simplex"><img src="themes/switch/images/clr/simplex.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="slate"><img src="themes/switch/images/clr/slate.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="spacelab"><img
					src="themes/switch/images/clr/spacelab.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="united"><img src="themes/switch/images/clr/united.png"
					alt="bootstrap business templates"></a>
				<p
					style="margin: 0; line-height: normal; margin-left: -10px; display: none;">
					<small>These are just examples and you can build your own
						color scheme in the backend.</small>
				</p>
			</div>
			<div class="themeName">Background Patterns</div>
			<div class="images patterns">
				<a href="themes/css/#" name="pattern1"><img
					src="themes/switch/images/pattern/pattern1.png"
					alt="bootstrap business templates" class="active"></a> <a
					href="themes/css/#" name="pattern2"><img
					src="themes/switch/images/pattern/pattern2.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern3"><img
					src="themes/switch/images/pattern/pattern3.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern4"><img
					src="themes/switch/images/pattern/pattern4.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern5"><img
					src="themes/switch/images/pattern/pattern5.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern6"><img
					src="themes/switch/images/pattern/pattern6.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern7"><img
					src="themes/switch/images/pattern/pattern7.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern8"><img
					src="themes/switch/images/pattern/pattern8.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern9"><img
					src="themes/switch/images/pattern/pattern9.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern10"><img
					src="themes/switch/images/pattern/pattern10.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern11"><img
					src="themes/switch/images/pattern/pattern11.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern12"><img
					src="themes/switch/images/pattern/pattern12.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern13"><img
					src="themes/switch/images/pattern/pattern13.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern14"><img
					src="themes/switch/images/pattern/pattern14.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern15"><img
					src="themes/switch/images/pattern/pattern15.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern16"><img
					src="themes/switch/images/pattern/pattern16.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern17"><img
					src="themes/switch/images/pattern/pattern17.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern18"><img
					src="themes/switch/images/pattern/pattern18.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern19"><img
					src="themes/switch/images/pattern/pattern19.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern20"><img
					src="themes/switch/images/pattern/pattern20.png"
					alt="bootstrap business templates"></a>

			</div>
		</div>
	</div>
	<span id="themesBtn"></span>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.*" %> 
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
<style>
#payment div{
margin-top:100px;
}
</style>
</head>
<body>
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">
					Welcome!<strong> User</strong>
				</div>
				<div class="span6">
					<div class="pull-right">
						<span class="btn btn-mini">$155.00</span> <a
							href="product_summary.html"><span
							class="btn btn-mini btn-primary"><i
								class="icon-shopping-cart icon-white"></i> [ 3 ] Items in your
								cart </span> </a>
					</div>
				</div>
			</div>
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="index.html"><img
						src="themes/images/logo.png" alt="Bootsshop" /></a>
					<form class="form-inline navbar-search" method="post"
						action="products.html">
						<input id="srchFld" name="search" class="srchTxt" type="text" /> <select
							class="srchTxt">
							<option>All</option>
							<option value = "Action">Action</option>
							<option value = "adventure">Adventure</option>
							<option value = "rpg">RPG</option>
							<option value = "simulation">Simulation</option>
							<option value = "strategy">Strategy</option>
							<option value = "sports">Sports</option>
							<option value = "etc">Others</option>
						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Search!</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<!-- <li class=""><a href="special_offer.html">Specials Offer</a></li>
						<li class=""><a href="normal.html">Delivery</a></li>
						<li class=""><a href="contact.html">Contact</a></li> -->
						<li class=""><a href="#login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-success">Login</span></a>
							<div id="login" class="modal hide fade in" tabindex="-1"
								role="dialog" aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">�</button>
									<h3>Login Block</h3>
								</div>
								<div class="modal-body">
									<form class="form-horizontal loginFrm">
										<div class="control-group">
											<input type="text" id="username" placeholder="Username">
										</div>
										<div class="control-group">
											<input type="password" id="password" placeholder="Password">
										</div>
										<br>
										<button type="submit" class="btn btn-success">Sign in</button>
										<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
									</form>
								</div>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End====================================================================== -->
	
	<div id="carouselBlk">
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<a href="register.html"><img style="width: 100%"
							src="themes/images/carousel/1.png" alt="special offers" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="register.html"><img style="width: 100%"
							src="themes/images/carousel/2.png" alt="" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="register.html"><img
							src="themes/images/carousel/3.png" alt="" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="register.html"><img
							src="themes/images/carousel/4.png" alt="" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="register.html"><img
							src="themes/images/carousel/5.png" alt="" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="register.html"><img
							src="themes/images/carousel/6.png" alt="" /></a>
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
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<a id="myCart" href="product_summary.html"><img
							src="themes/images/ico-cart.png" alt="cart">3 Items in your
							cart <span class="badge badge-warning pull-right">$155.00</span></a>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<li class="subMenu open"><a>Genre</a>
							<ul>
								<li><a class="active" href="products.html"><i
										class="icon-chevron-right"></i>Action </a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Adventure</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Role-playing</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Simulations</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Strategy</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Sports</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Uncategorized</a></li>
							</ul></li>
					<br/> 
					<div class="thumbnail" >
						<img src="themes/images/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<div class="well well-small">
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
													<i class="tag"></i> <a href="product_details.html"><img
														src="themes/images/products/b1.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.html"><img
														src="themes/images/products/b2.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.html"><img
														src="themes/images/products/b3.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.html"><img
														src="themes/images/products/b4.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
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
													<i class="tag"></i> <a href="product_details.html"><img
														src="themes/images/products/5.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i> <a href="product_details.html"><img
														src="themes/images/products/6.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
														src="themes/images/products/7.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
														src="themes/images/products/8.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
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
													<a href="product_details.html"><img
														src="themes/images/products/9.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
														src="themes/images/products/10.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
														src="themes/images/products/11.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
														src="themes/images/products/1.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
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
													<a href="product_details.html"><img
														src="themes/images/products/2.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
														src="themes/images/products/3.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
														src="themes/images/products/4.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span>
														</h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
														src="themes/images/products/5.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4>
															<a class="btn" href="product_details.html">VIEW</a> <span
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
					</div>
					<h4>Latest Products</h4>
					<ul class="thumbnails">
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="themes/images/products/6.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>

									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="themes/images/products/7.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="themes/images/products/8.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="themes/images/products/9.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="themes/images/products/10.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img
									src="themes/images/products/11.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>Lorem Ipsum is simply dummy text.</p>
									<h4 style="text-align: center">
										<a class="btn" href="product_details.html"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="login.html">YOUR ACCOUNT</a> <a href="login.html">PERSONAL
						INFORMATION</a> <a href="login.html">ADDRESSES</a> <a
						href="login.html">DISCOUNT</a> <a href="login.html">ORDER
						HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="contact.html">CONTACT</a> <a href="register.html">REGISTRATION</a>
					<a href="legal_notice.html">LEGAL NOTICE</a> <a href="tac.html">TERMS
						AND CONDITIONS</a> <a href="faq.html">FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="special_offer.html">SPECIAL OFFERS</a> <a href="#">MANUFACTURERS</a>
					<a href="#">SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/twitter.png" title="twitter" alt="twitter" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">&copy; Bootshop</p>
		</div>
		<!-- Container End -->
	</div>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>

	<!-- Themes switcher section ============================================================================================= -->
	<div id="secectionBox">
		<link rel="stylesheet" href="themes/switch/themeswitch.css"
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
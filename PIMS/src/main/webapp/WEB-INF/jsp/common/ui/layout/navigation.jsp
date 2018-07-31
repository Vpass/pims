<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="x-navigation x-navigation-horizontal x-navigation-panel">
	<!-- Start Toggle Navigation -->
	<li class="xn-icon-button">
		<a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
	</li>
	<!-- End Toggle Navigation -->
	<!-- Start Search -->
	<li class="xn-search">
		<form role="form">
			<input type="text" name="search" placeholder="Search..."/>
	 	</form>
	</li>
	<!-- End Search -->
	<!-- Start Power Off -->
	<li class="xn-icon-button pull-right last">
		<a href="#"><span class="fa fa-power-off"></span></a>
		<ul class="xn-drop-left animated zoomIn">
			<li><a href="pages-lock-screen.html"><span class="fa fa-lock"></span> Lock Screen</a></li>
			<li><a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span> Sign Out</a></li>
		</ul>                        
	</li>
	<!-- End Power Off -->
</ul>
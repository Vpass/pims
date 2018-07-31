<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="page-sidebar">
	<ul class="x-navigation">
		<!-- Start Logo -->
		<li class="xn-logo">
			<a href="<c:url value="/"/>">VPASS</a>
			<a href="<c:url value="/"/>" class="x-navigation-control"></a>
		</li>
		<!-- End Logo -->
		
		<!-- Start Profile -->
		<li class="xn-profile">
			<a href="#" class="profile-mini">
				<img src="assets/images/users/avatar.jpg" alt="John Doe"/>
			</a>
			<div class="profile">
				<div class="profile-image">
					<img src="images/" alt="John Doe"/>
				</div>
				<div class="profile-data">
					<div class="profile-data-name">John Doe</div>
					<div class="profile-data-title">Web Developer/Designer</div>
				</div>
				<div class="profile-controls">
					<a href="<c:url value="/"/>" class="profile-control-left"><span class="fa fa-info"></span></a>
					<a href="<c:url value="/"/>l" class="profile-control-right"><span class="fa fa-envelope"></span></a>
				</div>
			</div>
		</li>
		<!-- End Profile -->
		
		<!-- Start Navigation Menu -->
		<li class="xn-title">Navigation</li>
		<li id="dashboard">
			<a href="<c:url value="/"/>"><span class="fa fa-dashboard"></span><span class="xn-text"> Dashboard</span></a>
		</li>
		<li class="xn-openable">
			<a href="<c:url value="/api/productList"/>"><span class="fa fa-pencil-square-o"></span><span class="xn-text"> 상품 관리</span></a>
			<ul>
				<li id="productList"><a href="<c:url value="/api/productList"/>"><span class="fa fa-list"></span> 상품정보 관리</a></li>
				<li id="productRegist"><a href="<c:url value="/api/productRegist"/>"><span class="fa fa-pencil"></span> 상품 등록</a></li>
				<li id="productBatchRegist"><a href="<c:url value="/api/productBatchRegist"/>"><span class="fa fa-list-alt"></span> 상품 일괄등록</a></li>
			</ul>
		</li>
		<!-- End Navigation Menu -->
	</ul>
</div>
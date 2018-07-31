<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="/WEB-INF/jsp/common/ui/resources_ui.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<!-- Start Page Container -->
	<div class="page-container">
		<!-- Start Side Bar -->
		<%@include file="/WEB-INF/jsp/common/ui/layout/sidebar.jsp"%>
		<!-- End Side Bar -->
		
		<!-- Start Page Content -->
		<div class="page-content">
			<!-- Start Navigation -->
			<%@include file="/WEB-INF/jsp/common/ui/layout/navigation.jsp"%>
			<!-- End Navigation -->
			
			<!-- Start Bread Crumb -->
			<ul class="breadcrumb">
				<li><a href="<c:url value="/"/>">Home</a></li>
				<li>상품 관리</li>
				<li class="active">상품 일괄등록</li>
			</ul>
			<!-- End Bread Crumb -->
			
			<!-- Start Page Title -->
			<div class="page-title"><h2><span class="fa fa-list-alt"></span> 상품 일괄등록</h2></div>
			<!-- End Page Title -->
			
			<!-- Start Page Content Wrapper -->
			<div class="page-content-wrap">
				<div class="row">
					<div class="col-md-12">
						<!-- Start Search Field -->
						
						<!-- End Search Field -->
						<!-- Start Data Table -->
						
						<!-- End Data Table -->
					</div>
				</div>
			</div>
			<!-- End Page Content Wrapper -->
		</div>
		<!-- End Page Content -->
	</div>
	<!-- End Page Container -->
	
	<!-- Start Template Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/actions.js"></script>
	<!-- End Template Script -->
</body>
</html>
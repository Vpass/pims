<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="/WEB-INF/jsp/common/ui/resources_ui.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		//selectStdGroup();
		movePageTop();
		var itemMngPropId = document.getElementsByName("itemMngPropId");
		
		$.each(itemMngPropId, function(index, itemMngPropId) {
			//alert(itemMngPropId.value); 
		});
		
		settingTable();
	});
	
	//Select Box - Group Category
	function selectStdGroup() {
		var stdLargeCategory = $("#stdLargeCategory").val();
		var stdMiddleCategory = $("#stdMiddleCategory").val();
		var stdSmallCategory = $("#stdSmallCategory").val();
		
		$.ajax({
			url: "<c:url value='/api/standardCategoryList?stdCtgLclsId="+stdLargeCategory+"&stdCtgMclsId="+stdMiddleCategory+"&stdCtgSclsId="+stdSmallCategory+"'/>",
			datatype: "json",
			success: function(data) {
				var resultArray = [];
	
				$.each(data, function(index, category) {
					$("#stdGroupCode").selectpicker("refresh");		//Select Box Reset
					
					if($.inArray(category.stdCtgGrpCd, resultArray) === -1) {
						resultArray.push(category.stdCtgGrpCd);
						$("#stdGroupCode").append("<option value='"+category.stdCtgGrpCd+"'>"+category.stdCtgGrpNm+"</option>");
					}
					//$("#stdGroupCode").find("option").remove().end().append("<option value=''>그룹분류</option>");
				});
			}
		});
	} 
	
	//Select Box - Large Category
	function selectStdLargeCategory() {
		var stdGroupCode = $("#stdGroupCode").val();
		var stdLargeCategory = $("#stdLargeCategory").val();
		var stdMiddleCategory = $("#stdMiddleCategory").val();
		var stdSmallCategory = $("#stdSmallCategory").val();
		
		$.ajax({
			url: "<c:url value='/api/standardCategoryList?stdCtgLclsId="+stdLargeCategory+"&stdCtgMclsId="+stdMiddleCategory+"&stdCtgSclsId="+stdSmallCategory+"'/>",
			datatype: "json",
			success: function(data) {
				var resultArray = [];
				
				$("#stdLargeCategory").find("option").remove().end().append("<option value=''>대분류</option>");
				
				if(stdGroupCode != "") {
					$.each(data, function(index, category) {
						$("#stdLargeCategory").selectpicker("refresh");		//Select Box Reset
						
						if($.inArray(category.stdCtgLclsId, resultArray) === -1) {
							resultArray.push(category.stdCtgLclsId);
							$("#stdLargeCategory").append("<option value='"+category.stdCtgLclsId+"'>"+category.stdCtgLclsNm+"</option>");
						}
					});
				}
				else {
					$.each(data, function(index, category) {
						$("#stdLargeCategory").selectpicker("refresh");		//Select Box Reset
					});
				}
			}
		});
	}
	
	//Select Box - Middle Category
	function selectStdMiddleCategory() {
		var stdGroupCode = $("#stdGroupCode").val();
		var stdLargeCategory = $("#stdLargeCategory").val();
		var stdMiddleCategory = $("#stdMiddleCategory").val();
		var stdSmallCategory = $("#stdSmallCategory").val();
		
		if(stdGroupCode !="" && stdLargeCategory != "") {
			$.ajax({
				url: "<c:url value='/api/standardCategoryList?stdCtgLclsId="+stdLargeCategory+"&stdCtgMclsId="+stdMiddleCategory+"&stdCtgSclsId="+stdSmallCategory+"'/>",
				datatype: "json",
				success: function(data) {
					var resultArray = [];
					
					$("#stdMiddleCategory").find("option").remove().end().append("<option value=''>중분류</option>");
					
					if(stdLargeCategory) {
						$.each(data, function(index, category) {
							$("#stdMiddleCategory").selectpicker("refresh");		//Select Box Reset
							
							if($.inArray(category.stdCtgMclsId, resultArray) === -1) {
								resultArray.push(category.stdCtgMclsId);
								$("#stdMiddleCategory").append("<option value='"+category.stdCtgMclsId+"'>"+category.stdCtgMclsNm+"</option>");
							}
						});
					}
					else {
						$.each(data, function(index, category) {
							$("#stdMiddleCategory").selectpicker("refresh");		//Select Box Reset
						});
					}
				}
			});
		}
	}
	
	//Select Box - Small Category
	function selectStdSmallCategory() {
		var stdGroupCode = $("#stdGroupCode").val();
		var stdLargeCategory = $("#stdLargeCategory").val();
		var stdMiddleCategory = $("#stdMiddleCategory").val();
		var stdSmallCategory = $("#stdSmallCategory").val();
		
		$.ajax({
			url: "<c:url value='/api/standardCategoryList?stdCtgLclsId="+stdLargeCategory+"&stdCtgMclsId="+stdMiddleCategory+"&stdCtgSclsId="+stdSmallCategory+"'/>",
			datatype: "json",
			success: function(data) {
				var resultArray = [];
				
				$("#stdSmallCategory").find("option").remove().end().append("<option value=''>소분류</option>");
				
				if(stdMiddleCategory != "") {
					$.each(data, function(index, category) {
						$("#stdSmallCategory").selectpicker("refresh");		//Select Box Reset
						
						if($.inArray(category.stdCtgSclsId, resultArray) === -1) {
							resultArray.push(category.stdCtgSclsId);
							$("#stdSmallCategory").append("<option value='"+category.stdCtgSclsId+"'>"+category.stdCtgSclsNm+"</option>");
						}
					});
				}
				else {
					$.each(data, function(index, category) {
						$("#stdSmallCategory").selectpicker("refresh");		//Select Box Reset
					});
				}
			}
		});
	}
	
	//Select Box - Detail Category
	function selectStdDetailCategory() {
		var stdGroupCode = $("#stdGroupCode").val();
		var stdLargeCategory = $("#stdLargeCategory").val();
		var stdMiddleCategory = $("#stdMiddleCategory").val();
		var stdSmallCategory = $("#stdSmallCategory").val();
		
		$.ajax({
			url: "<c:url value='/api/standardCategoryList?stdCtgLclsId="+stdLargeCategory+"&stdCtgMclsId="+stdMiddleCategory+"&stdCtgSclsId="+stdSmallCategory+"'/>",
			datatype: "json",
			success: function(data) {
				var resultArray = [];
				
				$("#stdDetailCategory").find("option").remove().end().append("<option value=''>세분류</option>");
				
				if(stdSmallCategory != ""){
					$.each(data, function(index, category) {
						$("#stdDetailCategory").selectpicker("refresh");		//Select Box Reset
						
						if($.inArray(category.stdCtgDclsId, resultArray) === -1) {
							resultArray.push(category.stdCtgDclsId);
							$("#stdDetailCategory").append("<option value='"+category.stdCtgDclsId+"'>"+category.stdCtgDclsNm+"</option>");
						}
					});
				}
				else {
					$.each(data, function(index, category) {
						$("#stdDetailCategory").selectpicker("refresh");		//Select Box Reset
					});
				}
			}
		});
	}
	
	//전용상품구분 특정점 선택 시 특정점 Select Box 호출
	function selectSpecificPoint() {
		var exclusProductDetail = $("#exclusProductDetail").val();
		
		//전용상품상세구분 특정점 선택 시
		if(exclusProductDetail == "20") {
			$("#selectSpecificPoint").show();	//특정점 Select Box 노출
		}
		else {
			$("#selectSpecificPoint").hide();
		}
	}
	
	//페이지 상단 이동
	function movePageTop() {
		$("#pageUp").click(function () {
			$("body").scrollTop(0);
		});
	}
	
	//Data Table Setting
	function settingTable() {
		$("#productlist").DataTable( {
			columns: [
				{ data: null, width: "2%", sortable: false },
				{ data: null, width: "12%" },
				{ data: null, width: "" },
				{ data: null, width: "5%" },
				{ data: null, width: "5%" }
			],
			columnsDefs: [
				{ sortable: false, targets: 0 }
			],
			order: [[ 1, "" ]]
		});
	}
	
	function onlyNumber(obj) {
		$(obj).keyup(function(){
	         $(this).val($(this).val().replace(/[^0-9]/g,""));
	    }); 
	} 
</script>
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
				<li class="active">상품 등록</li>
			</ul>
			<!-- End Bread Crumb -->
			
			<!-- Start Page Title -->
			<div class="page-title"><h2><span class="fa fa-pencil"></span> 상품 등록</h2></div>
			<!-- End Page Title -->
			
			<!-- Start Page Content Wrapper -->
			<div class="page-content-wrap">
				<div class="row">
					<div class="col-md-12">
						<form class="form-horizontal">
							<!-- Start Product Information -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">상품 정보</h3>
	                                <ul class="panel-controls">
	                                    <li><a href="" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
	                                    <!-- <li><a href="#" id="pageUp"><span class="fa fa-arrow-up"></span></a></li> -->
	                                </ul>                                
	                            </div>
								<div class="panel-body ">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">통합 표준분류 *</label>
												<div class="col-md-9">
													<select class="form-control select" name="stdGroupCode" id="stdGroupCode" onchange="selectStdLargeCategory(); selectStdMiddleCategory(); selectStdSmallCategory(); selectStdDetailCategory();">
														<option value="">그룹분류</option>
													</select>
													<select class="form-control select" name="stdLargeCategory" id="stdLargeCategory" onchange="selectStdMiddleCategory(); selectStdSmallCategory(); selectStdDetailCategory();">
														<option value="">대분류</option>
													</select>
													<select class="form-control select" name="stdMiddleCategory" id="stdMiddleCategory" onchange="selectStdSmallCategory(); selectStdDetailCategory();">
														<option value="">중분류</option>
													</select>
													<select class="form-control select" name="stdSmallCategory" id="stdSmallCategory" onchange="selectStdDetailCategory();">
														<option value="">소분류</option>
													</select>
													<select class="form-control select" name="stdDetailCategory" id="stdDetailCategory">
														<option value="">세분류</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">사이트 *</label>
												<div class="col-md-9 col-xs-12">
													<label class="check"><input type="checkbox" class="icheckbox" name="site" id="site" value="6001"/>이마트몰</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="checkbox" class="icheckbox" name="site" id="site" value="6004"/>신세계몰</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="checkbox" class="icheckbox" name="site" id="site" value="6300" disabled/>S.I.VILLAGE</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="checkbox" class="icheckbox" name="site" id="site" value="6200" disabled/>TV쇼핑몰</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="checkbox" class="icheckbox" name="site" id="site" value="6002" disabled/>트레이더스몰</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="checkbox" class="icheckbox" name="site" id="site" value="6003" disabled/>부츠몰</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">매입형태 *</label>
												<div class="col-md-9 col-xs-12">
													<select class="form-control select" name="buyType" id="buyType">
														<option value="60">위수탁</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">과세구분 *</label>
												<div class="col-md-9 col-xs-12">
													<label class="check"><input type="radio" class="icheckbox" name="taxClass" id="taxClass" value="10" checked="checked"/>과세</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="taxClass" id="taxClass" value="20"/>면세</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="taxClass" id="taxClass" value="30"/>영세</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">적용범위 *</label>
												<div class="col-md-3 col-xs-12">
													<input type="hidden" class="form-control" name="coverage" id="coverage" value=""/>
													<label>B2C</label>
													<select class="form-control select" name="b2cCoverage" id="b2cCoverage">
														<option value="10">적용</option>
														<option value="20">적용(대행제휴사제외)</option>
														<option value="70">미적용</option>
													</select>
												</div>
												<div class="col-md-3 col-xs-12">
													<label>B2E</label>
													<select class="form-control select" name="b2eCoverage" id="b2eCoverage">
														<option value="10">전체 적용</option>
														<option value="20">미적용</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">상품노출범위 *</label>
												<div class="col-md-9 col-xs-12">
													<label class="check"><input type="radio" class="icheckbox" name="exposureRange" id="exposureRange" value="10" checked="checked"/>전체 적용</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="exposureRange" id="exposureRange" value="30"/>모바일 전용</label>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">상품구분 *</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="characteristics" id="characteristics" value="10" checked="checked"/>일반</label>&nbsp;&nbsp;&nbsp;
													<!-- <label class="check"><input type="radio" class="icheckbox" name="" id="" value="20" disabled/>즉석조리</label> -->
													<label class="check"><input type="radio" class="icheckbox" name="characteristics" id="characteristics" value="40" disabled/>미가공귀금속</label>
													<label class="check"><input type="radio" class="icheckbox" name="characteristics" id="characteristics" value="50" disabled/>모바일기프트</label>
													<label class="check"><input type="radio" class="icheckbox" name="characteristics" id="characteristics" value="60" disabled/>상품권</label>
													<label class="check"><input type="radio" class="icheckbox" name="characteristics" id="characteristics" value="70" disabled/>쇼핑충전금</label>
													<!-- <label class="check"><input type="radio" class="icheckbox" name="" id="" value="C0" disabled/>쓱콘</label>
													<label class="check"><input type="radio" class="icheckbox" name="" id="" value="M0" disabled/>방문신청</label>
													<label class="check"><input type="radio" class="icheckbox" name="" id="" value="SW" disabled/>원물</label>
													<label class="check"><input type="radio" class="icheckbox" name="" id="" value="SG" disabled/>가공</label> -->
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">전용상품구분 *</label>
												<div class="col-md-3">
													<select class="form-control select" name="exclusProduct" id="exclusProduct">
														<option value="10">일반</option>
														<option value="20">명절 GIFT 일반</option>
													</select>
												</div>
												<div class="col-md-3">
													<select class="form-control select" name="exclusProductDetail" id="exclusProductDetail" onchange="selectSpecificPoint();">
														<option value="10">일반</option>
														<option value="20">특정점</option>
													</select>
												</div>
												<div class="col-md-3" id="selectSpecificPoint" style="display: none;">
													<select class="form-control select" name="speciificPoint" id="speciificPoint">
														<option value="">선택</option>
														<option value="2439">emart NE.O.001</option>
														<option value="2449">emart NE.O.002</option>
														<option value="2029">가든5점</option>
														<option value="2017">가양점</option>
														<option value="2110">감삼점</option>
														<option value="2142">강릉점</option>
														<option value="2073">검단점</option>
														<option value="2061">경기광주점</option>
														<option value="2107">경산점</option>
														<option value="2076">계양점</option>
														<option value="2071">고잔점</option>
														<option value="2020">공항점</option>
														<option value="2455">과천점</option>
														<option value="2453">광교점</option>
														<option value="2078">광명소하점</option>
														<option value="2134">광산점</option>
														<option value="2014">구로점</option>
														<option value="2103">구미점</option>
														<option value="2131">군산점</option>
														<option value="2119">금정점</option>
														<option value="2097">김천점</option>
														<option value="2443">김포한강점</option>
														<option value="2463">김해점</option>
														<option value="2127">남원점</option>
														<option value="2092">대전터미널점</option>
														<option value="2042">덕이점</option>
														<option value="2128">동광주점</option>
														<option value="2112">동구미점</option>
														<option value="2056">동백점</option>
														<option value="2069">동인천점</option>
														<option value="2089">동탄점</option>
														<option value="2144">동해점</option>
														<option value="2085">둔산점</option>
														<option value="2474">라이프컨테이너 SF고양점</option>
														<option value="2125">마산점</option>
														<option value="2030">마포공덕점</option>
														<option value="2099">만촌점</option>
														<option value="2477">메종티시아 SF고양점</option>
														<option value="2466">메종티시아SF하남점</option>
														<option value="2019">명일점</option>
														<option value="2026">목동점</option>
														<option value="2130">목포점</option>
														<option value="2480">몰리스 SF하남점</option>
														<option value="2118">문현점</option>
														<option value="2105">반야월점</option>
														<option value="2475">베이비서클 SF고양점</option>
														<option value="2465">베이비서클SF하남점</option>
														<option value="2059">보라점</option>
														<option value="2138">보령점</option>
														<option value="2137">봉선점</option>
														<option value="2066">부평점</option>
														<option value="2050">분당점</option>
														<option value="2166">비산점</option>
														<option value="2120">사상점</option>
														<option value="2126">사천점</option>
														<option value="2068">산본점</option>
														<option value="2132">상무점</option>
														<option value="2033">상봉점</option>
														<option value="2108">상주점</option>
														<option value="2151">서귀포점</option>
														<option value="2113">서부산점</option>
														<option value="2094">서산점</option>
														<option value="2086">서수원점</option>
														<option value="2063">성남점</option>
														<option value="2098">성서점</option>
														<option value="2034">성수점</option>
														<option value="2444">세종점</option>
														<option value="2143">속초점</option>
														<option value="2045">수색점</option>
														<option value="2018">수서점</option>
														<option value="2083">수원점</option>
														<option value="2051">수지점</option>
														<option value="2135">순천점</option>
														<option value="2109">시지점</option>
														<option value="2023">신도림점</option>
														<option value="2015">신월점</option>
														<option value="2150">신제주점</option>
														<option value="2088">아산점</option>
														<option value="2106">안동점</option>
														<option value="2164">안산점</option>
														<option value="2090">안성점</option>
														<option value="2122">양산점</option>
														<option value="2022">양재점</option>
														<option value="2052">양주점</option>
														<option value="2133">여수점</option>
														<option value="2024">여의도점</option>
														<option value="2147">여주점</option>
														<option value="2025">역삼점</option>
														<option value="2070">연수점</option>
														<option value="2116">연제점</option>
														<option value="2027">영등포점</option>
														<option value="2104">영천점</option>
														<option value="2087">오산점</option>
														<option value="2040">왕십리점</option>
														<option value="2021">용산점</option>
														<option value="2055">용인점</option>
														<option value="2121">울산점</option>
														<option value="2139">원주점</option>
														<option value="2037">월계점</option>
														<option value="2100">월배점</option>
														<option value="2165">월평점</option>
														<option value="2035">은평점</option>
														<option value="2065">의정부점</option>
														<option value="2044">이문점</option>
														<option value="2028">이수점</option>
														<option value="2140">이천점</option>
														<option value="2136">익산점</option>
														<option value="2072">인천공항점</option>
														<option value="2032">일산점</option>
														<option value="2038">자양점</option>
														<option value="2129">전주점</option>
														<option value="2149">제주점</option>
														<option value="2148">제천점</option>
														<option value="2053">죽전점</option>
														<option value="2075">중동점</option>
														<option value="2064">진접점</option>
														<option value="2115">진주점</option>
														<option value="2117">창원점</option>
														<option value="2096">천안서북점</option>
														<option value="2082">천안점</option>
														<option value="2091">천안터미널점</option>
														<option value="2016">천호점</option>
														<option value="2039">청계천점</option>
														<option value="2081">청주점</option>
														<option value="2145">춘천점</option>
														<option value="2141">충주점</option>
														<option value="2102">칠성점</option>
														<option value="2446">킨텍스점</option>
														<option value="2146">태백점</option>
														<option value="2476">토이킹덤 SF고양점</option>
														<option value="2467">토이킹덤SF하남점</option>
														<option value="2123">통영점</option>
														<option value="2047">파주운정점</option>
														<option value="2036">파주점</option>
														<option value="2382">페리스명동</option>
														<option value="2093">펜타포트점</option>
														<option value="2077">평촌점</option>
														<option value="2084">평택점</option>
														<option value="2062">포천점</option>
														<option value="2111">포항이동점</option>
														<option value="2101">포항점</option>
														<option value="2440">풍산점</option>
														<option value="2058">하남점</option>
														<option value="2468">하우디몰</option>
														<option value="2048">하월곡점</option>
														<option value="2124">학성점</option>
														<option value="2114">해운대점</option>
														<option value="2043">화정점</option>
														<option value="2060">흥덕점</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">상품명 *</label>
												<div class="col-md-9">
													<div class="input-group">
														<span class="input-group-addon"><span class="fa fa-pencil"></span></span>
														<input type="text" class="form-control" name="productName" id="productName" value=""/>
	                                                </div>    
	                                                <span class="help-block">상품명은 한글 250자 이내로 등록</span>   
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">브랜드 *</label>
												<div class="col-md-9">
													<div class="input-group">
														<span class="input-group-addon"><span class="fa fa-pencil"></span></span>
														<input type="text" class="form-control" name="searchItemId" id="searchItemId" value=""/>
	                                                </div>       
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">모델명</label>
												<div class="col-md-9">
													<div class="input-group">
														<span class="input-group-addon"><span class="fa fa-pencil"></span></span>
														<input type="text" class="form-control" name="searchItemId" id="searchItemId" value=""/>
	                                                </div>       
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">판매상태 *</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="sellStatus" id="sellStatus" value="05" checked="checked" disabled/>정보추가필요</label>
													<span class="help-block">※상품 신규 등록 시에는 정보 추가 필요로 생성됩니다. 매가, 상품 상세설명, 이미지까지 모두 입력한 후에 판매상태를 변경 할 수 있습니다.</span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">상품등록일</label>
												<div class="col-md-9">
													<p class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">상품고시 *</label>
												<div class="col-md-9" style="padding-bottom: 10px;">
													<select class="form-control select" name="itemMgmtCategory" id="itemMgmtCategory" onchange="selectSpecificPoint();">
														<option value="0000000038">모바일 쿠폰</option>
													</select>
												</div>
												<label class="col-md-3 control-label"></label>
												<div class="col-md-9">
													<table style="width: 100%;">
														<colgroup>
															<col width="30%">
															<col width="70%">
														</colgroup>
														<tbody>
															<tr>
																<td>
																	<p class="form-control-static">발행자</p>
																	<input type="hidden" name="itemMngPropId" id="itemMngPropId" value="0000000172">
																	<input type="hidden" name="itemMngPropId" id="itemMngPropId" value="0000000173">
																	<input type="hidden" name="itemMngPropId" id="itemMngPropId" value="0000000174">
																</td>
																<td><input type="text" class="form-control" name="" id="" value=""/></td>
															</tr>
															<tr>
																<td><p class="form-control-static">유효기간, 이용조건(유효기간 경과시 보상기준 포함)</p></td>
																<td><input type="text" class="form-control" name="" id="" value=""/></td>
															</tr>
															<tr>
																<td><p class="form-control-static">이용 가능 매장</p></td>
																<td><input type="text" class="form-control" name="" id="" value=""/></td>
															</tr>
															<tr>
																<td><p class="form-control-static">환불 조건</p></td>
																<td><input type="text" class="form-control" name="" id="" value=""/></td>
															</tr>
															<tr>
																<td><p class="form-control-static">환불 방법</p></td>
																<td><input type="text" class="form-control" name="" id="" value=""/></td>
															</tr>
															<tr>
																<td><p class="form-control-static">소비자 상담 관련 전화번호</p></td>
																<td><input type="text" class="form-control" name="" id="" value=""/></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Product Information -->
							
							<!-- Start Exhibition & Marketing Information -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">전시 및 마케팅 정보</h3>
	                                <ul class="panel-controls">
	                                    <li><a href="" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
	                                </ul>                                
	                            </div>
								<div class="panel-body ">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">메인매장 *</label>
												<div class="col-md-9">
													<span class="help-block">※전시카테고리는 사이트별 3개까지 선택할 수 있으며, SSG.COM몰 전시카테고리는 적어도 1개이상 등록되어야 합니다.</span>
													<div class="table-responsive">
														<table id="productlist" class="table table-striped table-condensed datatable" style="width:100%">
															<thead>
																<tr>
																	<th class="sorting_disabled"></th>
																	<th>사이트</th>
																	<th>전시카테고리</th>
																	<th>전시여부</th>
																	<th>우선순위</th>
																</tr>
															</thead>
															<tbody>
															</tbody>
														</table> 
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">전시기간 *</label>
												<div class="col-md-9">
													<table style="width: 100%;">
														<colgroup>
															<col width="29%">
															<col width="20%">
															<col width="2%">
															<col width="29%">
															<col width="20%">
														</colgroup>
														<tbody>
															<tr>
																<td style="padding-right: 2.5px;">
																	<div class="input-group">
																		<input type="text" name="" id="" class="form-control datepicker" value=""/>
																		<span class="input-group-addon"><span class="fa fa-calendar"></span></span>
																	</div>
																</td>
																<td style="padding-left: 2.5px;"><input type="text" class="form-control timepicker" name="time" id="time" value=""/></td>
																<td></td>
																<td style="padding-right: 2.5px;">
																	<div class="input-group">
																		<input type="text" name="" id="" class="form-control datepicker" value=""/>
																		<span class="input-group-addon"><span class="fa fa-calendar"></span></span>
																	</div>
																</td>
																<td style="padding-left: 2.5px;"><input type="text" class="form-control timepicker" name="time" id="time" value=""/></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">전문매장</label>
												<div class="col-md-9">
													
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">검색가능여부 *</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">검색어</label>
												<div class="col-md-9">
													<input type="text" class="form-control" name="" id="" value=""/>
													<span class="help-block">※검색어는 콤마(,)로 구분하며, 등록 가능개수는 10개, 전체 총 300byte까지 등록가능합니다.<br/>(상품명, 브랜드, 모델명은 검색 대상이므로, 중복되지 않는 검색어를 입력해주세요.)</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Exhibition & Marketing Information -->
							
							<!-- Start Product Category Setting -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">상품구분 설정</h3>
	                                <ul class="panel-controls">
	                                    <li><a href="" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
	                                </ul>                                
	                            </div>
								<div class="panel-body ">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">1일 주문가능수량 *</label>
												<div class="col-md-9">
													<input type="text" name="" id="" class="form-control" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">1회 주문가능수량 *</label>
												<div class="col-md-9">
													<input type="text" name="" id="" class="form-control" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">19금 상품구분 *</label>
												<div class="col-md-9">
													<select class="form-control select" name="speciificPoint" id="speciificPoint">
														<option value="">선택</option>
														<option value="">일반상품</option>
														<option value="">성인상품</option>
														<option value="">주류상품</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">고위험상품 여부</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">ONLY SSG상품 여부</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>SSG 전용</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>일반</label>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">신상품 적용</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>대상</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>비대상</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">병행수입상품 여부</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">상품 판매방식</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>일반</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>렌탈</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y"/>사전예약</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>할부</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">새상품 여부</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>새상품</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>중고</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>리퍼</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>전시</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>반품</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>스크래치</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Product Category Setting -->
							
							<!-- Start Product Option Information -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">상품옵션 정보</h3>
	                                <ul class="panel-controls">
	                                    <li><a href="" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
	                                </ul>                                
	                            </div>
								<div class="panel-body ">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">상품판매유형 *</label>
												<div class="col-md-3">
													<select class="form-control select" name="speciificPoint" id="speciificPoint">
														<option value="">일반</option>
														<option value="">옵션</option>
													</select>
												</div>
												<div class="col-md-3">
													<select class="form-control select" name="speciificPoint" id="speciificPoint">
														<option value="">일반</option>
													</select>
												</div>
												<div class="col-md-3">
													<select class="form-control select" name="speciificPoint" id="speciificPoint">
														<option value="">일반</option>
														<option value="">점포옵션</option>
														<option value="">기획팩</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">협력업체 상품ID</label>
												<div class="col-md-9">
													<input type="text" name="" id="" class="form-control" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">하남픽업 여부</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">슈퍼샵 RFID 운영 여부</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">주문자옵션</label>
												<div class="col-md-9">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">선물포장유형</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>없음</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y"/>선물포장</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y"/>쇼핑백</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>선물포장+쇼핑백</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">선물가능여부</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">입고알림여부</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Product Option Information -->
							
							<!-- Start Product Price & Stock Information -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">상품가격 및 재고정보</h3>
	                                <ul class="panel-controls">
	                                    <li><a href="" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
	                                </ul>                                
	                            </div>
								<div class="panel-body ">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">재고관리대상 *</label>
												<div class="col-md-6">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">프런트수량표시</label>
												<div class="col-md-9">
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="Y" checked="checked"/>Yes</label>&nbsp;&nbsp;&nbsp;
													<label class="check"><input type="radio" class="icheckbox" name="yn" id="yn" value="N"/>No</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Product Price & Stock Information -->
						</form>
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
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#productlist_length").hide();
		$("#productlist_filter").hide();
		$("#productlist_info").hide();
		$("#productlist_paginate").hide();
	});
	</script>
</body>
</html>
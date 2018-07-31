<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="/WEB-INF/jsp/common/ui/resources_ui.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		settingTable();
		settingDate();
		
		$("#btnSearch").click(function() {
			searchProductList();
		});
	}); 
	
	//Data Table Setting
	function settingTable() {
		$("#productlist").DataTable( {
			columns: [
				{ data: null, width: "3%", sortable: false },
				{ data: null, width: "12%" },
				{ data: null, width: "" },
				{ data: null, width: "10%" },
				{ data: null, width: "8%" },
				{ data: null, width: "8%" },
				{ data: null, width: "12%" }
			],
			columnsDefs: [
				{ sortable: false, targets: 0 }
			],
			order: [[ 1, "" ]]
		});
	}
	
	//상품정보 목록 조회
	function searchProductList() {
		var table = $("#productlist").DataTable();	//Data Table Setting
		
		var regDtsStart = $("#searchStartDate").val().replace(/\-/g, "");	//상품등록일 조회 시작일
		var regDtsEnd = $("#searchEndDate").val().replace(/\-/g, "");	//상품등록일 조회 종료일
		var sellStatCd = $("#searchSellStatus").val();	//판매상태
		var itemId = $("#searchItemId").val();	//상품ID
		var itemNm = $("#searchItemName").val();	//상품명

		table.destroy();	//datatable 초기화
		//$('#product').empty();
		
		table = $("#productlist").DataTable( {
			ajax: {
				url: "<c:url value='/api/selectSsgProductList?regDtsStart="+regDtsStart+"&regDtsEnd="+regDtsEnd+"&sellStatCd="+sellStatCd+"&itemId="+itemId+"&itemNm="+itemNm+"'/>",
				dataSrc:  ""
			},
			autoWidth: true,
			columns: [
				{ data: null, width: "3%", sortable: false },
				{ data: "itemId", width: "12%", 
				  render:  function(data) {
					return "<a href='<c:url value='/'/>'>"+data+"	<i class='fa fa-external-link'></i></a>";
				} },
				{ data: "itemNm", width: "" },
				{ data: "sellStatCd", width: "10%",
				  render: function(data, type, row) {
					  if(data == "05") {
						  return "정보추가필요";
					  } else if(data == "10") {
						  return "승인전";
					  } else if(data == "20") {
						  return "판매중";
					  } else if(data == "80") {
						  return "일시판매중지";
					  } else if(data == "90") {
						  return "영구판매중지";
					  } else if(data == "11") {
						  return "승인전(반려)";
					  }
					  return data;
				  } },
				{ data: "itemSellTypeCd", width: "8%", 
				  render: function(data, type, row) {
					  if(data == "10") {
						  return "일반";
					  } else if(data == "20") {
						  return "옵션";
					  }
					  return data;
				  } },
				{ data: "itemSellTypeDtlCd", width: "8%",
				  render: function(data, type, row) {
					  if(data == "10") {
						  return "일반";
					  } else if(data == "20") {
						  return "점포옵션";
					  } else if(data == "30") {
						  return "기획팩";
					  }
					  return data;
				  } },
				{ data: "siteNm", width: "12%" }
			],
			columnsDefs: [
				{ sortable: false, targets: 0 }
			],
			order: [[ 1, "" ]]
		});
		//Index Column
		table.on("order.dt search.dt", function() {
        	table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        		cell.innerHTML = i+1;
        	});
        }).draw();
	}
	
	//Date Setting
	function settingDate() {
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var date = now.getDate();
		
		if(month < 10) {
			month = "0" + month.toString();
		}
		
		if(date < 10) {
			date = "0" + date.toString();
		}
		
		var today = year + "-" + month + "-" + date;
		
		$("#searchStartDate").val(today);
		$("#searchEndDate").val(today);
	}
	
	//Start Date & End Date Check
	function checkDate() {
		var startDate = $("#searchStartDate").val().replace(/\-/g, "");
		var endDate = $("#searchEndDate").val().replace(/\-/g, "");
		
		var checkDate = endDate - startDate;
		
		if(checkDate < 0) {
			alert("조회 시작일이 조회 종료일보다 클 수 없습니다.\n다시 확인 바랍니다.");
			settingDate();
			return;
		}
	}
	
	//검색 조건 실행
	/* $("#btnSearch").click(function() {
		$.ajax({
			url : "<c:url value="/api/selectSsgProductList"/>",
			datatype : "json",
			success : function(data) {	
				alert("ddd");
				$.each(data, function(index, item) {
					var index = index + 1;	//No.
					$("#productList > tbody").append($('<tr>')
							.append($('<td>').append(index))
							.append($('<td>').append(item.itemId))
							.append($('<td>').append(item.itemSellTypeCd))
							.append($('<td>').append(item.sellStatCd))
							.append($('<td>').append(item.itemSellTypeCd))
							.append($('<td>').append(item.itemSellTypeDtlCd))
							.append($('<td>').append(item.itemNm))
							.append($('<td>').append(item.siteNm))
							);
				});
			}
		});
	}); */						
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
				<li class="active">상품정보 관리</li>
			</ul>
			<!-- End Bread Crumb -->
			
			<!-- Start Page Title -->
			<div class="page-title"><h2><span class="fa fa-list"></span> 상품정보 관리</h2></div>
			<!-- End Page Title -->
			
			<!-- Start Page Content Wrapper -->
			<div class="page-content-wrap">
				<div class="row">
					<div class="col-md-12">
						<!-- Start Search Field -->
						<form class="form-horizontal">
							<div class="panel panel-default">
								<div class="panel-heading">
                                    <h3 class="panel-title">검색 조건</h3>
                                    <ul class="panel-controls">
                                        <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
                                    </ul>                                
                                </div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">상품등록일</label>
												<div class="col-md-4">
													<div class="input-group input-group-sm">
														<input type="text" name="searchStartDate" id="searchStartDate" class="form-control datepicker" onchange="checkDate();" value=""/>
														<span class="input-group-addon"><span class="fa fa-calendar"></span></span>
													</div>
													<span class="help-block"></span>
												</div>
												<div class="col-md-4">
													<div class="input-group input-group-sm">
														<input type="text" name="searchEndDate" id="searchEndDate" class="form-control datepicker" onchange="checkDate();" value=""/>
														<span class="input-group-addon"><span class="fa fa-calendar"></span></span>
													</div>
													<span class="help-block"></span>
												</div>
											</div>
											<div class="form-group">                                        
                                                <label class="col-md-3 control-label">상품 ID</label>
                                                <div class="col-md-8">
                                                    <div class="input-group input-group-sm">
                                                        <input type="text" name="searchItemId" id="searchItemId" class="form-control" value=""/>
                                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    </div>            
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-3 control-label">판매상태</label>
												<div class="col-md-8">
													<select class="form-control select" name="searchSellStatus" id="searchSellStatus">
														<option value="">전체</option>
                                                        <option value="05">정보추가필요</option>
                                                        <option value="10">승인전</option>
                                                        <option value="20">팬매중</option>
                                                        <option value="80">일시판매중지</option>
                                                        <option value="90">영구판매중지</option>
                                                        <option value="11">승인전(반려)</option>
                                                    </select>
													<span class="help-block"></span>
												</div>
											</div>
											<div class="form-group">                                        
                                                <label class="col-md-3 control-label">상품명</label>
                                                <div class="col-md-8">
                                                    <div class="input-group input-group-sm">
                                                        <input type="text" name="searchItemName" id="searchItemName" class="form-control" value=""/>
                                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    </div>            
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
										</div>
									</div>
								</div>
								<div class="panel-footer">
									<button type ="button" class="btn btn-primary btn-sm pull-right active" id="btnSearch"><i class="fa fa-search"></i>조회</button>
								</div>
							</div>
						</form>
						<!-- End Search Field -->
						
						<!-- Start Data Table -->
						<div class="panel panel-default">
							<div class="panel-heading">
                                <h3 class="panel-title">상품 목록</h3>                              
                            </div>
							<div class="panel-body">
								<div class="table-responsive">
									<table id="productlist" class="table table-striped table-actions datatable table-hover table-condensed" style="width:100%">
										<thead>
											<tr>
												<th class="sorting_disabled">No.</th>
												<th>상품 ID</th>
												<th>상품명</th>
												<th>판매상태</th>
												<th>상품판매유형</th>
												<th>상품판매유형상세</th>
												<th>사이트명</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table> 
								</div>
							</div>
						</div>
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
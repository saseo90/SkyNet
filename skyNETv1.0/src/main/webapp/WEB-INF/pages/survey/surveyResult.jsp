<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content-wrapper">
	<section class="content-header">
		<h1>&nbsp;</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Survey</a></li>
			<li class="active">Detail</li>
		</ol>
	</section>
	<section class="invoice">
		<div class="row">
			<div class="col-xs-12">
				<h2 class="page-header">
					${ survey.survey_title } <small class="pull-right">
						${survey.survey_start}</small>
				</h2>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="col-xs-12" style="min-height: 50px;">${ survey.survey_content }</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<c:if test="${ not empty chkList }"></c:if>
						<table>
							<c:forEach items="${ chkList }" var="chk">
								<c:if test="${ tt.index eq 0 }">
								<thead>
									<tr>
										<th colspan="3">${ chk.surveychk_qcontent }</td>
									</tr>
								</thead>
								</c:if>
								<tbody>
									<tr>
										<td>${ chk.surveychk_anum }</td>
										<td>${ chk.surveychk_acontent }</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="col-xs-12">
						<c:if test="${ not empty admin}">
							<input type="button" class="btn btn-primary" value="설문 삭제하기"
								name="deleteBtn" id="deleteBtn">
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ----------------------------------------------------------------------------------------------- -->
	<section class="content">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">설문 결과</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button type="button" class="btn btn-box-tool" data-widget="remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
				<div class="box-body chart-responsive">
					<div class="chart" id="sales-chart"
						style="height: 300px; position: relative;"></div>
				</div>
			</div>
		</div>
	</section>
</div>
<script>
	$(function() {	//설문결과 차트로 보여주기
		
		var result = new Array();
		
		// JSON 객체 생성 -> result 배열로~ 
		<c:forEach items="${chkList}" var="chk">	
			var json = new Object();
			json.label = "선택지 ${chk.surveychk_anum}번";
			json.value = "${chk.surveychk_count}";
			
			result.push(json);
		</c:forEach>
		// result : [ {label : 1 , value = 1}, {label : 2 , value = 2} {...} ]

		// 도넛 차트
		var donut = new Morris.Donut({
			element : 'sales-chart',
			resize : true,
			colors : [ "#3c8dbc", "#f56954", "#00a65a" ],
			data : result,
			hideHover : 'auto'
		});
		
	});
</script>
<style>
table tr th {padding: 10px;}
table tr td {padding: 10px;}
</style>
</body>
</html>
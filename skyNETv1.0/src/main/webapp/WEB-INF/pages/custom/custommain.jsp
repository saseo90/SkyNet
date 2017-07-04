<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.placeholder {
	border: 1px solid green;
	background-color: white;
	-webkit-box-shadow: 0px 0px 10px #888;
	-moz-box-shadow: 0px 0px 10px #888;
	box-shadow: 0px 0px 10px #888;
}

.tile {
	height: 100px;
}

.grid {
	margin-top: 1em;
}
</style>
<script>
	$(function() {
		$(".sortables").sortable({
			tolerance : 'pointer',
			items : "div",
			revert : 'invalid',
			connectWith : ".sortables",
			placeholder : 'span2 well placeholder tile',
			forceHelperSize : true
		});
	});
	function checkdiv() {
		var non = new Array();
		var left = new Array();
		var right = new Array();
			$("#none div").each(function() {
				non[$(this).index() - 1] = $(this).html();
			});
			$("#left div").each(function() {
				left[$(this).index() - 1] = $(this).html();
			});
			$("#right div").each(function() {
				right[$(this).index() - 1] = $(this).html();
			});
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/custom/main/insert',
				data : {
					"non" : non,
					"left" : left,
					"right" : right
				},
				dataType : 'json',
				success : function(data) {
					if (state = "success") {

					} else {
						alert("일정을 가지고 오는데 실패하였습니다")
					}

				},
				error : function(e) {
					alert(e.responseText);
				}
			});

	}
</script>

	

<div class="content-wrapper" style="min-height: 948px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			커스터마이징 <small>메인</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Custom</a></li>
			<li class="active">Main</li>
		</ol>
	</section>

	<!-- Main content -->

		<!-- /.box-header -->
		<div class="box-body">
			<div class="row grid span8">
		<div class="col-md-12">
			<div id="none" class="col-md-4 sortables">
				<button type="button" class="btn btn-block btn-primary">미등록</button>
				<c:forEach items="${list.non}" var="vo">
					<div class="well span2 tile">${vo.customId}</div>

				</c:forEach>
			</div>
			<div id="left" class="col-md-4 sortables">
				<button type="button" class="btn btn-block btn-primary">좌</button>

				<c:forEach items="${list.left}" var="vo">
					<div class="well span2 tile">${vo.customId}</div>
				</c:forEach>
			</div>
			<div id="right" class="col-md-4 sortables">
				<button type="button" class="btn btn-block btn-primary">우</button>
				<c:forEach items="${list.right}" var="vo">
					<div class="well span2 tile">${vo.customId}</div>

				</c:forEach>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<input type="button" class="btn btn-block btn-primary" value="변경사항저장" onclick="checkdiv()">
	</div>
		</div>
		<!-- /.box-body -->
	</div>


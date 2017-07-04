<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function(){
	// paging
	$('#example2').DataTable({
	      "paging": true,
	      "lengthChange": false,
	      "searching": false,
	      "ordering": false,
	      "info": false,
	      "autoWidth": true
	});
	
	// 상세보기 페이지로 이동
	$("#example2").on("click", ".surveyTr", function(){
		var survey_num = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/survey/detail/"+survey_num;
	});
	
	// 글쓰기 페이지로 이동 ( 관리자만 가능 )
	$('#writeBtn').click(function(){
		location.href="${pageContext.request.contextPath}/survey/insert";
	});
})
</script>
<div class="content-wrapper" style="min-height: 901px;">
	<section class="content-header">
		<h1>&nbsp;</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Survey</a></li>
			<li class="active">Survey List</li>
		</ol>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Survey List</h3>
					</div>
					<div class="box-body">
						<table id="example2" class="table table-bordered">
						<thead>
							<tr>
								<th>#</th>
								<th>Title</th>
								<th>State</th>
								<th>마감일</th>
								<th>Count</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ surveyList }" var="list" varStatus="vv">
								<tr class="surveyTr" id="${ list.survey_num }">
									<td>${ fn:length(surveyList) - vv.index }</td>
									<td>${ list.survey_title }</td>
									<td>${ list.survey_state }</td>
									<td>${ list.survey_end }</td>
									<td>${ list.survey_count }</td>
								</tr>
							</c:forEach>
						</tbody>
						</table>
					</div>
					<div class="box-footer">
						<c:if test="${ not empty admin }"> <!-- 관리자만 글쓰기버튼 보임 -->
							<input type="button" name="writeBtn" id="writeBtn"
								class="btn btn-warning pull-left" value="Write" />
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>
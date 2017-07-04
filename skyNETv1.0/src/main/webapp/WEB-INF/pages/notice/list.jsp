<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function(){
	// paging
    $("#example1").DataTable();
	$('#example2').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": false,
	      "info": true,
	      "autoWidth": false
	});
	
	// 상세보기 페이지로 이동
	$("#example2").on("click", ".noticeTR", function(){
		var notice_num = $(this).attr("id");
		location.href="${pageContext.request.contextPath}/notice/detail/"+notice_num;
	});
	
	// 글쓰기 페이지로 이동
	$("#writeBtn").click(function(){
		location.href="${pageContext.request.contextPath}/notice/insert";
	});
	
});
</script>
<div class="content-wrapper" style="min-height: 901px;">
	<section class="content-header">
		<h1>&nbsp;</h1>
		<ol class="breadcrumb">
	        <li><a href="${ pageContext.request.contextPath }/sky"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li class="active">공지사항</li>
      </ol>
    </section>
    <section class="content">
		<div class="row">
		<div class="col-xs-12">
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title"><b>공지사항</b></h3>
			</div>
			<div class="box-body">
				<table id="example2" class="table table-bordered table-hover" >
					<thead>
						<tr><td class="col-sm-1">번호</td><td>제목</td><td class="col-sm-2">작성일</td><td class="col-sm-2">조회수</td></tr>
					</thead>
					<tbody>
					<c:forEach items="${ list }" var="vo" varStatus="vv">
						<tr>
							<td>${ fn:length(list) - vv.index }</td>
							<td class="noticeTR" id="${ vo.notice_num }">[${vo.notice_type}] ${ vo.notice_title }</td>
							<td>${ vo.notice_date }</td>
							<td>${ vo.notice_readcnt }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="box-footer">
				<c:if test="${ not empty admin }">	<!-- 관리자만 글쓰기 버튼 보임 -->
	            	<input type="button" name="writeBtn" id="writeBtn" class="btn btn-warning pull-left" value="Write"/>
		        </c:if>			
			</div>
		</div>
		</div>
		</div>		
</section>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#updateBtn").click(function(){	// 수정하기 버튼 클릭
		var notice_num = ${ notice.notice_num };
		location.href="${pageContext.request.contextPath}/notice/update/"+notice_num;
	});
	
	$("#deleteBtn").click(function(){	// 삭제하기 버튼 클릭
		var notice_num = ${ notice.notice_num };
		location.href="${pageContext.request.contextPath}/notice/delete/"+notice_num;		
	});
});
</script>
<div class="content-wrapper" style="min-height:901px;">
	<section class="content-header">
		<h1>&nbsp;</h1>
		<ol class="breadcrumb">
        <li><a href="${ pageContext.request.contextPath }/sky"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${ pageContext.request.contextPath }/notice/list">공지사항</a></li>
        <li class="active">상세보기</li>
      	</ol>
	</section>
	<section class="invoice">
		<div class="row">
			<div class="col-xs-12">
				<h2 class="page-header">
					[${ notice.notice_type }] ${ notice.notice_title } <small class="pull-right">${ notice.notice_date }</small>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="col-xs-12" style="min-height: 500px;">${ notice.notice_content }</div>
			</div>
		</div>
		<c:if test="${ not empty admin }">	<!-- 관리자만 수정, 삭제 버튼이 보임 -->
		<div class="row">
			<div class="col-xs-12">
				<input type="button" class="btn btn-primary" name="updateBtn" id="updateBtn" value="수정" >
				<input type="button" class="btn btn-primary" name="deleteBtn" id="deleteBtn" value="삭제" >
			</div>
		</div>
		</c:if>
	</section>
</div>
</body>
</html>
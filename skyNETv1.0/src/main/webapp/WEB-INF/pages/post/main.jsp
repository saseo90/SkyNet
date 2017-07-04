<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function check(){
	var dateTest=/^(19[7-9][0-9]|20\d{2})\/(0[0-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])$/;
	var cont = document.getElementById("cont").value;
	var date = document.getElementById("date").value;
	if(!dateTest.test(date)){
		alert("날짜를 정확히 입력하세요");
		return false;
	}else if(cont==""){
		alert("내용을 입력하세요");
		return false;
	}else{
		return true;;
	}
 	
	}
	$(function() {
		$("#datemask").inputmask("yyyy/mm/dd", {
			"placeholder" : "yyyy/mm/dd"
		});
		$("[data-mask]").inputmask();
		$('#datepicker').datepicker();
		$('#example2').DataTable({
			"paging" : true,
			"lengthChange" : true,
			"searching" : true,
			"ordering" : false,
			"info" : true,
			"autoWidth" : false
		});

	});
	function reg_post() {
		$('#myModal3').modal()

	}
	
</script>
<style>
</style>
<div class="content-wrapper">
	<section class="content-header">
		<h1>메모</h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<form action="${pageContext.request.contextPath}/post/delete"
						method="post">
						<div class="box-header" align="right">
							<div class="btn-group">
								<button type="button" class="btn btn-info" onclick="reg_post()">등록</button>
								<input type="submit" class="btn btn-info" value="삭제">
							</div>
						</div>

						<div class="box-body">
							<table id="example2" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th class="CHECK"></th>
										<th class="postReg_Cont">내용</th>
										<th class="postReg_date">등록일</th>
										<th class="postDel_Cont">삭제일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${postList}" varStatus="status">
										<tr class="memberTR">
											<td><input type="checkbox" name="delete"
												value="${vo.postNo}"></td>
											<td>${vo.postCont}</td>
											<td><fmt:formatDate value="${vo.post_date}" type="date"
													pattern="yyyy년MM월dd일" /></td>
											<td><fmt:formatDate value="${vo.post_delteDate}"
													type="date" pattern="yyyy년MM월dd일" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					</form>
				</div>
			</div>
		</div>
</div>
</section>
</div>
<div class="example-modal">
	<div class="modal" id="myModal3" role="dialog">
		<div class="modal-dialog">
			<form action="" method="post" onsubmit="return check()">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" onclick="disable()">
							<span aria-hidden="true" onclick="disable()">&times;</span>
						</button>
						<h4 class="modal-title" id="modal3Title">메모등록</h4>
					</div>
					<div class="modal-body"
						style="min-height: 300px; max-height: 763px;">
						<div class="form-group">
							<label>내용</label> <input type="text" name="postCont" id="cont"
								class="form-control" placeholder="내용을 입력하세요">
						</div>
						<div class="form-group">
							<label>삭제일 등록:</label>

							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" name="post_delteDate" id="date"
									class="form-control" data-inputmask="'alias': 'yyyy/mm/dd'"
									data-mask="">
							</div>
							<!-- /.input group -->
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="등록"> <input
							type="reset" class="btn btn-primary" value="초기화">
						<button type="button" style="width: 25%" class="btn btn-secondary"
							data-dismiss="modal" onclick="disable()">닫기</button>

					</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
</div>
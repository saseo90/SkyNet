<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		/* 투표한 설문지를 상세보기 눌렀을때 알림창 + 라디오버튼, 전송버튼 비활성화 */
		var member = "${voteMember}";
		if (member == 'vote') {
			alert("응답한 설문입니다.")
			$("input[type=radio]").attr('disabled', true);
		}
		
		/* 관리자가 로그인 시 라디오버튼 비활성화 */
		var admin = "${admin}";
		if(admin == 'admin') {
			$("input[type=radio]").attr('disabled', true);
		}

		var survey_gnum = $("#survey_gnum").val();
		
		/* 투표하기 */
		$("#submitBtn").click(function() {
			var selectChk = $("input[name=selectChk]:checked").val(); // 선택된 항목 가져오기
			location.href = "${pageContext.request.contextPath}/survey/insert/"
					+ selectChk + "/" + survey_gnum;
		});
		
		/* 설문 상태 완료시키기 : 관리자만 가능 */
		$("#updateBtn").click(function(){
			location.href = "${pageContext.request.contextPath}/survey/update/"+survey_gnum;
		})
		
		/* 설문 상태 삭제 : 관리자만 가능*/
		$("#deleteBtn").click(function(){
			location.href = "${pageContext.request.contextPath}/survey/delete/"+survey_gnum;
		});
	})
</script>
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
					${ survey.survey_title } <small class="pull-right">	<!-- 설문조사 제목 -->
						${survey.survey_start} ~ ${survey.survey_end} </small>	<!-- 작성일 ~ 마감일 -->
				</h2>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="col-xs-12" style="min-height: 50px;">${ survey.survey_content }</div> <!-- 설문설명 내용 -->
				</div>
			</div>
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table>
							<c:forEach items="${ chkList }" var="chk" varStatus="tt">	
								<c:if test="${ tt.index eq 0 }">	<!-- 질문지는 한번만 나오게 -->
								<thead>
									<tr>
										<th colspan="3">${ chk.surveychk_qcontent }</th>	<!-- 질문지 -->
									</tr>
								</thead>
								</c:if>
								<tbody>
									<tr>	<!-- 선택지 리스트 -->
										<td><input type="hidden" name="survey_gnum"
											id="survey_gnum" value="${ chk.surveychk_gnum }"></td>
										<td><input type="radio" name="selectChk" class="flat-red"
											id="${ chk.surveychk_anum }" value="${ chk.surveychk_anum }">
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
						<c:if test="${ empty admin }">
							<c:if test="${voteMember!='vote'}"> <!-- 투표한 사원은 버튼 안보임! -->
								<input type="button" class="btn btn-primary" value="Submit"
									name="submitBtn" id="submitBtn">
							</c:if>
						</c:if>
						<c:if test="${ not empty admin}">	<!-- 관리자만 버튼 보임! -->
							<input type="button" class="btn btn-primary" value="설문 완료하기"
								name="updateBtn" id="updateBtn">
							<input type="button" class="btn btn-primary" value="설문 삭제하기"
								name="deleteBtn" id="deleteBtn">
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<style>
table tr th {padding: 10px;}
table tr td {padding: 10px;}
</style>
</body>
</html>
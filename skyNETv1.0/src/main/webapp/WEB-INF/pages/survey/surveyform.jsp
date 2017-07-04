<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		// 마감일 설정 DataPicker
		$('#datepicker').datepicker({
			autoclose : true,
			format : 'yyyymmdd',
			minDate : 0
		});
		
		$("#append").click(function() {	// 항목추가 버튼 클릭
			var htmlCode = "<div class='form-group'>"
					+ "<label for='chkList' class='col-sm-2 control-label'>Option</label>"
					+ "<div class='col-sm-10'>"
					+ "<input type='text' class='form-control chkList' name='chkList' placeholder='Option : '>"
					+ "</div></div>";

			$(".box-body").append(htmlCode);
		});
		
		$("input, textarea").keyup(function(){	// 스크립트 막기
			var value = $(this).val();
			var arr_char = new Array();
			
			arr_char.push("<");
			
			for(var i=0; i<arr_char.length; i++) {
				if(value.indexOf(arr_char[i]) != -1) {
					window.alert("'<' 특수문자는 사용할 수 없습니다.");
					value = value.substr(0, value.indexOf(arr_char[i]));
					$(this).val(value);
				}
			}
		});

	})
	
	function chkchk(){	// 유효성 처리
		
		var flag = true;
		
		var chkTitle = /^[A-Za-z0-9가-힣\s]{3,10}$/;
		var survey_title = $("#survey_title").val();
		if(chkTitle.test(survey_title)==false ||survey_title=="") {
			alert("제목을 입력하세요 ! (3~10자)")
			return false;
		}
		
		var survey_content = $("#survey_content").val();
		if(survey_content==""){
			alert("내용을 입력하세요 ! (10~100자)")
			return false;
		}
	
		var chkQuestion = /^[A-Za-z0-9가-힣\s]{3,30}$/;
		var Question = $("#Question").val();
		if(chkQuestion.test(Question)==false||Question=="") {
			alert("질문을 입력하세요 ! (3~30자)");
			return false;
		}
		
		var chkchkList = /^[A-Za-z0-9가-힣\s]{3,30}$/;
		$("input[name=chkList]").each(function(){
			var value = $(this).val();
			if(chkchkList.test(value)==false||value=="") {
				alert("선택지 내용을 입력하세요 ! (3~30자)");
				flag = false;
				return false;
			}
		});
		
		if(flag){
			document.getElementById("survey").submit();
		} else {
			return false;
		}
	}
</script>
<div class="content-wrapper">
	<section class="content-header">
		<h1>&nbsp;</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Survey</a></li>
			<li class="active">Write</li>
		</ol>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
							<b>설문조사 작성</b>
						</h3>
					</div>
					<form class="form" method="post" id="survey" onsubmit="return chkchk();"
						action="${pageContext.request.contextPath}/survey/insertSurvey">
						<div class="box-body">
							<div class="form-group">
								<input type="hidden" name="survey_num" value="0"> 
								<input type="hidden" name="survey_start" value="0"> 
								<input type="hidden" name="survey_writer" value="${ writer }">
								<input type="hidden" name="survey_count" value="0"> 
								<input type="hidden" name="survey_state" value="진행"> 
								<label for="survey_title">설문 제목</label> 
								<input type="text" id="survey_title" name="survey_title" class="form-control" placeholder="Title : ">
							</div>
							<div class="form-group">
								<label for="survey_content">설문 설명</label>
								<textarea class="textarea" name="survey_content" id="survey_content"
									style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"
									placeholder="Info :">&nbsp;
                        		</textarea>
							</div>
							<div class="form-group">
								<label>마감시간 설정</label>
								<div class="input-group date">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<input type="text" id="datepicker" id="survey_end" class="form-control pull-right" name="survey_end">
								</div>
							</div>
							<div class='form-group'>
								<label for='Question'>Question</label> 
								<input type='text' id="Question" class='form-control' name='Question' placeholder='Question : '>
							</div>
							<div class='form-group'>
								<label for='chkList' class='col-sm-2 control-label'>Option</label>
								<div class='col-sm-10'>
									<input type='text' class='form-control chkList' name='chkList' placeholder='Option : '>
								</div>
							</div>
							<div class='form-group'>
								<label for='chkList' class='col-sm-2 control-label'>Option</label>
								<div class='col-sm-10'>
									<input type='text' class='form-control chkList' name='chkList' placeholder='Option : '>
								</div>
							</div>
							<div class='form-group'>
								<label for='chkList' class='col-sm-2 control-label'>Option</label>
								<div class='col-sm-10'>
									<input type='text' class='form-control chkList' name='chkList' placeholder='Option : '>
								</div>
							</div>
						</div>
					</form>
					<div class="box-footer">
						<input type="submit" id="Submit" class="btn btn-info pull-right" value="Submit"> 
						<input type="button" id="append" class="btn btn-default" value="항목추가">
						<input type="reset"	class="btn btn-info pull-right" value="Reset">
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
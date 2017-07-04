<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
$(function(){
	$("input, textarea").keyup(function(){	// 스크립트 막기
		var value = $(this).val();
		var arr_char = new Array();

		arr_char.push("<");
			
		for(var i=0 ; i<arr_char.length ; i++)
		{
			if(value.indexOf(arr_char[i]) != -1)
			{
				window.alert("< 특수문자는 사용하실 수 없습니다.");
				value = value.substr(0, value.indexOf(arr_char[i]));
				$(this).val(value);				
			}
		}
	});
	
});

function chkchk(){	// 유효성 처리
	
	//제목
	var re_title = /^[A-Za-z0-9가-힣\s]{3,60}$/;	
	var notice_title = $("#notice_title").val();
	if(re_title.test(notice_title)==false||notice_title==""){
		alert("제목을 입력하세요 !")
		return false;
	}
	
	//내용
	var notice_content=$("#notice_content").val();
	if(notice_content.trim()==""){
		alert("내용을 입력하세요 !")
		return false;
	}
	
	document.getElementById("notice").submit();
	
}
</script>

<div class="content-wrapper">
	<section class="content-header">
		<h1>&nbsp;</h1>
		<ol class="breadcrumb">
        <li><a href="${ pageContext.request.contextPath }/sky"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${ pageContext.request.contextPath }/notice/list">공지사항</a></li>
        <li class="active">Write</li>
      	</ol>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title"><b>Write</b></h3>
					</div>
						<form:form commandName="notice" id="notice" class="form-horizontal" method="post"
							onsubmit="return chkchk();">
							<div class="box-body">
								<form:hidden path="notice_num" value="${ notice_num }" />
								<form:hidden path="notice_writer" value="${ notice_writer }" />
								<form:hidden path="notice_date" value="${ notice_date }"/>
								<form:hidden path="notice_state" value="${ notice_state }" />
								<form:hidden path="notice_readcnt" value="${ notice_readcnt }"/>
								<div class="form-group">
									<label for="notice_title" class="col-sm-1 control-label">제목</label>
									<div class="col-sm-11">
										<form:input path="notice_title" id="notice_title" class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label for="notice_type" class="col-sm-1 control-label">분류</label>
									<div class="col-sm-11">
										<form:select path="notice_type" class="form-control">
											<form:option value="공지" label="공지" />
											<form:option value="발표" label="발표" />
											<form:option value="소식" label="소식" />
											<form:option value="이벤트" label="이벤트" />
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label for="notice_content" class="col-sm-1 control-label">내용</label>
									<div class="col-sm-11">
										<form:textarea path="notice_content" class="textarea" id="notice_content"
											style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"/>
									</div>
								</div>
							</div>
							<div class="box-footer">
								<input type="submit" class="btn btn-info pull-right" id="Submit" value="Submit">
								<input type="reset" class="btn btn-default" value="Reset">
							</div>
						</form:form>
					</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<script>
		function frmsubmit(){
	
			if($(".formform").val()=="" || $("#formform").val()==""){
				alert("제목과 내용을 입력해주세요");
				return false;
			};
			location.href="${pageContext.request.contextPath}/suggest/writeSuggest";
			return true;
		};
		
		$(function(){
		$("input, textarea").keyup(function(){
			var value = $(this).val();
			var arr_char = new Array();

			arr_char.push("\"");
			arr_char.push("<");
				
			for(var i=0 ; i<arr_char.length ; i++)
			{
				if(value.indexOf(arr_char[i]) != -1)
				{
					window.alert("< \" 특수문자는 사용하실 수 없습니다.");
					value = value.substr(0, value.indexOf(arr_char[i]));
					$(this).val(value);				
				}
			}
		});
		});
</script>


<div class="content-wrapper">
	<section class="content-header">
		<h3> 건의사항 작성</h3>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					
					<div class="box-header"></div>
						<form:form commandName="suggestboard" class="form-horizontal" onsubmit='return frmsubmit();' method="post">
							<div class="box-body">
								<div class="form-group">
									<div class="col-sm-10">
										<form:hidden path="sug_id" value="${login.member_enum}"/> 
										<form:hidden path="sug_name" value="${login.member_name}"/> 
										<form:hidden path="sug_num" value="${vo.sug_num}"/>
										<form:hidden path="sug_gnum" value="${vo.sug_gnum}"/> 
										<form:hidden path="sug_onum" value="${vo.sug_onum}"/> 
										<form:hidden path="sug_nested" value="${vo.sug_nested}"/>
									</div>
								</div>
								<div class="form-group">
									<label for="sug_title" class="col-sm-2 control-label">제목</label>
									<div class="col-sm-10">
										<form:input path="sug_title" class="formform" value="${vo.sug_title}" style="width: 100%; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"/>
									</div>
								</div>
								<div class="form-group">
									<label for="sug_cont" class="col-sm-2 control-label">내용</label>
									<div class="col-sm-10">
										<form:textarea path="sug_cont" class="textarea" id="formform"  value="${vo.sug_cont}" placeholder="건의내용을 구체적으로 기재해주세요"
										style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"/>
									</div>
								</div>
							</div>
							<div class="box-footer">
								<input type="submit" class="btn btn-info pull-right" value="작성완료">
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
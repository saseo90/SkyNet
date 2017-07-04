<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
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
	
	$('#subBtn').click(function(){
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/jobad/jobadForm',
			data:{
				"link": $('#link').val(),
				"name": $('#name').val(),
				"description": $('#description').val(),
				"caption": $('#caption').val()
			},
			success : function(data){
				window.open(data, "구인광고 등록","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
			},
		});
	});
	
	function getFacebook(){
		var url= "https://graph.facebook.com/1107748589262498/posts?access_token=EAAPvfdEp1qIBAIUAG7dIGzIFd1YCgR9Jubfa0ZAX0ZBRNY3y35qx8DYCRvR6RySSxmmfpuIm7e7FYbpnnIIZAJGKzgxhukAeoTYPJaXdJpZBhr3ZBwUc5zm1lODDUU30TX9t6V08qPlvB711FjzBqFO2ReG7iu1UXrmMqp3AHf6zzmJvB9KMO&callback=?";		 
		$.getJSON(url,function(json){
		     var html = "<ul>";
		    
		 //페이스북 json구조 하나의 object -> data,data,data....
		      $.each(json.data,function(i,fb){
		    if(fb.story != undefined)
		    {
		     html += "<li>" + fb.story + "</li>";
		    }
		    if(fb.message != undefined)
		    {
		     html += "<li>" + fb.message + "</li>";
		    }
		    if(fb.description != undefined)
		    {
		     html += "<li>" + fb.description + "</li>";
		    }
		    if(fb.picture != undefined && fb.link != undefined)
		    {
		     html += "<a href='" + fb.link + "'><img src='" + fb.picture + "'/></a>";
		    }
		      });
		     html += "</ul>";
		  
		     $('.facebookfeed').html(html);
		 });
		};
});
	
</script>
<script>

</script>

<div class="content-wrapper">
	<section class="content-header">
		<h1>&nbsp;</h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title"><b>구인광고 소셜 등록</b></h3>
					</div>
					
					<form:form commandName="jobad" class="form-horizontal" method="post" name="multiform">
							<div class="box-body">
								<div class="form-group">
									<label for="link" class="col-sm-1 control-label">링크 URL</label>
									<div class="col-sm-11">
										<form:input path="link" class="form-control" id="link"/>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="col-sm-1 control-label">링크 이름</label>
									<div class="col-sm-11">
										<form:input path="name" class="form-control" id="name"/>
									</div>
								</div>
								<div class="form-group">
									<label for="caption" class="col-sm-1 control-label">링크 caption</label>
									<div class="col-sm-11">
										<form:input path="caption" class="form-control" id="caption"/>
									</div>
								</div>
								<div class="form-group">
									<label for="description" class="col-sm-1 control-label">링크 설명</label>
									<div class="col-sm-11">
										<form:input path="description" class="form-control" id="description"/>
									</div>
								</div>
								
								<div class="box-footer">
									<input type="button" class="btn btn-info pull-right" id="subBtn" value="Submit">
									<input type="reset" class="btn btn-default" value="Reset">
								</div>
							</div>
						</form:form>
						 <div class="facebookfeed"></div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>
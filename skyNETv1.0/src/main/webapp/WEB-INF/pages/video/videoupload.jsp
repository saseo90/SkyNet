<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* .filebox input[type="file"] { */
/*   position: absolute; */
/*   width: 1px; */
/*   height: 1px; */
/*   padding: 0; */
/*   margin: -1px; */
/*   overflow: hidden; */
/*   clip:rect(0,0,0,0); */
/*   border: 0; */
/* } */

/* .filebox label { */
/*   display: inline-block; */
/*   padding: .5em .75em; */
/*   color: #999; */
/*   font-size: inherit; */
/*   line-height: normal; */
/*   vertical-align: middle; */
/*   background-color: #fdfdfd; */
/*   cursor: pointer; */
/*   border: 1px solid #ebebeb; */
/*   border-bottom-color: #e2e2e2; */
/*   border-radius: .25em; */
/* } */

/* /* named upload */ */
/* .filebox .upload-name { */
/*   display: inline-block; */
/*   padding: .5em .75em;  /* label의 패딩값과 일치 */ */
/*   font-size: inherit; */
/*   font-family: inherit; */
/*   line-height: normal; */
/*   vertical-align: middle; */
/*   background-color: #f5f5f5; */
/*   border: 1px solid #ebebeb; */
/*   border-bottom-color: #e2e2e2; */
/*   border-radius: .25em; */
/*   -webkit-appearance: none; /* 네이티브 외형 감추기 */ */
/*   -moz-appearance: none; */
/*   appearance: none; */
/* } */
</style>

<script>
	$(function() {
		var start = $("#startvalue").val();
		var end = $("#endvalue").val();
						
		var startstr = start.substr(0,10);
		var startyear = start.substr(0,4);
		var startmonth = start.substr(5,2);
		var startday = start.substr(8,2);
		
		startdate =new Date(startyear,startmonth-1,startday);
		
		var endstr = end.substr(0,10);
		var endyear = end.substr(0,4);
		var endmonth = end.substr(5,2);
		var endday = end.substr(8,2);
		
		enddate =new Date(endyear,endmonth-1,endday);
		
		var minD = new Date();
		var maxD = new Date();
		var dd = maxD.getDate() + 365;
		maxD.setDate(dd);
		
		$('#reservationtime33').daterangepicker({
			
			dateFormat:'YYYY-MM-DD',
			timePicker : false,
			minDate: minD, 
			maxDate: maxD
			
			
					
		});

		if($("#titleok").val() != "" && $("#startvalue").val() != ""){
			
		
		$('#reservationtime33').data('daterangepicker').setStartDate(startdate);
		$('#reservationtime33').data('daterangepicker').setEndDate(enddate);
		
		$("#startvalue").val(startstr);
		$("#endvalue").val(endstr); 
		
		}
			
	
		
	/*  $('#reservationtime2').on('cancel.daterangepicker', function(ev, picker) {
	      $(this).val('');
	  });  */
	
	$("#dateReset2").click(function(){
				
		$("#reservationtime33").val("");
		$("#startvalue").val("");
		$("#endvalue").val("");
		
	});
	var startdate ="";
	var enddate = "";
	
	  $('#reservationtime33').on('apply.daterangepicker', function(ev, picker) {
		startdate = picker.startDate.format('YYYY-MM-DD');
		enddate =  picker.endDate.format('YYYY-MM-DD');
		
		$("#startvalue").val(startdate);
		$("#endvalue").val(enddate);
		
		})
	
	
	});	
</script>

<div class="content-wrapper">
	<section class="content-header">
		<h1>글쓰기 작성</h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					<div class="box-header"></div>
					<form:form class="form-horizontal" commandName="videoboard" action="" onsubmit="" enctype="multipart/form-data"  method="post">
						<div class="box-body">
							<div class="form-group">
								<div class="col-sm-10">
									<form:hidden path="bnum" value="" />
								</div>
							</div>
							<div class="form-group">
								<label for="sug_title" class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<form:input type="text" class="form-control striphtml" id="titleok" path="title" value="" required="required"/>
									<form:errors path="title"/>
								</div>
							</div>
						
							<div class="form-group">
								<label class="col-sm-2 control-label">카테고리</label>
								<div class="col-sm-10">
									<form:select class="form-control select2 select2-hidden-accessible"
										path="category" style="width: 17%; margin-top: 10px;" tabindex="-1" 
										aria-hidden="true" items="${categories}" id="uploadCategory"/> 
										
								
										
									&nbsp;
									<button type="button" class="btn btn-default btn-sm"
										data-toggle="modal" data-target="#myModalCategory">편집하기</button>


								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">시청 가능기간 설정</label>


								<div class="col-sm-10">
									<div class="input-group">


										<div class="input-group-addon">
											<i class="fa fa-clock-o"></i>

										</div>

										<input type="text" class="form-control" id="reservationtime33">
										<form:hidden path="start_date" id="startvalue" value="" />
										<form:hidden path="end_date" id="endvalue" value="" />

									</div>
									<button type="button" style="width: 5%; margin-top: 12px;"
										id="dateReset2" class="btn btn-block btn-warning ">리셋</button>

								</div>


							</div>


							<div class="form-group">
								<label for="sug_cont" class="col-sm-2 control-label">내용</label>
								<div class="col-sm-10">
									<form:textarea class="textarea striphtml" id="formform" path="content" 
										style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"/>
									<form:errors path="content"/>									</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">첨부 자료 올리기</label>
								<div class="col-sm-10 filebox bs3-primary">
<!-- 								<input class="upload-name" value="파일선택" disabled="disabled"> -->
<!-- 									<label for="vfile1" id="">업로드</label> -->
									<form:input type="file" class="upload-hidden" id="vfile1" path="vfile" accept=".mp4" style="margin-top: 5px;" required="required"/>
								</div>



							</div>


						</div>
						<div class="box-footer">
							<input type="button" class="btn btn-success pull-right" onclick="location.href='${pageContext.request.contextPath}/videoTraining/main'" value="목록으로">
							<input type="reset" style="margin-right: 10px;" class="btn btn-wide btn-main pull-right" value="취소">
							<input type="submit" style="margin-right: 10px;" class="btn btn-info pull-right" value="작성완료">
							
							
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
</div>







<!--카테고리 컨트롤 -->
<div class="example-modal">
	<div class="modal" id="myModalCategory" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" id="" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">카테고리 편집</h4>
				</div>
				<div class="modal-body"
					style="min-height: 200px; max-height: 763px;">
				<!-- //////////////////////////////////////////// -->	
					
					<div class="dividework">
					<div style="margin-top: 25px;" class="margin-top-30">
						<strong>게시물 카테고리를 추가/선택/삭제 합니다.</strong>
					</div>
				
					<div style="margin-top: 20px;"></div>
					<div style="margin-bottom: 30px; clear: both;">
						<div class="box-footer no-padding" style="margin-top: 10px;">
							<!-- 							<ul class="nav nav-stacked modalscroll" id=""> -->

							<div class="input-group">
								<input type="text" id="categoryInput" class="form-control"> <span
									class="input-group-btn">
							<button type="button" id="categoryAdd" class="btn btn-info btn-flat">추가</button>
							<button type="button" id="categoryDelete" class="btn btn-danger btn-flat" style="display: none;">삭제</button>
							</span>
<!-- 							추가&nbsp;&nbsp;&nbsp;<i class="fa fa-check"></i> -->
							</div>
							<br>										<!--추가 글자가 셀렉트박스를 클릭했을때 삭제로 바뀌도록  -->
							<div class="form-group">
								<label>Select Multiple</label> <select multiple="multiple" size="7" id="typeselectbox"
									class="form-control">
																				
									<!-- option 위치 -->
									
								</select>
							</div>

							<!-- 							</ul> -->


						</div>


					</div>
					</div>
	<!-- ////////////////////////////////////////////////////// -->
					
				<!-- ///////////////////////////////// -->
				</div>
				<div class="modal-footer">
					<button type="button" id="saveCategory" style="width: 22%;"
						class="btn btn-wide btn-o btn-info">적용</button>
					<button type="button" style="width: 22%;"
						class="btn btn-wide btn-main" data-dismiss="modal">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>


<script>
/* window.onbeforeunload = function() {
    localStorage.setItem(title, $('#titleok').val());
    localStorage.setItem(content, $('#formform').val());
   
    // ...
}

window.onload = function() {

    var title = localStorage.getItem(title);
    if (title != null) $('#titleok').val(title);
    
    var content = localStorage.getItem(content);
    if (content != null) $('#formform').val(content);

    // ...
} */

function byteCheck(string){
	var stringLength = string.length;
	var stringByteLength = 0;
	
	stringByteLength = (function(s,b,i,c){
	    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    return b
	})(string);
	
	return stringByteLength;
	
}


$(function(){
	 $("#vfile1").change(function() {

	    var val = $(this).val();

	    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
	        case 'mp4': case 'flv': case 'webm':
	          
	            break;
	        default:
	            $(this).val('');
	            // error message here
	            alert("유효하지 않은 비디오 타입입니다. 사용가능한 타입은 mp4/flv/webm 입니다.");
	            break;
	    }
	}); 
	
	
	/*  var fileTarget = $('.filebox .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').val(filename);
	  }); */
	
	
	
	
	
	
	
	function selecttype(){
		
	$.ajax({
			
		'url' : '${pageContext.request.contextPath}/videoTraining/selecttypecategory',
		'type' : 'post',
		'success' : function(data){
		
			// $("#typeselectbox option:first").attr("disable",true);		
			 
		 $.each(data,function(i,v){
					
		$("#typeselectbox").append("<option class='myselect2' value='"+(i+1)+"'>"+v.typecategory+"</option>");			 
				
				
						 
							 
		 });	
			
		
				
		},
			
			'dataType' : 'json'
					
		})
			
		
		
	}
	
	/* 
	 $(".striphtml").change(function(){
	      $(this).val( $(this).text() );
	  });  */
	 $(".striphtml").change(function(){
		 var value = $(this).val(); 
		 value = value.replace(/</g, "&lt;").replace(/>/g, "&gt;");
		 
	 });
	
	
	$('#myModalCategory').on('show.bs.modal', function(e) {
		
		var input = $("#uploadCategory option:selected").val();
		
		
		selecttype();
		
		
		$("#categoryInput").val(input);
			
		
		
		
		
	});
	
	
	
	
	
	
	
	$("#typeselectbox").on('click','.myselect2',function(){
		
		var typeName =  $("#typeselectbox option:selected").text();
		
		$("#categoryInput").val(typeName);
		$("#categoryAdd").css("display","none");
		$("#categoryDelete").css("display","");
		
		
		
		
	});
	
	
	$("#categoryInput").on("focus",function(){
			
			$(this).val("");
			$("#categoryAdd").css("display","");
			$("#categoryDelete").css("display","none");
		});
	
	

	$("#categoryDelete").click(function(){
		
		
		
		var input = $("#categoryInput").val();
		
		
		
		$.ajax({
			
			'url' : '${pageContext.request.contextPath}/videoTraining/deletecategory',
			'type' : 'post',
			'data' : {'input' : input},
			'success' : function(data){
				 $("#typeselectbox").find("option").remove();
				selecttype();
				
			},
			
			
			'dataType' : 'json'
					
		})
		
		
		
		
		
		
		
		
		
	});
	
	
	
	
	
	
	
	$("#categoryAdd").click(function(){
				
		
				
		var input = $("#categoryInput").val().trim();
		
		input = input.replace(/</g, "&lt;").replace(/>/g, "&gt;");
		
		if(input ==null || input ==""){
			alert("값을 제대로 입력해주세요."); 
			
			return false;
			
		}else if(byteCheck(input)>30){
			alert("입력 byte길이 : "+ byteCheck(input)+", 최대허용 byte:30, 글자 수가 너무 많습니다");
			return false;
		}
			
		
				
	$.ajax({
			
			'url' : '${pageContext.request.contextPath}/videoTraining/typedistinct',
			'type' : 'post',
			'data' : {'input' : input},
			'success' : function(data){
				if(data == '존재'){
					
					swal("존재하는 이름입니다.","바꿔서 시도해주세요","error");
					return false;
				}else{
					
					$.ajax({
						
						'url' : '${pageContext.request.contextPath}/videoTraining/insertcategory',
						'type' : 'post',
						'data' : {'input' : input},
						'success' : function(data){
							 $("#typeselectbox").find("option").remove();
							selecttype();
							
						},
						
						
						'dataType' : 'json'
								
					})
					
					
					
				}
				
			},
			
			
			'dataType' : 'json'
					
		})
		
		
		
		
		
		
		
		
		
		
	
		
		
	});
	
	
	
	$("#saveCategory").click(function(){
		
		
	var input =	$("#categoryInput").val();
		
		 //$("#uploadCategory").val(input);
		
		var flag= true;
		$("#typeselectbox option").each(function(){
			 if($(this).text()==input){
				// swal("먼저 추가버튼을 눌러주세요.","","warning");
				flag= false;
				
			}
			// return false; 
			 
			// console.log($(this).text());
		});
		 
		 
		if(flag){
			swal("먼저 추가버튼을 눌러주세요.","","warning");
			return false;
		}else{
			 $("#uploadCategory").find("option").remove();
			 
			 $.ajax({
					
					'url' : '${pageContext.request.contextPath}/videoTraining/selecttypecategory',
					'type' : 'post',
					'success' : function(data){
					
						// $("#typeselectbox option:first").attr("disable",true);		
						 
					 $.each(data,function(i,v){
						 if(v.typecategory == input){
						 $("#uploadCategory").append("<option class='select2' value='"+v.typecategory+"' selected>"+input+"</option>" )			
							 
						 }else{
							 
						$("#uploadCategory").append("<option class='select2' value='"+v.typecategory+"'>"+v.typecategory+"</option>");			 
						 }
							 
						 
						 
							
							
									 
										 
					 });	
						
					// $("#uploadCategory").val(input).prop("selected", "selected");
						$(".select2").select2();
							
					},
						
						'dataType' : 'json'
								
					})
			
			
			
			
		}
		 
		 
		
		
		
		
		
		  $(this).attr("data-dismiss","modal");
		
		 
		 // window.onLoad();
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$('[data-dismiss=modal]').on('click', function (e) {

		 $("#uploadCategory").find("option").remove();
  		 var input = $("#categoryInput").val()
  		 $.ajax({
				
				'url' : '${pageContext.request.contextPath}/videoTraining/selecttypecategory',
				'type' : 'post',
				'success' : function(data){
				
					// $("#typeselectbox option:first").attr("disable",true);		
					 
				 $.each(data,function(i,v){
					
								 
						 
						
					if(input == v.typecategory){
						 $("#uploadCategory").append("<option class='select2' value='"+input+"' selected>"+ input+"</option>" );			
						
					}else{
						
						$("#uploadCategory").append("<option class='select2' value='"+v.typecategory+"'>"+v.typecategory+"</option>");
					}
					
					 
					 							
								 
									 
				 });	
					
				// $("#uploadCategory").val(input).prop("selected", "selected");
					$(".select2").select2();
						
				},
					
					'dataType' : 'json'
							
				})
		
		
		
		var $t = $(this),
	        target = $t[0].href || $t.data("target") || $t.parents('.modal') || [];

	  $(target)
	    .find("input,textarea,select")
	       .val('')
	       .end()
	    .find("input[type=checkbox], input[type=radio]")
	       .prop("checked", "")
	       .end();
	  
	  		  
	  		
	  		  $("#typeselectbox").find("option").remove();
	  
	  		  
	  		
	  
	})
	
	
	
	
});








</script>









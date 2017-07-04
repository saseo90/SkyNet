<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<script>
	$(function(){
	    $("#example1").DataTable();
		$('#example2').DataTable({
		      "paging": true,
		      "lengthChange": false,
		      "searching": true,
		      "ordering": true,
		      "info": false,
		      "autoWidth": true
		});
		
		$("#example2").on("click", ".memberTR", function(){
			var member_enum = $(this).attr("id");
			location.href="${pageContext.request.contextPath}/member/detail/"+member_enum;
		});
		// 개인 email 버튼 클릭시 사원번호 가지고 고고!!
		$("#example2").on("click", ".emailGo", function(){
			var member_enum = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/mail/mailForm/"+member_enum;
		})
		// 개인 쪽지    버튼 클릭시 사원번호 가지고 고고!!
        $("#example2").on("click", ".msgGo", function(){
        	var userList = [$(this).parents("tr").attr("id")]; 
            console.log(userList[0]);
            //사이드바 열기
            $("div#core>aside#rigth").attr("class","control-sidebar control-sidebar-dark control-sidebar-open");
            $("aside.control-sidebar.control-sidebar-dark ul.nav.nav-tabs.nav-justified.control-sidebar-tabs li:last-child a").trigger("click");            
            $("div#control-sidebar-message-tab div.pull-right.box-tools div.box-header i").attr("class","fa fa-minus");
            $("div#control-sidebar-message-tab div.box-body.pad").show();
            loadMemberList(userList);//메시지 사이드바 정보갱신
        })
		
	});
	</script>
    <script>
    //체크박스 전체선택
    $(document).ready(function(){
       $("#checkAll").click(function(){
          if($("#checkAll").prop("checked")){
             $("input[name=member_enum]").prop("checked",true);
          }else{
             $("input[name=member_enum]").prop("checked",false);
          }
       })
    });
    function email(){	//체크박스에 체크된 사원들에게 메일보내기
    	var emails = "";
    	$("input[name=member_enum]:checked").each(function(){
    		emails += $(this).val() + ", ";
    	});
    	
    	emails = emails.substring(0, emails.lastIndexOf(","));
    	
    	emails =  emails.trim().split(",");
    	if($.trim(emails)==""){ //체크된 사원이 없으면 
    		var member_enum = "0";
	    	location.href="${pageContext.request.contextPath}/mail/mailForm/"+member_enum;    		
    	} else { //체크된 사원이 있으면
	    	location.href="${pageContext.request.contextPath}/mail/mailForm2/"+emails;    		
    	}
    }
    function message(msg){
    	$(msg).prop("disabled", true);
    	var userList = []; 
        $("input[name=member_enum]:checked").each(function(){
        	userList.push($(this).val());
        });
            console.log(userList);
            //사이드바 열기
            $("div#core>aside#rigth").attr("class","control-sidebar control-sidebar-dark control-sidebar-open");
            $("aside.control-sidebar.control-sidebar-dark ul.nav.nav-tabs.nav-justified.control-sidebar-tabs li:nth-child(3) a").trigger("click");            
            $("div#control-sidebar-message-tab div.pull-right.box-tools div.box-header i").attr("class","fa fa-minus");
            $("div#control-sidebar-message-tab div.box-body.pad").show();
            loadMemberList(userList);//메시지 사이드바 정보갱신
    }
    function reMSG(msg){
    	 $(msg).prop("disabled", false);
    }
    function memberPDF() {
    	 location.href = "${pageContext.request.contextPath}/member/pdf";    	
    }
    function memberExcel() {
    	 location.href = "${pageContext.request.contextPath}/member/excel";
    }
    </script>
<style>
	.detailBtn:link    { color: #293818; text-decoration:none;     }
    .detailBtn:visited { color: #293818; text-decoration:none;     }
    .detailBtn:active  { text-decoration:none;     }
    .detailBtn:hover   { color: #2F9D27; text-decoration:none;   }
</style>
<div class="content-wrapper">
	<section class="content-header">
		<h1>MemberList</h1><br>
		업무용도로만 참고해주시기 바랍니다.
    </section>
    <section class="content">
		<div class="row">
		<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
			</div>
			
			<div class="box-body">
				  <input type="button" class="btn btn-primary" onclick="message(this);reMSG(this);" value="message"/>
				  <input type="button" class="btn btn-danger" onclick="email()" value="e-mail"/>
				  <input type="button" class="btn btn-default" onclick="memberPDF()" value="PDF DOWN">
				  <input type="button" class="btn btn-default" onclick="memberExcel()" value="EXCEL DOWN">
				<table id="example2" class="table table-bordered table-hover" >
					<thead>
						<tr>				
						<th><input type='checkbox' name='checkAll' id='checkAll'/></th>
						<th>no</th>
						<th class="MEMBER_DEPARTMENT">부서</th>
						<th class="MEMBER_RANK">직급</th>
						<th class="MEMBER_ENUM">사원번호</th>
						<th class="MEMBER_NAME">이름</th>
						<th class="MEMBER_PHONE">전화번호</th>
						<th class="MEMBER_EMAIL">mailAdd</th>
						<th class="do_message">쪽지</th>
						<th class="do_mail">메일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="vo" items="${list}" varStatus="vv">
						<tr id="${ vo.member_enum }">
						<td><input type='checkbox' id='seq' name='member_enum' value='${ vo.member_enum }' /></td>
							<td>${ vv.index+1}</td>
							<td>${vo.dep_name}</td>
							<td>${vo.rank_name}</td>
							<td class="memberTR">${vo.member_enum}</td>
							<td><a class="detailBtn" href="${pageContext.request.contextPath}/member/detail/${vo.member_enum}">${vo.member_name}</a></td>
							<td>${vo.member_phone}</td>
							<td>${vo.member_email}</td>
							<td class="msgGo"><img src="./../resources/img/messages.png"   width="18px" height="18px"/></td>
							<td><img src="./../resources/img/email.png" id="${vo.member_enum}" class="emailGo" width="18px" height="18px"/></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		</div>
		</div>		
</section>
</div>

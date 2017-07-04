<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script>
	function frmsubmit(){
			
			if($("#agree_update").is(":checked")){
				return true;
			};
			
			alert("동의해주세요");
			return false;
			
		};
</script>	
	
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="min-height: 1126px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        사원프로필
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath}/checkPassword">본인확인</a></li>
        <li class="active">User profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-default">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath}/resources/images/profile/${sessionScope.profileImg}" alt="User profile picture">

              <h3 class="profile-username text-center">${member.member_name}</h3>

              <p class="text-muted text-center">SkyNET ${member.dep_name}</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>사원번호</b> <a class="pull-right">${member.member_enum}</a>
                </li>
                <li class="list-group-item">
                  <b>직급</b> <a class="pull-right">${member.rank_name}</a>
                </li>
                <li class="list-group-item">
                  <b>근무지역</b> <a class="pull-right">대전</a>
                </li>
              </ul>
              </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">사원 입사정보</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 입사일</strong>

              <p class="text-muted">
                ${member.member_regdate}
              </p>

              <hr>

              <strong><i class="fa fa-book margin-r-5"></i> 퇴사일</strong>

              <p class="text-muted">
              	${member.member_resignationdate}
              </p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
<!--           title -->
            <ul class="nav nav-tabs">
              <li class="active"><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            
            <div class="tab-content">
              <div class="active tab-pane" id="settings">
<!--               폼폼 -->
                <form:form class="form-horizontal" commandName="myProfile" action='./${member.member_enum}' onsubmit='return frmsubmit();' method="post">
<!--                 사원번호 -->
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">사원번호</label>
                    <div class="col-sm-10">
                      <label for="inputName" class="control-label">${member.member_enum}</label>
                      <form:hidden path="member_enum" value="${member.member_enum}"/>
                    </div>
                  </div>
<!--                   이름 -->
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">이름</label>
                    	 <div class="col-sm-10">
                   	 	 	<form:hidden path="member_name" value="${member.member_name}"/>
		                      <label class="control-label" for="inputName" >${member.member_name}</label>
		                 </div>
                  </div>
<!--                   생년월일 -->
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">생년월일</label>
					<form:hidden path="member_birth" value="${member.member_birth}"/>
                  <div class="col-sm-10">
                    <label for="inputbirth" class="control-label">${member.member_birth}</label>
                    	
                    </div>
                  </div>                  
<!--                   이메일 -->
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                      <form:input path="member_email" class="form-control" id="inputEmail" placeholder="Email" value="${member.member_email}"/>
                    </div>
                  </div>
<!--                   주소 -->
                    <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">주소</label>

                    <div class="col-sm-10">
                      <form:input path="member_adress" class="form-control" id="inputAdress" value="${member.member_adress}"/>
                    </div>
                  </div>
<!--                   전화번호 -->
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">전화번호</label>

                    <div class="col-sm-10">
                      <form:input path="member_phone" type="tel" class="form-control" id="inputPhone" placeholder="전화번호" value="${member.member_phone}"/>
                    </div>
                  </div>
<!--                  결재인 -->
                  
                   
                   <div class="form-group">
                      <label for="file" class="col-sm-2 control-label">결재인</label>
                    <div class="col-sm-10">
                      <input type="file" id="exampleInputFile">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                      
                          <input type="checkbox" id="agree_update"> 위 내용으로 수정합니다.
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">수정</button>
                    </div>
                  </div>
				</form:form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
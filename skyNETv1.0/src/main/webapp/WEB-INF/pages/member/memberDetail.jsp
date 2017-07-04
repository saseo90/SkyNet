<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <div class="content-wrapper" style="min-height: 1126px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        사원프로필
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath}/resources/profile/jong.jpg" alt="User profile picture">

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
          <div class="box box-primary">
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
              <p class="text-muted">${member.member_resignationdate}</p>

              <hr>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">

              <li class="active"><a href="#settings" data-toggle="tab">Detail</a></li>
            </ul>
            <div class="tab-content">
            
              <div class="active tab-pane" id="settings">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">사원번호</label>

                    <div class="col-sm-10">
<!--                       <label for="inputName" class="col-sm-2 control-label">000021</label> -->
                      ${member.member_enum}
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                    ${member.member_name}
<!--                       <input type="text" class="form-control" id="inputName" placeholder="이름"> -->
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputDepartment" class="col-sm-2 control-label">소속</label>

                    <div class="col-sm-10">
							${member.dep_name}
                    </div>
                  </div>                  
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
<!--                       <input type="email" class="form-control" id="inputEmail" placeholder="Email"> -->
                      ${member.member_email}
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">생년월일</label>

                    <div class="col-sm-10">
<!--                       <input type="date" class="form-control" id="inputEmail" placeholder="날짜"> -->
							${member.member_birth}
                    </div>
                  </div>
                  
                  
                    <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">거주지</label>

                    <div class="col-sm-10">
<!--                       <input type="text" class="form-control" id="inputEmail" placeholder="시군구"> -->
							${member.member_adress}
                    </div>
                  </div>               
                  
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">전화번호</label>

                    <div class="col-sm-10">
<!--                       <input type="tel" class="form-control" id="inputEmail" placeholder="전화번호"> -->
							${member.member_phone}
                    </div>
                  </div>
                </form>
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
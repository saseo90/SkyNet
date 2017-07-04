<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="min-height: 1126px; text-align: center;">
    <!-- Main content -->
    <section class="content" class="center">

      <div class="row center" style="margin : auto;">
        <div class="col-md-12" style="margin : auto;">
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">Check Password</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
					<form:form commandName="checkcheck">
						<br><br><br><br><br><br>
						<p> 본인 확인을 위해 비밀번호를 입력해주세요 .</p>
						<p> <form:hidden value="${login.member_enum }" path="member_enum"/> </p>
						<p> <form:password path="member_pass" placeholder="Password"/> </p>
						<input type="submit" class="btn btn-warning center" value="본인확인">
						<br><br><br><br><br><br><br><br><br><br><br><br>
						
					</form:form>              		
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
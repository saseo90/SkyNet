<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/i18n/defaults-*.min.js"></script>
  

<script>

function checkForm(){

	//사원번호입력
	var checkEnum =  /^[A-Za-z0-9]{4,8}$/;
	var memberEnum = $("#member_enum").val();
	if(checkEnum.test(memberEnum)==false || memberEnum==""){
		$("#checkResult").text("사원번호를 확인해주세요(영문, 숫자로 4자리에서 8자리까지 가능합니다.)");
		return false;
	}
	
	
	//이름
	var memberName = $("#member_name").val();
	if(memberName==""){
		$("#checkResult").text("이름은 필수항목 입니다.");
		return false;
	}
	
	//핸드폰입력해주세요
	var checkPhone = /^01[0-9]{1}-[0-9]{3,4}-[0-9]{4}$/;
	var memberPhone = $("#member_phone").val();
	if(checkPhone.test(memberPhone)==false || memberPhone==""){
		$("#checkResult").text("연락처는 필수항목 입니다.");
		return false;
	}
	
	
	
	//생년월일
	var checkBirth = /^[0-9]{6}$/;
	var memberBirth = $("#member_birth").val();
	if(checkBirth.test(memberBirth)==false || memberBirth==""){
		$("#checkResult").text("생년월일을 다시 입력해주세요. ex)920102");
		return false;
	}
	
	//비밀번호 재화깅ㄴ
	var memberPass = $("#member_pass").val();
	var memberPass1 = $("#member_pass1").val();
	if(memberPass != memberPass1 || memberPass==""){
		$("#checkResult").text("비밀번호가 비었거나 일치하지 않습니다.");
		return false;
	}
	
	//이메일
	var checkEmail = /^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/;
	var memberEmail = $("#member_email").val();
	if(checkEmail.test(memberEmail)==false || memberEmail==""){
		$("#checkResult").text("이메일을 형식에 맞게 작성해주세요");
		return false;
	}
	
	
	//등록일
	var memberReg = $("#member_regdate").val();
	if(memberReg==""){
		$("#checkResult").text("입사일을 입력해주세요");
		return false;
	}	
	
	
	//주소
	var memberAdd = $("#member_adress").val();
	if(memberAdd==""){
		$("#checkResult").text("주소를 입력해주세요");
		return false;
	}

	//결재인처리
	var strFile = $("#exampleInputFile").val();
 	var lastIndex = strFile.lastIndexOf('\\');
 	var imgFile = strFile.substring(lastIndex+1, strFile.length);
 	if(imgFile!="sign.png"){
 		$("#checkResult").text("이미지 확장자는 png 만 가능하며, 결재인 파일이름을 sign.png로 업로드해주시기바랍니다.");
		return false;
 	}
 	
 	//프로필처리
	var strFile1 = $("#profileimg").val();
 	var lastIndex1 = strFile1.lastIndexOf('\\');
 	var imgFile1 = strFile1.substring(lastIndex1+1, strFile1.length);
 	if(imgFile1!="profile.png"){
 		$("#checkResult").text("이미지 확장자는 png만 가능하며, 파일이름을 profile.png로 업로드해주시기 바랍니다.");
		return false;
 	};
	
 	document.getElementById("memberJoinform").submit();
	
};


$(function(){
	$(".choiceFile").change(function() {
		setImg();
	});
});
function file_browse()
{
	$(".choiceFile").click();
}
function setImg(){
 	var strFile = $(".choiceFile").val();
 	var lastIndex = $(".choiceFile").val().lastIndexOf('\\');
 	var imgFile = strFile.substring(lastIndex+1, strFile.length);
	$("#text1").attr('src', '${pageContext.request.contextPath}/resources/profile/'+ imgFile);
}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="min-height: 1126px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        사원 등록
      </h1> 프로필사진/결재인 파일 이름은 profile.jpg / sign.jpg 로 수정하여 업로드 해주시기 바랍니다.
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">User profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<form:form id="memberJoinform" class="form-horizontal" commandName="joinMember" 
	onsubmit='return checkForm();' action="${pageContext.request.contextPath}/memberJoin" method="post" enctype="multipart/form-data">
<%-- 	action="${pageContext.request.contextPath}/memberJoin" --%>
      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
            <div >
              <table>
				<input type="file" id="profileimg" class="choiceFile" style="display:none;" name="profile"/>
					<tr>
						<td><img class="profile-user-img img-responsive img-circle" id="text1" onclick="file_browse()" src="${pageContext.request.contextPath}/resources/profile/employee.png" alt="User profile picture" ><br></td>
					</tr>
				</table>
			</div>
				
              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>사원번호</b> <a class="pull-right"><input type="text" id="member_enum" name="member_enum" value="${joinMember.member_enum}"></a>
                </li>
                <li class="list-group-item">
                  <b>직급</b> 
                  <a class="pull-right">
                  	<select class="selectpicker" name="member_rank" size="10">
					  <option value="1">1. 출입</option>
					  <option value="2">2. 인턴</option>
					  <option value="3">3. 사원</option>
					  <option value="4">4. 대리</option>
					  <option value="5">5. 과장</option>
					  <option value="6">6. 차장</option>
					  <option value="7">7. 부장</option>
					  <option value="8">8. 사장</option>
					  <option value="9">9. 회장</option>
					  <option value="10">10. 고문</option>
					  <option value="11">11. 상무이사</option>
					  <option value="12">12. 전무이사</option>
					  <option value="13">13. 사외이사</option>
					  <option value="14">14. 평이사</option>
					  <option value="15">15. 이사장</option>
					</select>
                  </a>
                </li>
                <li class="list-group-item">
                  <b>부서</b> <a class="pull-right">
                  	<select class="selectpicker" name="member_department" size="10">
					  <option value="1">1. 전사부</option>
					  <option value="2">2. 감사팀</option>
					  <option value="3">3. 비서실</option>
					  <option value="4">4. 특별회계팀</option>
					  <option value="5">5. 전산지원팀</option>
					  <option value="6">6. 전산팀</option>
					  <option value="7">7. 시설팀</option>
					</select>
                  </a>
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
              <strong><i class="fa fa-book margin-r-5"></i> 입사일</strong><br>
              <input type="date" value="" id="member_regdate" name="member_regdate"/>
              <hr>
              <strong><i class="fa fa-book margin-r-5"></i> 퇴사일</strong><br>
              <input type="date" value="" name="member_resignationdate"/>
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

              <li class="active"><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            <div class="tab-content">
            
              <div class="active tab-pane" id="settings">
                
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="member_name" placeholder="이름" name="member_name" value="${joinMember.member_name}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">암호</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" id="member_pass" placeholder="비밀번호" name="member_pass" value="${joinMember.member_pass}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">암호 확인</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" id="member_pass1" placeholder="비밀번호 확인" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="member_email" placeholder="Email"name="member_email" value="${joinMember.member_email}">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">생년월일</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="member_birth" placeholder="주민번호 앞자리 ex)901207" name="member_birth" value="${joinMember.member_birth}">
                    </div>
                  </div>
                  	
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">주소</label>
						
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="member_adress" placeholder="주소" name="member_adress" value="${joinMember.member_adress}">
                    </div>
                  </div>                  
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">전화번호</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="member_phone" placeholder="전화번호" name="member_phone" value="${joinMember.member_phone}">
                    </div>
                  </div>
                   <div class="form-group">
                      <label for="file" class="col-sm-2 control-label">결재인</label>
                    <div class="col-sm-10">
                      <input type="file" id="exampleInputFile" name="sign">
                    </div>
                  </div>
                  <!-- <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> 위 내용을 <a href="#">동의합니다</a>
                        </label>
                      </div>
                    </div>
                  </div> -->
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                            <p id="checkResult" style="color : red;"><br></p>
                      <input type="button" onclick="checkForm()" class="btn btn-danger" value="가입">
                    </div>
                  </div>
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
		</form:form>
    </section>
    <!-- /.content -->
  </div>
</body>
</html>
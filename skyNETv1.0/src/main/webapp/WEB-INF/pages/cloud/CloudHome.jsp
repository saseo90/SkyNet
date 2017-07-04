<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
<!-- jsZip -->
<script src="${pageContext.request.contextPath}/resources/filedownload/jszip.js"></script>
<!-- FileSaver -->
<script src="${pageContext.request.contextPath}/resources/filedownload/FileSaver.js"></script>

<!-- Page Script -->
<script type="text/javascript">
$(document).ready(function(){
    $("body").attr("class","skin-blue sidebar-mini sidebar-collapse");
    
});
$(function(){
    $("section.content ul.nav.nav-pills.nav-stacked li").click(function(){
        $("section.content ul.nav.nav-pills.nav-stacked li").removeClass("active");
        $(this).addClass("active");
    });
});
//0.초기화 업로드 팝업숨김
$("cloudBg").addClass("control-sidebar-bg");

$(function () {
  //0.초기화 리프레쉬 로딩중지
  stopLoadingRefalsh();
  //0.내드라이브 (사원그룹) 의 파일 리스트 출력
  reflashFileList(null);
  //파일정보 레이어 및 활동이력 폼 숨기기
  fileInfoBoxClose();
  //fileBoxReflasgAuto();
  //공유하기 오버로딩 종료
  loadingGonYouStop();
  
  $(".gabege-group").hide();
  //다운로드 개별선택
  $('.mailbox-messages input.hiFileNo').iCheck({
    checkboxClass: 'icheckbox_flat-blue',
    radioClass: 'iradio_flat-blue'
  });
  //다운로드 일괄선택
  $(".mailbox-messages").on("click",'.checkbox-toggle',(function () {
    $('.mailbox-messages input.hiFileNo').iCheck({
        checkboxClass: 'icheckbox_flat-blue',
        radioClass: 'iradio_flat-blue'
    });
    var clicks = $(this).data('clicks');
    if (clicks) {
      //Uncheck all checkboxes
      $(".mailbox-messages input.hiFileNo").iCheck("uncheck");
      $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
    } else {
      //Check all checkboxes
      $(".mailbox-messages input.hiFileNo").iCheck("check");
      $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
    }
    $(this).data("clicks", !clicks);
  }));
  $(".cloud-upload").click(function(){//다운로드 버튼
      uploadChekALL();
  });
  
  //Handle starring for glyphicon and font awesome
//   $(".mailbox-messages ").on('click','.mailbox-star',function (e) {
//     $('.mailbox-messages input[type="checkbox"]').iCheck({
//         checkboxClass: 'icheckbox_flat-blue',
//         radioClass: 'iradio_flat-blue'
//     });
//     e.preventDefault();
//     //detect type
//     var $this = $(this).find("a > i");
//     var glyph = $this.hasClass("glyphicon");
//     var fa = $this.hasClass("fa");

//     //Switch states
//     if (glyph) {
//       $this.toggleClass("glyphicon-star");
//       $this.toggleClass("glyphicon-star-empty");
//     }
//     if (fa) {
//       $this.toggleClass("fa-star");
//       $this.toggleClass("fa-star-o");
//     }
//   });
  //팝업 레이어_파일업로드박스
  var CloudBgflag = true;
  function cloudBgToggle(){
      if(CloudBgflag){//열기
          $("#cloudBg").show();
          CloudBgflag = false;
      }else{//닫기
          $("#cloudBg").hide();
          CloudBgflag = true;
          //팝업 레이어_아이텝 전체확인
          $("#allDeleteFile").trigger("click");
      }
  }
  //팝업 레이어_파일업로드박스 호출
  $("div.btn.btn-primary.btn-block.margin-bottom").click(function(){cloudBgToggle();});
  //팝업 레이어_아이템 확인 후 삭제
  $("#cloudBg tbody.files").on("click","div.btn.btn-danger.delete",function(){removeFile(this);});
  //팝업 레이어_아이템 전송시작
  $("#cloudBg tbody.files").on("click","div.btn.btn-primary.start",function(){var fileNumTemp = startFile(this); sendFile(fileNumTemp);});
  //팝업 레이어_아이템 전송취소
  $("#cloudBg tbody.files").on("click","div.btn.btn-warning.cancel",function(){cancelFile(this);});
  //팝업 레이어_아이템 전체전송
  $("#allUploadFile").click(function(){allUploadFile();});
  //팝업 레이어_아이템 전체취소
  $("#allCancelFile").click(function(){allCancelFile();});
  //팝업 레이어_아이텝 전체확인
  $("#allDeleteFile").click(function(){allDeleteFile();});
  //파일정보 레이어 
  $("tbody#fileBody").on("click","tr.recode",function(){
      var fileNo = '';
      var fileNote = '';
      var fileLeadDate = '';
      var fileType = '';
      var fileModDate = '';
      var fileRegDate = "";
      var fileUser    = "";
      
      $.each($(this).children(".hide").children("input"),function(){
          if($(this).attr("name")=="fileNo"){
              fileNo = $(this).val();
          }else if($(this).attr("name")=="fileNote"){
              fileNfileNoteo = $(this).val();
          }else if($(this).attr("name")=="fileLeadDate"){
              fileLeadDate = $(this).val();
          }else if($(this).attr("name")=="fileType"){
              fileType = $(this).val();
          }else if($(this).attr("name")=="fileModDate"){
              fileModDate = $(this).val();
          }else if($(this).attr("name")=="fileUser"){
              fileUser    = $(this).val();
          }else if($(this).attr("name")=="fileRegDate"){
              fileRegDate = $(this).val();
          }
      });
      //레이어 오픔
      //데이터출력
      fileInfoBoxOpne(fileNo,fileNote,fileLeadDate,fileType,fileModDate,fileUser,fileRegDate);
      //파일정보 오픔
      fileInfoBtnClick();
   });
  
  //파일 담는 변수
  fileList = new Array();
  //전송신청한 파일번호 리스트
  upLoadFileNumList = new Array();
  //팝업 레이어_파일추가
  $("#cloudAddFiles").change(function(){      
      $.each(document.getElementById("cloudAddFiles").files,function(i,v){
          var isValid1 = true;//파일형식
          var isValid2 = true;//파일크기 
          var fileSize = '';
          var msg = "";
          var fileType = '';
          //http tip.daum.net/openknow/52660450
          //주요파일 형식 
          if ((/png|jpe?g|gif|bmp/i).test(v.name)) {
              //fileType = 1;
              //사진
              //isValid1 = false;
              //msg = '<span>png, jpg, gif 만 가능합니다</span>';
          }else if ((/xlsx|xls|txt|rtf|hwp|asv|pdf|doc|ppt|mdb|html|docx|zip|sql/i).test(v.name)) {
              //fileType = 0;
              //문서
              //isValid1 = false;
              //msg = '<span>png, jpg, gif 만 가능합니다</span>';
          }else if ((/avi|mov|mpe?g/i).test(v.name)) {
              //fileType = 2;
              //동영상
              //isValid1 = false;
              //msg = '<span>png, jpg, gif 만 가능합니다</span>';
          }else if ((/mp3|wav|mid/i).test(v.name)) {
              //fileType = 3;
             //음악
              //isValid1 = false;
              //msg = '<span>png, jpg, gif 만 가능합니다</span>';
          }else{
              isValid1 = false;
              msg = '<span>알 수 없는 파일형식입니다.</span>';
          }
          console.log(v.size);
          console.log(v.size/1048576);
          if(v.size < 1024){ //1kb 미만             
              fileSize = v.size + 'byte';
          } else if(v.size  <    1048576){//1mb 미만
              fileSize = Math.round(v.size/1024) + 'kb';
          } else if (v.size <= 524288000) { // 500 mb 이하
              fileSize = Math.round(v.size/1048576) + 'mb';
          } else if (v.size >  524288000) { // 500 mb 초과;
              isValid2 = false;
              msg += '<span>파일 용량은 500메가를 초과할 수 없습니다.</span>';
          }
          if (isValid1&&isValid2) {//정상
             addFileView(fileList.length,v.name,fileSize,null);//화면에 출력
          }else {//비정상
             addFileView(fileList.length,v.name,fileSize,msg);//화면에 출력
          }
         fileList.push(v);//리스트에 추가
         console.log(v.name);
         console.log(fileList.length-1);
      });
      $("#cloudAddFiles").val("");
  });
  //내 드라이브 콘트롤2
  //파일박스 위의 휴지통 이동(파일삭제 버튼)
  $(".fileBoxModveGavege").click(function(){
      moveGabegeFile();
  });
  //휴지통 콘트롤1
  //파일박스 위의 휴지통 복원(파일복원 버튼)
  $(".fileBoxRecoverGOGO").click(function(){
      recoverGabegeFile();
  });
  //(공통)파일박스 위의 새로고침 버튼
  //구분 : 내그룹, 휴지통, 그룹별
  $(".fileBoxReflashBtn").click(function(){
    //0.내드라이브 (사원그룹) 의 파일 리스트 출력
      reflashFileList(null);
  });
  //휴지통 콘트롤3
  //파일 완전삭제
  $(".fileBoxDeleteBtn").click(function(){
	  deleteFileGOGO();
  });
  //파일공유 전송
  $("#gongYouBtnGoGo").click(function(){
	  gongYouGoGO();	  
  });  
});
//아이템 확인 후 삭제 : 이미지만 삭제함
function removeFile($obj){
    $($obj).closest("tr").remove();
}
//아이템 전송취소 : 전송 전 취소 1.파일리스트에서 제거 2.화면 버튼Image교체
function cancelFile($obj){
    var fileNum = $($obj).closest("tr").children("input[name=fileNum]").val();
    delete fileList[0];
    $($obj).closest("tr").remove();
}
//아이템 전송시작 : 전송 파일번호 
function startFile($obj){
    //console.log("aa");
    var fileNum = $($obj).siblings("input").val();
    console.log("번튼 옆 파일번호"+fileNum);
    var fileNumList = new Array();
    fileNumList.push(fileNum);
    //console.log("리스트에 담김 파일번호"+fileNumList);
    $($obj).closest("tr").attr("class","template-download fade in").append('<td><div class="btn btn-danger delete"><i class="glyphicon glyphicon-trash"></i><span>확인</span></div></td>').children("td:nth-child(4)").remove();
    return fileNumList;
}
//추가된 파일 의 뷰를 팝업 레이어에 추가한다.
//파라미터 : 파일이름 , 용량 
function addFileView(fileNum,fileName,fileSize,state){
    var fileInfo = '';
    if(state == null){//저장가능 파일
        fileInfo += '<tr class="template-upload fade in">'
        fileInfo += '<td><span class="preview"></span></td>';//선택버튼(사용안함)
        fileInfo += '<td><p class="name"'+fileName+'</p></td>';//파일이름
        fileInfo += '<td><span class="size">'+fileSize+'</span>';
        fileInfo += '<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width: 0%;"></div>';
        fileInfo += '</div></td>';//파일용량
        fileInfo += '<td><input type="hidden" name="fileNum" value="'+fileNum+'"><div class="btn btn-primary start"><i class="glyphicon glyphicon-upload"></i><span>전송</span></div>';
        fileInfo += '<div class="btn btn-warning cancel"><i class="glyphicon glyphicon-ban-circle"></i><span>취소</span></div>';
        fileInfo += '</td>';
    }else{//저장 못하는 파일
        fileInfo += '<tr class="template-upload fade in">'
        fileInfo += '<td><span class="preview"></span></td>';//선택버튼(사용안함)
        fileInfo += '<td><p class="name"'+fileName+'</p></td>';//파일이름
        fileInfo += '<td><span class="size">'+fileSize+'</span>';
        fileInfo += '<div>'+state+'</div>';
        fileInfo += '</td>';
        fileInfo += '<td><div class="btn btn-danger delete"><i class="glyphicon glyphicon-trash"></i><span>확인</span></div></td>';
    }
    $("#cloudBg tbody.files").append(fileInfo);
}
//파일 전송
function sendFile(fileNumList){
    //console.log(fileNumList);
    //console.log(fileList);
    //전송대상 파일리스트 생성
    var formData = new FormData();
    $.each(fileNumList,function(i,v){
        //console.log(parseInt(v));
        formData.append("filedata",fileList[parseInt(v)]);
    });
    console.log("전송시작");
    $.ajax({
        url : 'fileUpload'
        ,data : formData
        ,type : 'POST'
        ,beforeSend : function(){//전송직전 실행 false 면 전송취소
            //console.log('before');
        }
        ,success : function(data, status){//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
            //console.log("성공"+data+","+status);
            reflashFileList(null);//내드라이브 파일조회 
        }
        ,error : function(request, status, error){
           // console.log(error);
            reflashFileList(null);//내드라이브 파일조회 
        }
        ,contentType: false
        ,dataType : 'json'
        ,processData: false
        ,xhr: function() {
            myXhr = $.ajaxSettings.xhr();
            if(myXhr.upload){
                myXhr.upload.addEventListener('progress',showProgress, false);
            } else {
                console.log("Uploadress is not supported.");
            }
            return myXhr;
        }
    });
    function showProgress(evt) {
        if (evt.lengthComputable) {
            var percentComplete = (evt.loaded / evt.total) * 100;
            //console.log("응답"+percentComplete);
            $("#fileuploadProgress").attr("style","width:"+percentComplete+"%;");
            //$('#progressbar').progressbar("option", "value", percentComplete );
        }  
    }
}
//파일 조회
//0 : 내드라이브 ,1 : 문서, 2: 동영상 , 3:음악, 4:사진
function reflashFileList(typeNum){
    var tmpParam ='';
    
    if(typeNum == null){//내 드라이브
        tmpParam= "param="+-1;
    }else if(typeNum == 0 ){//문서
        tmpParam= "param="+0;
    }else if(typeNum == 1){//동영상
        tmpParam= "param="+1;
    }else if(typeNum == 2){//음악
        tmpParam= "param="+2;
    }else if(typeNum == 3){//사진
        tmpParam= "param="+ 3;
    }else if(typeNum == 4){//휴지통
        tmpParam= "param="+ 4;
    }else{
        return false;
    }
    //0 : 내 드라이브 1:휴지통
    var tmp = $("input[name=dir]").val();
    tmpParam += "&dir="+tmp;
    
    $.ajax({
        url : 'selectMyCloudFileList'
        ,type : 'POST'
        ,data : tmpParam
        ,beforeSend : function(){//전송직전 실행 false 면 전송취소
            //console.log('사원 파일리스트 로드 before');
            startLoadingRefalsh();
        }
        ,success : function(data, status){//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
           var fileItem = '';
           if(data.length < 1){
               fileItem += '<tr class="cloudmsg"><td colspan="6">클라우드를 사용해 보세요.</td></tr>';
           }else{
               $.each(data,function(i,v){
                   fileItem += '<tr class="recode"><td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">';
                   fileItem += '<input type="checkbox" class="hiFileNo" style="position: absolute; opacity: 0;"><input type="hidden" name="fileNo" value="'+v.fileNo+'"></div></td>';
                   fileItem += '<td class="mailbox-subject">'+v.fileOriName+'</td>';
                   fileItem += '<td class="mailbox-attachment">'+v.fileSize2+'</td>';
                   fileItem += '<td class="mailbox-name">'+v.fileUser+'</td>';
                   fileItem += '<td class="mailbox-date">'+v.fileRegDate+'</td>'
                   fileItem += '<td class="hide">';
                   fileItem += '<input type="hidden" name="fileNo" value="'+v.fileNo+'">';
                   fileItem += '<input type="hidden" name="fileNote" value="'+v.fileNote+'">';
                   fileItem += '<input type="hidden" name="fileLeadDate" value="'+v.fileLeadDate+'">';
                   fileItem += '<input type="hidden" name="fileType" value="'+v.fileType+'">';
                   fileItem += '<input type="hidden" name="fileModDate" value="'+v.fileModDate+'">';
                   fileItem += '<input type="hidden" name="fileUser" value="'+v.fileUser+'">';
                   fileItem += '<input type="hidden" name="fileRegDate" value="'+v.fileRegDate+'">';
                   fileItem += '</td>';
                   fileItem += '</tr>';
                });
           }
            $("tbody#fileBody").empty();
            $("tbody#fileBody").append(fileItem);
            //console.log("파일조화후  새로고침 ");
            fileBoxReflasgAuto();//파일 개수 새로고침
            stopLoadingRefalsh();
            if($(".checkbox-toggle i").hasClass("fa-square-o")){            	
            	$(".mailbox-messages .checkbox-toggle").click();
            	$(".mailbox-messages .checkbox-toggle").click();
            }else{
            	$(".mailbox-messages .checkbox-toggle").click();
            }
        }
        ,error : function(request, status, error){
            console.log("사원 파일리스트 로드오류 : "+error);
            stopLoadingRefalsh();
        }
        ,dataType : 'json'
    });
}

function uploadChekALL(){//체크된 파일의 파일번호 리스트 생성
    var uploadFileNoList = new Array();
    $.each($(".hiFileNo"),function(i,v){
        //console.log($(this).prop("checked"));
        if($(this).prop("checked")){
           uploadFileNoList.push($(v).closest("div").siblings("input[name=fileNo]").val());
        }
    });
   //console.log(uploadFileNoList.length)
    if(uploadFileNoList.length<1){//파일 선택 안됬을 때 리턴 false
        return false;
    }else{
        //console.log(uploadFileNoList);
        DownloadFile(uploadFileNoList);     
    }
}
function DownloadFile(uploadFileNoList){//파라미터는 파일넙버
    var param = '';
        $.each(uploadFileNoList,function(i,v){
            if(i==0){               
                param += "fileNo="+v;
            }else{
                param += "&fileNo="+v;
            }
        });
    $.ajax({
        url   : 'testUrl'
        ,type : 'POST'
        ,data : param
        ,beforeSend : function(){//전송직전 실행 false 면 전송취소
            //console.log('파일 다운로드 before');
           // startLoadingRefalsh();
        }
        ,success : function(data, status){//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
            //console.log("사이즈 : "+ data.length);
            //console.log("내용 : "+ data);
            if(data.length<2){
                window.location.href="${pageContext.request.contextPath}/cloud/fileDouwnload?"+param;
            }else{//다중 다운로드 일 경우 ZIP 파일로 묶어서 제공한다.
                window.location.href="${pageContext.request.contextPath}/cloud/multidownload?"+param;
            }
        }
        ,error : function(request, status, error){
          //  console.log("파일 다운로드오류 : "+error);
           // stopLoadingRefalsh();
        }
        ,dataType : 'json'
    });
}
//본문 리플레쉬 로딩시작
function startLoadingRefalsh(){
    $("div#cloudRelashLoading").show();
}
//본문 리플레쉬 로딩종료
function stopLoadingRefalsh(){
    $("div#cloudRelashLoading").hide();
}
//파일상세보기 이벤트 발생
function fileInfoBtnClick(){
    $("#fileInfoBtn").children("a").trigger("click");
}
//활동이력보기 이벤트 발생
function fileHistioryBtnClick(){
    $("#fileHistioryBtn").children("a").trigger("click");  
}
//레이어닫기 이벤트 발생
function fileInfoBoxClose(){
    $("#fileInfoBoxClose").trigger("click");
}
//파일정보 박스 숨김 이벤트
function fileInfoBoxClose(){
    $("#fileInfoBox").hide();
}
//파일정보 버튼 이벤튼
//파일정보 이벤트 클릭시 정보출력 이벤트 , 데이터 레코드 클릭시 해당 레코드의 상세정보 출력
function fileInfoBoxOpne(fileNo,fileNote,fileLeadDate,fileType,fileModDate,fileUser,fileRegDate){
    $(".fileHistoryBox-Body").hide();
    $("#fileType").text(fileType);
    $("#fileUser").text(fileUser);
    $("#fileModDate").text(fileModDate);
    $("#fileRegDate").text(fileRegDate);
    $("#fileLeadDate").text(fileLeadDate);
    $("#fileNo").text(fileNo);
    $("#fileInfoBox").show();
}
//활동이력 버튼 클릭이벤트
function reflasgFileHistory(){
    var fileNo = $("#fileNo").text();
    if(fileNo == null){
        return false;
    }
    var param ="fileNo="+fileNo;
     $.ajax({
            url   : 'fileHistory'
            ,type : 'POST'
            ,data : param
            ,beforeSend : function(){//전송직전 실행 false 면 전송취소
                //console.log('활동이력 before');
                //startLoadingRefalsh();
            }
            ,success : function(data, status){//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
               var hitoryItem = "";
               $.each(data,function(i,v){
                   hitoryItem +='<div class="fileHistoryBox">';
                   //해더
                   hitoryItem +='<table><tr><td>';
                   hitoryItem +='<img alt="클라우드프로필사진" src="/sky/resources/images/profile/901022_profile.png" class="img-circle" style="height: 36px;width: 36px;">';
                   hitoryItem +='</td><td>';
                   //수정내용
                   hitoryItem +='<div style="color: #000;font-size: 13px;width: 238px;">';
                   hitoryItem +='<span style="font-weight: bold;">'+v.fileModeUser+' </span>';
                   hitoryItem +='<span style="font-weight: normal;"> 가  '+v.code2+'</span>';
                   hitoryItem +='</div>';
                   //수정내용 옵션
                   hitoryItem +='<div class="cloudModDetail">';
                   hitoryItem +='<span class="cloudModDate">'+v.fileModeDate+'</span>';
//                    hitoryItem +='<span class="clmodOption">수정자</span>';
                   hitoryItem +='</div></td></tr></table></div>';
               });
               $("#fileHistoryBox-Body").children("div").empty();
               $("#fileHistoryBox-Body").children("div").append(hitoryItem);
            }
            ,error : function(request, status, error){
                //console.log("활동이력 : "+error);
                //stopLoadingRefalsh();
            }
            ,dataType : 'json'
        });
}
//휴지통이동 대상 파일리스트
function moveGabegeFile(){//휴지통 이동할 파일 선택해 동작
    var uploadFileNoList = new Array();
    
    $.each($(".hiFileNo"),function(i,v){
        //console.log($(this).prop("checked"));
        if($(this).prop("checked")){
           uploadFileNoList.push($(v).closest("div").siblings("input[name=fileNo]").val());
        }
    });
    
   //console.log(uploadFileNoList.length)
    if(uploadFileNoList.length<1){//파일 선택 안됬을 때 리턴 false
        return false;
    }else{
        //console.log(uploadFileNoList);
        moveGavege(uploadFileNoList);     
    }
}
//휴지통이동 함수
function moveGavege(uploadFileNoList){
    var param = '';
    $.each(uploadFileNoList,function(i,v){
        if(i==0){               
            param += "fileNo="+v;
        }else{
            param += "&fileNo="+v;
        }
    });
    $.ajax({
        url   : 'fileMove0'
        ,type : 'POST'
        ,data : param
        ,beforeSend : function(){//전송직전 실행 false 면 전송취소
            //console.log('휴지통 이동 before');
            startLoadingRefalsh();
        }
        ,success : function(data, status){//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
           
            reflashFileList(null);//내 그룹 정보 새로고침
        }
        ,error : function(request, status, error){
            //console.log("휴지통 이동 : "+error);
            stopLoadingRefalsh();
        }
        ,dataType : 'json'
    });
}
//휴지통의 복원 대상 파일 리스트
function recoverGabegeFile(){//복원할 선택해 동작
    var uploadFileNoList = new Array();
    $.each($(".hiFileNo"),function(i,v){
        //console.log($(this).prop("checked"));
        if($(this).prop("checked")){
           uploadFileNoList.push($(v).closest("div").siblings("input[name=fileNo]").val());
        }
    });
   //console.log(uploadFileNoList.length)
    if(uploadFileNoList.length<1){//파일 선택 안됬을 때 리턴 false
        return false;
    }else{
        //console.log(uploadFileNoList);
        recoverGavege(uploadFileNoList);     
    }
}
//휴지통 복원
function recoverGavege(uploadFileNoList){
    var param = '';
    $.each(uploadFileNoList,function(i,v){
        if(i==0){               
            param += "fileNo="+v;
        }else{
            param += "&fileNo="+v;
        }
    });
    $.ajax({
        url   : 'fileMove1'
        ,type : 'POST'
        ,data : param
        ,beforeSend : function(){//전송직전 실행 false 면 전송취소
            //console.log('휴지통 이동 before');
            startLoadingRefalsh();
        }
        ,success : function(data, status){//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
           
            reflashFileList(4);//휴지통 리프레쉬
        }
        ,error : function(request, status, error){
            //console.log("휴지통 이동 : "+error);
            stopLoadingRefalsh();
        }
        ,dataType : 'json'
    });
}
// 파일개수 새로고침
function fileBoxReflasgAuto(){
	
	$.ajax({
		url : 'myDriverCount',
        type : 'post',
        dataType : 'json',
        beforeSend : function() {//전송직전 실행 false 면 전송취소
            //console.log("파일개수 갱신 진행");
            //loadingSendMessage();
        },
        success : function(data) {
            //console.log('파일개숭 갱신 finish');
            var mynum = data.myDriverCount;//내드라이브
            var ganum = data.myGabegeCount;//내휴지통

            console.log(mynum+","+ganum);
            
            if(mynum < 1){//새파일이 없는 경우
                $("span#myDriveFileCount").hide();
            }else{//새파일 카운트
                $("span#myDriveFileCount").text(mynum).show();
            }
            if(ganum < 1){//새파일이 없는 경우
                $("span#myGabegeFileCount").hide();
            }else{//새파일 카운트
                $("span#myGabegeFileCount").text(ganum).show();
            }
        },
	});
}
//파일 삭제
//파라미터 fileNo 여러개
//결과 휴지통 갱신
function deleteFileGOGO(){
    var deleteList = new Array(); 
	var param = "";
    $.each($(".hiFileNo"),function(i,v){
        //console.log($(this).prop("checked"));
        if($(this).prop("checked")){
            deleteList.push($(v).closest("div").siblings("input[name=fileNo]").val());
        }
    });
	
    $.each(deleteList,function(i,v){
    	//console.log("파일삭제 : "+v);
        if(i == 0){
        	param += "fileNo="+v;  
        }else{
        	param += "&fileNo="+v;
        }
    });
    if(param =="" ||param==null){
    	return false;
    }
    $.ajax({
		url : 'deleteMyFile',
        type : 'post',
        data : param,
        dataType : 'json',
        beforeSend : function() {//전송직전 실행 false 면 전송취소

        },
        success : function(data) {
        	//cosole.dir(data);
        	reflashFileList(4);controllDIR(2);
        },
        error : function() {
        	reflashFileList(4);controllDIR(2);
        }
	});
}

//내그룹(사원) 의 휴지통 조회
function myGavege(){
    reflashFileList(4);
}

//공유대상 갱신
//공유하기 탭 선택시 동작함
function gonYouLoadMemberList() {//공유대상자 : 사원정보 갱신 ,파라미터 유저 리스트
    
    $.ajax({
        url : 'message/reflashMemList',
        type : 'post',
        dataType : 'json',
        beforeSend : function() {//전송직전 실행 false 면 전송취소
            //console.log("사원갱신 진행");
            //loadingSendMessage();
        },
        success : function(data) {
            //console.log('사원갱신 finish');
            var memList = "";
            var memImage = "";
                $.each(data,function(i, v) {
                memList += "<option value='"+v.member_enum+"'>["
                        + v.dep_name
                        + "]"
                        + v.member_name
                        + "</option>"
                });

            $("#gongYouSelect2").empty();
            $("#gongYouSelect2").append(memList);
            $("#gongYouSelect2 ul.select2-selection__rendered").append(memImage);
            $(".select2").select2();
           // loadStopSendMessage();
            loadingGonYouStop();
        },
        error : function() {
          //  loadStopSendMessage();
        	 loadingGonYouStop();
        }
    });
}
//내 드라이브 지정
//내 드라이브 선택하면 경로정보를 hid 에 저장한다.
function contectMyDrive(){
	//경로 초기화	
	var tmp = $("input[name=dir]").val();
	if(tmp == 1){	
    	//정보저장
    	$("input[name=dir]").val(0);
    	$(".active.gabege").remove();
    	$(".breadcrumb li").removeClass("active");
    	$(".breadcrumb li:last-child").attr("class","active");
    	
    	$("#dirTitle").text("내드라이브");
    	$(".drive-group").show();
    	$(".gabege-group").hide();
    	$("#fileGongYouBtn").show();
	}
	//파일상세보기 초기화
    	fileInfoBoxClose();
}
//내 휴지통 지정
//내 휴지통 선택하면 경로정보를 hid 에 저장한다.
function contectMyGabege(){
  //경로 초기화
  var tmp = $("input[name=dir]").val();
    if(tmp == 0){   
      //정보저장
      $("input[name=dir]").val(1);
      $(".breadcrumb li").removeClass("active");
      $(".breadcrumb").append('<li class="active gabege">휴지통</li>')
      
      $("#dirTitle").text("휴지통");
      $(".drive-group").hide();
      $(".gabege-group").show();
      $("#fileGongYouBtn").hide();
    }
    //파일상세보기 초기화
      fileInfoBoxClose();
}
//공유하기 전송
//전송 data : 
function gongYouGoGO(){
	var param = "";
	var count = 0;
	//1.전송대상
    $("#gongYouSelect2 option:selected").each(function(i) {
    	if(i == 0){
    		param += "user=" + $(this).val();	
    	}else{    		
    		param += "&user=" + $(this).val();
    	}
        count++;
    });
    if(count == 0){
    	alert("전송대상을 1명이상 선택하세요.");
        return false;    	
    }
    //2.공유허용 옵션
    //boolean 을 반환한다.
    var downloadOption  = $("#gongYouOption1").is(":checked");
    var cloudSaveOption = $("#gongYouOption2").is(":checked");
    if(!downloadOption && !cloudSaveOption){
    	alert("공유허용 옵션을 1개이상 선택하세요.");
    	return false;
    }
    if(downloadOption){//파일 다운로드 허용
    	param += "&option=downloadOption"
    }
    if(cloudSaveOption){//클라우드에 저장허용
    	param += "&option=cloudSaveOption"
    }
    //3.파일번호
    var fileNo = $("#fileNo").text();
    if(fileNo =="" || fileNo == null){
    	alert("파일을 선택하세요.");
    	return false;
    }
    param += "&fileNo="+fileNo;
    $.ajax({
        url : 'sendGongYou',
        data : param,
        type : 'post',
        beforeSend : function() {//전송직전 실행 false 면 전송취소
        	loadingGonYouStart();
        },
        success : function() {
            console.log('메시전송 finish');
            loadingGonYouStop();
        },
        error : function() {
        	loadingGonYouStop();
            console.log('메시전송 finish');
        }
    });
}
//공유하기 전송 시작 오버레이
function loadingGonYouStart(){
	$("#fileGongYou .overlay").show();
}
//공유하기 전송 종료 오버레이
function loadingGonYouStop(){
    $("#fileGongYou .overlay").hide();
}
//전체취소
function allCancelFile(){
	$.each($("#cloudBg tbody.files div.btn.btn-warning.cancel"),function(i,v){
        $(v).trigger("click");
    });
}
//전체확인
function allDeleteFile(){
	$.each($("#cloudBg tbody.files div.btn.btn-danger.delete"),function(i,v){
		$(v).trigger("click");
	});
	
}
//전체전송
function allUploadFile(){
	$.each($("#cloudBg tbody.files div.btn.btn-primary.start"),function(i,v){
        $(v).trigger("click");
    });
}
//경로 콘트롤러
function controllDIR(num){
    if(num==1){//내드라이브
        contectMyDrive();
    }else if(num==2){//휴지통
        contectMyGabege();
    }
}

</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <input type="text" class="hide" name="dir" title="휴지통:내드라이브:공유문서함" value="0">
        <h1>
            클라우드 <small>Cloud</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="javascript:void(0);"><i class="fa fa-dashboard"></i> 클라우드</a></li>
            <li class="active"> 내드라이브 </li>
        </ol>
    </section>
    <!-- Content : 클라우드 -->
    <section class="content">
    <!-- 2.사이드바 -->  
        <div class="col-md-3">
            <div class="btn btn-primary btn-block margin-bottom" style="overflow-y: hidden ">파일 올리기
            </div>
            <div class="box box-solid">
            <div class="box-header with-border">
                <h3 class="box-title">그룹별</h3>
                <div class="box-tools">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li class="active" onclick="reflashFileList(null);controllDIR(1);"><a href="javascript:void(0);"><i class="fa fa-inbox"></i> 내 드라이브
                  <span id="myDriveFileCount" class="label label-primary pull-right">1</span></a>
                </li>
                <li onclick="reflashFileList(4);controllDIR(2);"><a href="javascript:void(0);"><i class="fa fa-trash-o"></i> 휴지통
                  <span id="myGabegeFileCount" class="label label-primary pull-right">1</span></a>
                </li>
              </ul>
            </div>
            <!-- /.box-body -->
            </div>
            <!-- /. box -->
            <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">타입별</h3>
            
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li onclick="reflashFileList(0);"><a href="javascript:void(0);"><i class="fa fa-circle-o text-red"></i> 문서</a></li>
                <li onclick="reflashFileList(2);"><a href="javascript:void(0);"><i class="fa fa-circle-o text-yellow"></i> 동영상</a></li>
                <li onclick="reflashFileList(3);"><a href="javascript:void(0);"><i class="fa fa-circle-o text-light-blue"></i> 음악</a></li>
                <li onclick="reflashFileList(1);"><a href="javascript:void(0);"><i class="fa fa-circle-o text-green"></i> 사진</a></li>
              </ul>
            </div>
            <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    <!-- 3.본문  -->
        <div class="col-md-9">
          <div class="box box-primary">
          <!-- 3.1.본문 해더 box-header -->
            <div class="box-header with-border">
              <h3 id="dirTitle" class="box-title">내드라이브</h3>
            </div>
            <!-- /.box-header -->
            <!-- 3.2.본문내용 box-body -->
            <div class="box-body no-padding mailbox-messages">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
                <!-- 내 드라이브 콘트롤 버튼 -->
                <div class="btn-group drive-group">
                  <button type="button" class="btn btn-default btn-sm cloud-upload"><i class="fa fa-cloud-download"></i></button>
                  <button type="button" class="btn btn-default btn-sm fileBoxModveGavege"><i class="fa fa-trash-o"></i></button>
                  <button type="button" class="btn btn-default btn-sm fileBoxReflashBtn"><i class="fa fa-refresh"></i></button>
                </div>
                <!-- /.btn-group -->
                <!-- 휴지통 콘트롤 버튼 -->
                <div class="btn-group gabege-group">
                  <button type="button" class="btn btn-default btn-sm fileBoxRecoverGOGO"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm fileBoxReflashBtn"><i class="fa fa-refresh"></i></button>
                  <button type="button" class="btn btn-default btn-sm fileBoxDeleteBtn"><i class="fa fa-trash-o"></i></button>
                </div>
                <!-- /.pull-right -->
              </div>
               <!-- /.box-header -->
              <div>
                  <div id="fileInfoBoxDIV" class="box-body ">
                    <table id="example2" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                      <th>선택</th>
                      <th>파일이름</th>
                      <th>용량</th>
                      <th>소유자</th>
                      <th>저장일</th>
                    </tr>
                    </thead>
                    <tbody id="fileBody">
                    <tr>
                      <td><div class="icheckbox_flat-blue checked" aria-checked="true" aria-disabled="false" style="position: relative;"><input type="checkbox" style="position: absolute; opacity: 0;"></div></td>
                      <!-- <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td> -->
                      <td class="mailbox-subject">파일이름</td>
                      <td class="mailbox-attachment">용량</td>
                      <td class="mailbox-name">소유자</td>
                      <td class="mailbox-date">저장일</td>
                    </tr>
    
                    </tbody>
                    <tfoot>
                    <tr>
                      <th>Rendering engine</th>
                      <th>Browser</th>
                      <th>Platform(s)</th>
                      <th>Engine version</th>
                      <th>CSS grade</th>
                    </tr>
                    </tfoot>
                    
                  </table>
                  <!-- Loading (remove the following to stop the loading)-->
                    <div id="cloudRelashLoading" class="overlay">
                        <i class="fa fa-refresh fa-spin"></i>
                    </div>
                  </div>
                  <!-- /.box-body -->
                  <div id="fileInfoBox">
                    <div>
                        <span class="hide">내 드라이브</span>
                    </div>
                    <div class="col-md-6">
                      <!-- Custom Tabs -->
                      <div class="nav-tabs-custom">
                      <!-- 해더 -->
                        <ul class="nav nav-tabs">
                          <li id="fileInfoBtn" class="active"><a href="#fileInfoBox-Body" data-toggle="tab">파일상세정보</a></li>
                          <li id="fileHistioryBtn" onclick="reflasgFileHistory();"><a href="#fileHistoryBox-Body" data-toggle="tab">활동이력</a></li>
                          <li id="fileGongYouBtn" onclick="gonYouLoadMemberList();"><a href="#fileGongYou" data-toggle="tab">공유하기</a></li>
                          <li ><div id="fileInfoBox-close" class="btn" onclick="fileInfoBoxClose();" >X  닫기</div></li>
                        </ul>
                      <!-- 본문  -->
                        <div class="tab-content">
                          <div class="tab-pane active " id="fileInfoBox-Body">
                            <table>
                                <tbody>
                                <tr><td colspan="2" ><span class="hide" id="fileNo"></span></td></tr>
                                <tr><td>유형</td><td id="fileType"></td></tr>
                                <tr><td>소유자</td><td id="fileUser"></td></tr>
                                <tr><td>수정한날짜</td><td id="fileModDate"></td></tr>
                                <tr><td>열어본날짜</td><td id="fileLeadDate"></td></tr>
                                <tr><td>만든날짜</td><td id="fileRegDate"></td></tr>
                                </tbody>
                            </table>
                          </div>
                          <!-- /.tab-pane -->
                          <div class="tab-pane" id="fileHistoryBox-Body">
                            <div style="overflow:scroll; width:350px; height:200px;">
                                <!-- 박스 -->
                                <div class="fileHistoryBox">
                                    <!-- 해더 -->    
                                    <table>
                                    <tr><td>
                                    <img alt="클라우드프로필사진" src="/sky/resources/images/profile/901022_profile.png" class="img-circle" style="height: 36px;width: 36px;">
                                    </td><td>
                                    <!-- 수정종류 -->
                                       <div style="color: #000;font-size: 13px;width: 238px;">
                                          <span style="font-weight: bold;">수정자</span>
                                          <span style="font-weight: normal;">수정내용</span>
                                       </div>
                                       <!-- 수정옵션 -->
                                       <div class="cloudModDetail">
                                           <span class="cloudModDate">
                                                                 날짜</span>
                                           <span class="clmodOption">
                                                                수정자</span>
                                       </div>
                                    </td>
                                    </tr>
                                    </table>
                               </div>
                            </div>
                          </div>
                          <!-- /.tab-pane -->
                          <div class="tab-pane" id="fileGongYou">
                             <div class="form-group">
                                <table>
                                <tr><td>
                                <label>옵션을 1개이상 선택하세요.</label>
                                </td></tr>
                                <tr><td>
                                <label for="gongYouOption2" class="hide"><input type="checkbox" id="gongYouOption2" name="gongYouOption2" title="공유옵션:클라우드에 저장허용">클라우드에 저장허용</label>
                                <label for="gongYouOption1" class="hide"><input type="checkbox" id="gongYouOption1" name="gongYouOption1" title="공유옵션:다운로드허용" checked="checked">다운로드 허용</label>
                                </td></tr>                               
                                </table>
                                <label>공유대상을 선택하세요.</label>
                                <button id="gongYouBtnGoGo" class="btn btn-default btn-sm" style="margin-left: 10px;">공유하기</button>
                                <select id="gongYouSelect2" class="form-control select2"
                                    multiple="multiple"
                                    data-placeholder="공유받는 사람"
                                    style="width: 100%;">
                                    <option>testMsg</option>
                                </select>
                            </div>
                            <div class="overlay">
                                <i class="fa fa-refresh fa-spin"></i>
                            </div>
                          </div>
                          <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                      </div>
                      <!-- nav-tabs-custom -->
                    </div>
                </div>
             </div>
           </div>            
              <!-- /.box-body -->
         </div>
            <!-- /. box -->
       </div>
    </section>
</div>



  

<!-- 팝업레이어 -->
<div id="cloudBg" class="" style="left: 248.414px;top: 107px;display: none;">
<%--     <form id="fileupload" action="${pageContext.request.contextPath}/cloud/fileUpload" method="POST" enctype="multipart/form-data"> --%>
        <div class="row fileupload-buttonbar">
            <div class="col-lg-12">
                <span class="btn btn-success fileinput-button"  style="position: relative;margin-bottom: 5px;overflow: hidden;display: inline-block;">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>파일추가</span>
                    <input id="cloudAddFiles" type="file" name="files" multiple="multiple" style="position: absolute;top: 0;right: 0;margin: 0;opacity: 0;-ms-filter: 'alpha(opacity=0)';font-size: 200px !important;direction: ltr;cursor: pointer;"   >
                </span>
                <div id="allUploadFile" class="btn btn-primary start" title="submit">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>전체전송</span>
                </div>
                <div id="allCancelFile" class="btn btn-warning cancel" title="reset">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>전체취소</span>
                </div>
                <div id="allDeleteFile" class="btn btn-danger delete" title="button">
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>전체확인</span>
                </div>
                            <!-- The global progress state -->
                <div class="progress progress-xxs">
                    <div id="fileuploadProgress" class="progress-bar progress-bar-warning"  style="width: 0%">
                    </div>
                </div>
            </div>

        </div>
        <!-- The table listing the files available for upload/download-->
        <table role="presentation" class="table table-striped">
            <tbody class="files">
            </tbody>
       </table>
</div>
<style>
@media (min-width: 1200px)
.col-lg-5, .col-lg-7 {
   float: none;
}
.bar {
    height: 18px;
    background: green;
}
.hide{display: none;}
#cloudBg{
    max-width: 530px;
    box-sizing: border-box;
    position: absolute;
    z-index: 1090;
    border-radius: 10px;
    padding: 6px;
    color: #f9f9f9;
    background: rgba(0, 0, 0, 0.8);
    border: solid 2px rgba(0, 0, 0, 0.9);
    font-weight: 600;
    font-size: 14px;
    text-align: center;
    overflow-x: hidden;
    overflow-y: auto;
    font-family: 'Source Sans Pro','Helvetica Neue',Helvetica,Arial,sans-serif;
    -webkit-font-smoothing: antialiased;
    line-height: 1.42857143;
}
.table.table-striped>tbody.files>tr:nth-of-type(odd) {
    background-color:rgba(47,43,217,0.9);
}
.table.table-striped>tbody.files>tr:nth-of-type(even) {
    background-color:rgba(58,43,217,0.3);
}
.fileHistoryBox{border-radius: 5px;background-color: #fff;border-bottom: 3px solid rgba(0,0,0,0.10);border-left: 1px solid rgba(0,0,0,0.10);border-right: 1px solid rgba(0,0,0,0.10);border-top: 1px solid rgba(0,0,0,0.10);margin: 0 0 6px 1px;padding: 16px;width: 286px;}
.cloudModDetail{color: #4a4a4a;font-size: 11px;font-weight: normal;padding-top: 6px;}
.cloudModDate{display: inline-block;vertical-align: top;}
.clmodOption {display: inline-block;vertical-align: top;max-width: 75px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
</style>
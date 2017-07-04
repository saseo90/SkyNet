<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Control Sidebar -->
<aside id="rigth" class="control-sidebar control-sidebar-dark">
	<!-- Create the tabs -->
	<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
		<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
				class="fa fa-home"></i></a></li>
		<li><a href="#control-sidebar-message-tab" data-toggle="tab"><i
				class="fa fa-gears"></i></a></li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
		<!-- Home tab content -->
		<div class="tab-pane" id="control-sidebar-home-tab">
			<h3 class="control-sidebar-heading">명함 리스트</h3>
			<div class="btn-group">
				<input type="button" class="btn btn-info" id="addbusiness"
					value="등록">
			</div>
			<ul class="control-sidebar-menu">
				<c:forEach var='vo' items="${businessCard}">
					<li><a> <i class="menu-icon fa fa-user bg-yellow"></i>
							<div class="pull-right box-tools">
								<button type="button" id="removeCard" name="${vo.business_seq}"
									class="btn btn-info btn-sm" data-widget="remove"
									data-toggle="tooltip" title="" data-original-title="Remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
							<div class="menu-info">
									<h4 class="control-sidebar-subheading">[${vo.business_Rank}]${vo.business_Name}</h4>
									<p>[${vo.business_Co}]</p>
									<p>${vo.business_Tel}</p>
								</div>
							</a></li>

                </c:forEach>


		      </ul>
            <!-- /.form-group -->
        </div>
        <!-- /.tab-pane -->
        <!-- 쪽지 확인탭 -->
        <div class="tab-pane" id="control-sidebar-message-tab">
            <h3 class="control-sidebar-heading">쪽지함</h3>
            <div class="form-group">
                <label class="control-sidebar-subheading">
                   그룹사 사원이라면 무료 쪽지를 사용할수 있습니다.
                </label>

                <p>35자 이내의 메시지를 작성해보세요.</p>
            </div>
            <div class="col-md-12">
                <!-- box -->
                <div class="box collapsed-box">
                    <div class="box-header">
                        <h3 class="box-title">
                            쪽지쓰기<br> <small><span
                                id="msgCont">0</span>/35자</small>
                        </h3>
                        <!-- tools box -->
                        <div class="pull-right box-tools">
                            <button type="button"
                                class="btn btn-default btn-sm"
                                data-widget="collapse"
                                data-toggle="tooltip" title="Collapse">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                        <!-- /. tools -->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body pad">
                        <form>
                            <div class="form-group">
                                <label>받는사람</label>
                                <button class="btn btn-default btn-sm"
                                    style="margin-left: 10px;">보내기</button>
                                <select class="form-control select2"
                                    multiple="multiple"
                                    data-placeholder="받는사람"
                                    style="width: 100%;">
                                    <option>testMsg</option>
                                </select>
                            </div>
                            <textarea id="msgSendBox"
                                placeholder="메시지를 작성하세요"
                                style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px; resize: none; wrap: hard;"
                                maxlength="35"></textarea>
                        </form>
                    </div>
                    <!-- Loading (remove the following to stop the loading)-->
                    <div class="overlay">
                        <i class="fa fa-refresh fa-spin"></i>
                    </div>
                    <!-- end loading -->
                </div>
                <!-- /.box -->
                <!-- box  메시지 헤더 클릭시 : 클래스 panel-collapse collapse 에 in 이 붙는다. -->
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">최근쪽지</h3>
                        <ul class="timeline">
                            <li><i class="fa fa-envelope bg-blue"></i>
                                <i class="fa fa-user bg-aqua"></i> <i
                                class="fa fa-comments bg-yellow"></i> <i
                                class="fa fa-clock-o"></i></li>
                        </ul>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <!-- The time line -->
                        <div class="slimScrollDiv">
                            <ul class="timeline" >

                            </ul>
                        </div>
                    </div>
                    <!-- Loading (remove the following to stop the loading)-->
                    <div class="overlay">
                        <i class="fa fa-refresh fa-spin"></i>
                    </div>
                    <!-- end loading -->
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.tab-pane -->
    </div>
</aside>
<div class="example-modal">
    <div class="modal" id="myModal5" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                        data-dismiss="modal" aria-label="Close"
                        onclick="disable()">
                        <span aria-hidden="true" onclick="disable()">&times;</span>
                    </button>
                    <h4 class="modal-title">명함등록</h4>
                </div>
                <div class="modal-body"
                    style="min-height: 300px; max-height: 763px;">
                    <form id="businessCard" action="post">
                        <div class="form-group">
                            <label>이름</label> <input type="text"
                                name="business_Name"
                                class="form-control"
                                placeholder="이름을 입력하세요">
                        </div>
                        <div class="form-group">
                            <label>회사</label> <input type="text"
                                name="business_Co" class="form-control"
                                placeholder="회사명을 입력하세요">
                        </div>
                        <div class="form-group">
                            <label>직급</label> <input type="text"
                                name="business_Rank"
                                class="form-control"
                                placeholder="직책을 입력하세요">
                        </div>
                        <div class="form-group">
                            <label>전화번호</label> <input type="text"
                                name="business_Tel" class="form-control"
                                placeholder="전화번호를 입력하세요">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input type="button" style="width: 25%"
                        onclick="createBusinessCard()"
                        id="createBusinessCard" class="btn btn-primary"
                        value="등록">
                    <button type="button" style="width: 25%"
                        class="btn btn-secondary" data-dismiss="modal"
                        onclick="disable()">닫기</button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>
</div>
<!-- /.Control Sidebar -->
<script type="text/javascript">
	$(function() {
		$(document).on("click", "#removeCard", function() {
			data = $(this).attr("name");
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/businesscard/remove",
				data : {
					"business_seq" : data
				},
				success : function(data) {
					if (data.state = "sucesse") {
						alert("삭제되었습니다");
						location.reload();
					}
				}
			});

		});

		$("#addbusiness").click(function() {
			$('#myModal5').modal();
		});
	});
	function createBusinessCard() {
		var data = $("#businessCard").serialize();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/businesscard/add",
			data : data,
			success : function(data) {
				if (data.state = "sucesse") {
					alert("등록되었습니다");
					location.reload();
				}
			}
		});
	}
</script>
<!--   <script src="http://code.jquery.com/jquery-latest.js"></script> -->
<!-- 메시지 관련  -->
<script type="text/javascript">
	$(function() {
		//초기화
		$(
				"div#control-sidebar-message-tab div.box-body.pad button.btn.btn-default.btn-sm")
				.prop("disabled", true);//메시지 발송 막음
		//     newMessageCount();//읽지 않은 쪽지 카운트 표시
		loadStopSendMessage();//오버레이 종료
		//맴머 리스트 활성화
		$(".select2").select2();
		//글자수 제한 키이벤트
		$("div#control-sidebar-message-tab textarea#msgSendBox")
				.keydown(
						function() {
							var numChar = $(this).val().length;
							var maxNum = 35;
							var charRemain = maxNum - numChar;
							$("span#msgCont").text(numChar);
							if (charRemain <= 0 || charRemain < 35) {
								$(
										"div#control-sidebar-message-tab div.box-body.pad button.btn.btn-default.btn-sm")
										.prop("disabled", false);
							} else {
								$(
										"div#control-sidebar-message-tab div.box-body.pad button.btn.btn-default.btn-sm")
										.prop("disabled", true);
							}
						});
		//메시지 전송
		$(
				"div#control-sidebar-message-tab div.box-body.pad button.btn.btn-default.btn-sm")
				.click(
						function() {
							var msg = 'msg=' + $("textarea#msgSendBox").val();
							var users = "";
							$(
									"div#control-sidebar-message-tab select.form-control.select2 option:selected")
									.each(function() {
										users += "&user=" + $(this).val();
									});
							var param = msg + users;
							$.ajax({
								url : 'message/sendMessage',
								data : param,
								type : 'post',
								beforeSend : function() {//전송직전 실행 false 면 전송취소
									if ($.trim(msg).length < 1) {//메시지 내용 있어야함
										return false;
									} else {
										loadingSendMessage();
									}
								},
								success : function() {
									console.log('메시전송 finish');
									reflashSendMessageBox();//메시지 발송 창 리셋
									loadStopSendMessage();
								},
								error : function() {
									loadStopSendMessage();
									console.log('메시전송 finish');
								}
							});
							return false;//새로고침 막기
							//{"gogo":"gogo","list":[{"msgReceiver":"admin","msgCont":"난 널 사랑해"},{"msgReceiver":"2","msgCont":"난 널 사랑해"}]}
						});
		//메시지 탭 선택시 동작
		$("ul.nav.nav-tabs.nav-justified.control-sidebar-tabs li:last").click(
				function() {
					selectAllMsg();//수신 메시지 갱신
					reflashSendMessageBox()//메세지 발송창 리셋
				});
		$(
				"div#control-sidebar-message-tab div.box-header div.pull-right.box-tools")
				.click(function() {
					loadMemberList(null);//1.발송목록 갱신 메시지 발송 대상 목록 갱신 맴버리스트
				});

	});
	function reflashSendMessageBox() {//메시지 발송 창 리셋
		//수신인 선택해제
		loadMemberList(null);
		//메시지 리셋
		$("textarea#msgSendBox").val("");
		//보내기버튼 해제
		$(
				"div#control-sidebar-message-tab div.box-body.pad button.btn.btn-default.btn-sm")
				.prop("disabled", true);
	}
	function loadMemberList(tmpUser) {//메시지 수신자 : 사원정보 갱신 ,파라미터 유저 리스트
		var userList = tmpUser;
		$.ajax({
					url : 'message/reflashMemList',
					type : 'post',
					dataType : 'json',
					beforeSend : function() {//전송직전 실행 false 면 전송취소
						//console.log("사원갱신 진행");
						loadingSendMessage();
					},
					success : function(data) {
						//console.log('사원갱신 finish');
						var memList = "";
						var memImage = "";
						if (userList == null || userList.length < 1) {
							$.each(data,function(i, v) {
							memList += "<option value='"+v.member_enum+"'>["
									+ v.dep_name
									+ "]"
									+ v.member_name
									+ "</option>"
						    });
						} else {
							$.each(data,function(i, v) {
							//유저리스트가 있는경유
							if ($.inArray(v.member_enum,
									userList) > -1) {
								memList += "<option value='"+v.member_enum+"' selected='selected'>["
										+ v.dep_name
										+ "]"
										+ v.member_name
										+ "</option>"
								memImage += "<li class='select2-selection__choice' title='["+v.member_enum+"]"+v.member_name+"'><span class='select2-selection__choice__remove' role='presentation'>×</span>["
										+ v.dep_name
										+ "]"
										+ v.member_name
										+ "</li>";
							} else {
								memList += "<option value='"+v.member_enum+"'>["
										+ v.dep_name
										+ "]"
										+ v.member_name
										+ "</option>"
							}
						});

						};
						$("div#control-sidebar-message-tab select.form-control.select2").empty();
						$("div#control-sidebar-message-tab select.form-control.select2").append(memList);
						$("div#control-sidebar-message-tab ul.select2-selection__rendered").append(memImage);
						$(".select2").select2();
						loadStopSendMessage();
					},
					error : function() {
						loadStopSendMessage();
					}
				});
	}
	function loadingSendMessage() {//쪽지 보내기 로딩 
		$("div#control-sidebar-message-tab div.col-md-12 div.box:first div.overlay").show();
		$("div#control-sidebar-message-tab div.box-body.pad button.btn.btn-default.btn-sm").prop("disabled", true);
	}
	function loadStopSendMessage() {//쪽지 보내기 종료
		$("div#control-sidebar-message-tab div.col-md-12 div.box:first div.overlay").hide();
	}
	function loadingSelectAllMsg() {//모든 메시지 조회 로딩
		$("div#control-sidebar-message-tab div.col-md-12 div.box.box-solid div.overlay").show();
	}
	function loadStopSelectAllMsg() {//모든 메세지 조회 종료
		$("div#control-sidebar-message-tab div.col-md-12 div.box.box-solid div.overlay").hide();
	}
	//메시지 알림창에서 삭제하기
    $('div#control-sidebar-message-tab ul.timeline').on("click","span.btn-bitbucket",function(){
      var msgNo = $(this).siblings("input").val();
      var flag  = deleteMsg(msgNo);//메시지 삭제함수 : 반환 true/false
      if(flag){
    	  selectAllMsg();
      }
   });
   //메시 알림창에서 읽기
    $('div#control-sidebar-message-tab ul.timeline').on("click","span.btn-linkedin",function(){
        var msgNo = $(this).siblings("input").val();
        var flag  = leadingMsg(msgNo);//메시지 읽기함수 : 반환 true/false
        if(flag){
        	selectAllMsg();
        }
    });
	function selectAllMsg() {//모든 메시지 조회
		$.ajax({
			url : 'message/allMyMessage',
			type : "post",
			dataType : 'json',
			beforeSend : function() {//전송직전 실행 false 면 전송취소
				console.log("모든 메시지 진행++");
				loadingSelectAllMsg();
			},
			progress : function() {

			},
			success : function(data) {
				var allMsg = '';
				var tmpYear = '';
				var tmpLI = '';
				var tmpNewMsgHeader = '';
				var tmpOldMsgHeader    = '';
				var tmpSaveMsgHeader   = '';
				//console.dir(":"+data)
				$.each(data,function(i, v) {
		            
                    console.log(v.msgRegDate);
                    //0.메일그룹 : 코멘트 
                    if (tmpLI != '' && tmpYear != v.msgRegDate) {
                        tmpSaveMsgHeader += '</div></div></div></div></div>';
                        tmpNewMsgHeader  += '</div></div></div></div></div>';
                        tmpOldMsgHeader  += '</div></div></div></div></div></li>';
                        tmpLI += tmpNewMsgHeader + tmpSaveMsgHeader +tmpOldMsgHeader;
                        allMsg += tmpLI;
                        tmpYear = '';
                        tmpLI = '';
                        tmpNewMsgHeader = '';
                        tmpOldMsgHeader    = '';
                        tmpSaveMsgHeader   = '';
                    }
                    
					if(tmpYear == ''){
						//수신일 초기화
						tmpYear = v.msgRegDate;
						//메시지 상태
// 			              if (v.msgState == 'Y') {//보관상태
	                            
// 	                        } else if (v.msgLeadDate == 'null') {//안읽음
	                            
// 	                        } else if (v.msgLeadDate != 'null') {//읽음
	                            
// 	                        }
						tmpLI  = '<li class="time-label"><span class="bg-red">' + v.msgRegDate + '</span></li>';
						tmpLI += '<li>';
						tmpNewMsgHeader += '<i class="fa fa-envelope bg-blue"></i>';
						tmpNewMsgHeader += '<div class="timeline-item"><div class="timeline-body"><div class="box-group" id="accordion"><div class="panel box box-danger">';
						tmpNewMsgHeader += '<div class="box-header with-border"><h4 class="box-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">';
						tmpNewMsgHeader += '새메시지 </a></h4>';
						tmpNewMsgHeader += '<div id="collapseOne" class="panel-collapse collapse">';
						
						tmpOldMsgHeader += '<i class="fa fa-envelope bg-maroon"></i>';
						tmpOldMsgHeader += '<div class="timeline-item"><div class="timeline-body"><div class="box-group" id="accordion"><div class="panel box box-success">';
						tmpOldMsgHeader += '<div class="box-header with-border"><h4 class="box-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">';
						tmpOldMsgHeader += '읽은 메시지 </a></h4>';
						tmpOldMsgHeader += '<div id="collapseOne" class="panel-collapse collapse">';
							
						tmpSaveMsgHeader += '<i class="fa fa-envelope bg-purple"></i>';
						tmpSaveMsgHeader += '<div class="timeline-item"><div class="timeline-body"><div class="box-group" id="accordion"><div class="panel box box-primary">';
						tmpSaveMsgHeader += '<div class="box-header with-border"><h4 class="box-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">';
					    tmpSaveMsgHeader += '보관 메시지 </a></h4>';
					    tmpSaveMsgHeader += '<div id="collapseOne" class="panel-collapse collapse">';
					    //div 5
					}
					//메시지 본문
					if (v.msgState == 'Y') {//보관상태
						tmpSaveMsgHeader +='<div class="box-body"><span class="time"><i class="fa fa-clock-o"></i>'+ v.time + '</span>';
						tmpSaveMsgHeader += '<h5 class="timeline-header no-border"><a href="javascript:void(0);">@'+ v.msgSender + '</a><br></h5>';
						tmpSaveMsgHeader += v.msgCont + '<br><p><span class="btn btn-social-icon btn-linkedin"><i class="fa fa-inbox"></i></span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn btn-social-icon btn-bitbucket"><i class="fa fa-bitbucket"></i></span><input type="hidden" value="'+v.msgNo+'"></p></div>';
                     } else if (v.msgLeadDate == 'null') {//안읽음
                    	tmpNewMsgHeader +='<div class="box-body"><span class="time"><i class="fa fa-clock-o"></i>'+ v.time + '</span>';
                    	tmpNewMsgHeader += '<h5 class="timeline-header no-border"><a href="javascript:void(0);">@'+ v.msgSender + '</a><br></h5>';
                    	tmpNewMsgHeader += v.msgCont + '</div>';
                     } else if (v.msgLeadDate != 'null') {//읽음
                    	tmpOldMsgHeader +='<div class="box-body"><span class="time"><i class="fa fa-clock-o"></i>'+ v.time + '</span>';
                    	tmpOldMsgHeader += '<h5 class="timeline-header no-border"><a href="javascript:void(0);">@'+ v.msgSender + '</a><br></h5>';
                        tmpOldMsgHeader += v.msgCont + '</div>';
                     }
				});
				 tmpSaveMsgHeader += '</div></div></div></div></div>';
                 tmpNewMsgHeader  += '</div></div></div></div></div>';
                 tmpOldMsgHeader  += '</div></div></div></div></div></li>';
                 tmpLI += tmpNewMsgHeader + tmpSaveMsgHeader +tmpOldMsgHeader;
                 allMsg += tmpLI;

				
				console.log('모든 메시지 finish+');
				$("div#control-sidebar-message-tab div.col-md-12 div.box.box-solid div.box-body ul.timeline").empty();
				$("div#control-sidebar-message-tab div.col-md-12 div.box.box-solid div.box-body ul.timeline").append(allMsg);
				loadStopSelectAllMsg();
			},
			error : function() {
				console.log('모든 메시지 error+');
				loadStopSelectAllMsg();
			}

		});
	}
	function leadingMsg(param) {//메시지 읽음 : 팔미터
		var msgNo = "msgNo="+param;
	console.log(msgNo);
		$.ajax({
			url : 'message/leadMessage',
			type : "post",
			data : msgNo,
			dataType : 'text',
			beforeSend : function() {//전송직전 실행 false 면 전송취소
				//console.log("읽음 처리진행+");
			},
			progress : function() {
			   
			},
			success : function(data) {
			  //console.log(data);
			  if(data>0){				  
			   return true;
			  }else{
			   return false;
			  }
			},
			error : function() {
				//loadStopSelectAllMsg();
			   return false;
			}
		});
	}
   function deleteMsg(param) {//삭제 처리
	   var msgNo = "msgNo="+param;
        $.ajax({
            url : 'message/deleteMessage',
            type : "post",
            data : msgNo,
            dataType : 'text',
            beforeSend : function() {//전송직전 실행 false 면 전송취소
                //console.log("삭제 처리진행+");
            },
            progress : function() {

            },
            success : function(data) {
            	//console.log(data);
        	 if(data>0){                  
              return true;
             }else{
              return false;
             }
            },
            error : function() {
            	return false;
            }
        });
    }
	function saveMsg(data) {//보관 처리
		var msgNo = "";
		$.ajax({
			url : 'message/saveMessage' + msgNo,
			type : "post",
			dataType : 'text',
			beforeSend : function() {//전송직전 실행 false 면 전송취소
				console.log("보관 처리진행+");

			},
			progress : function() {

			},
			success : function(data) {

			},
			error : function() {

			}
		});
	}
	function clearMsg(data) {//보관헤제 처리
		var msgNo = "";
		$.ajax({
			url : 'message/clearMessage' + msgNo,
			type : "post",
			dataType : 'text',
			beforeSend : function() {//전송직전 실행 false 면 전송취소
				console.log("보관 처리진행+");

			},
			progress : function() {

			},
			success : function(data) {

			},
			error : function() {

			}
		});
	}

</script>
<style>
div#control-sidebar-message-tab ul.timeline:before {
    left: 10px;
}

div#control-sidebar-message-tab ul.timeline>li>.fa {
    left: 0;
}

div#control-sidebar-message-tab ul.timeline>li>.timeline-item {
    margin-left: 30px;
    margin-right: 2px;
}

div#control-sidebar-message-tab ul.timeline>li>.timeline-item>.timeline-body
    {
    padding: 0;
}

div.box-header.with-border>ul.timeline>li>.fa {
    position: inherit;
}
</style>

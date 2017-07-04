<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="${pageContext.request.contextPath}/resources/webSocket/massageWebsocket.js"></script>
<!-- Main Header -->
<header class="main-header">
	<!-- Logo -->
	<a href="${pageContext.request.contextPath}" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>N</b>ET</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>Sky</b>NET</span>
	</a>

	<!-- Header Navbar -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<li id="alarmMsgBox" class="dropdown messages-menu">
					<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span
						class="label label-success">0</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 0 messages</li>
						<li>
							<!-- inner menu: contains the messages -->
							<ul class="menu">
								<li>
									<!-- start message --> <a href="#">
										<div class="pull-left">
											<!-- User Image -->
											<img
												src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg"
												class="img-circle" alt="User Image">
										</div> <!-- Message title and timestamp -->
										<h4>
											Support Team <small><i class="fa fa-clock-o"></i> 5
												mins</small>
										</h4> <!-- The message -->
										<p>Why not buy a new awesome theme?</p>
								</a>
								</li>
								<!-- end message -->
							</ul> <!-- /.menu -->
						</li>
						<li class="footer"><a href="javascript:void(0);">See All Messages</a></li>
					</ul>
				</li>
				<!-- /.messages-menu -->

				<!-- Notifications Menu -->
				<li id="alarmTongBox" class="dropdown notifications-menu">
					<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span id="alarmTongBoxLabel"
						class="label label-warning">0</span>
				</a>
					<ul class="dropdown-menu">
						<li id="alarmTongBoxCount" class="header">You have 0 notifications</li>
						<li>
							<!-- Inner Menu: contains the notifications -->
							<ul class="menu">
								<li>
									<!-- start notification --> <a href="#"> <i
										class="fa fa-users text-aqua"></i> 5 new members joined today
								</a>
								</li>
								<!-- end notification -->
							</ul>
						</li>
					</ul>
				</li>
				<!-- User Account Menu -->
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="${pageContext.request.contextPath}/resources/images/profile/${sessionScope.profileImg}"
						width="20" height="20" class="img-circle" alt="User Image">
						<span class="hidden-xs">${login.member_name}</span>
				</a>
					<ul class="dropdown-menu">
						<!-- The user image in the menu -->
						<li class="user-header"><img
							src="${pageContext.request.contextPath}/resources/images/profile/${sessionScope.profileImg}"
							class="img-circle" alt="User Image">
							<p>
								${login.member_enum }<br> ${login.member_name }
							</p></li>
						<!-- Menu Body -->
						<li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center">
									<a href="${pageContext.request.contextPath}/calendar/main">Calendar</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="${pageContext.request.contextPath}/member/list">Member</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="${pageContext.request.contextPath}/custom/menu">MenuEdit</a>
								</div>
							</div> <!-- /.row -->
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="${pageContext.request.contextPath}/checkPassword"
									class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="${pageContext.request.contextPath}/logout"
									class="btn btn-default btn-flat">Sign out</a>
							</div>
						</li>
					</ul></li>
				<!-- Control Sidebar Toggle Button -->
				<li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li>
			</ul>
		</div>
	</nav>
</header>
<script type="text/javascript">

	//새알림 횟수
	var alarmCountTmp = 0;
	$(function() {//DOM 생성후 동작함
//0.초기화 로드 후 사이드바 홈탭 포커스 적용 
$("aside.control-sidebar.control-sidebar-dark ul.nav.nav-tabs li:nth-child(2) a").trigger("click");
		//1.초기화
		//1.1.새메시지 카운트표시
		newMessageCount();
		//1.2.알림박스 정리
		$("li#alarmTongBox ul.menu").empty();
		var websocket;
		console.log('1111');
		var TIME_ID;
		//wsUri = "ws://192.168.201.39${pageContext.request.contextPath}/ws/echo/alarm";
		     wsUri = "ws://localhost${pageContext.request.contextPath}/ws/echo/alarm";
		//websocket = new SockJS(wsUri);
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(evt) {//서버연결되면 실행
			onOpen(evt);
		};
		websocket.onmessage = function(evt) {//서버에서 (알람)메시지 전달받으면 실행
			onMessage(evt);
		};
		websocket.onclose = function(evt) {//연결이 종료되면 실행
			onClose(evt);
		};
		websocket.onerror = function(evt) {//에러발생하면 실행
			onError(evt);
		};
		//매뉴바 선택 이벤트
		$("div.navbar-custom-menu ul.nav.navbar-nav").on("click","li.dropdown",function() {
    		if ($(this).attr("class") == "dropdown messages-menu") {//메시지 박스
    			console.log("매뉴박스");
    			reflashMessage();//열릴 때만 리프레쉬
    		} else if ($(this).attr("class") == "dropdown notifications-menu") {//알람박스     
    			clearInterval(TIME_ID);//알람종료
    			$("li#alarmTongBox span.label.label-warning")
    					.show();//
    		} else if ($(this).attr("class") == "dropdown tasks-menu") {//미정
    
    		}
    	});
		//메시지박스 풋터
		$("li#alarmMsgBox ul li.footer").click(function() {
			//사이드바 열기
            $("div#core>aside#rigth").attr("class","control-sidebar control-sidebar-dark control-sidebar-open");
            $("aside.control-sidebar.control-sidebar-dark ul.nav.nav-tabs.nav-justified.control-sidebar-tabs li:last-child a").trigger("click");
            $("div#control-sidebar-message-tab div.pull-right.box-tools div.box-header i").attr("class","fa fa-minus");
            $("div#control-sidebar-message-tab div.box-body.pad").show();
            loadMemberList(userList);//메시지 사이드바 정보갱신
		});
		function onOpen(evt) {//서버연결성공
			var msg = '{"code" : "1" , "receiver" : "${login.member_enum}" , "message" : ""}';
			websocket.send(msg);
		}
		;
		function onMessage(evt) {//(알람)메시지 수신 알람도착 콜백함수
			newMessageCount();//읽지 않은 쪽지 카운트 표시
			newAlaramReg(evt);//새 알람 등록
			clearInterval(TIME_ID);//이전 알람 취소
			TIME_ID = setInterval(changeImage, 1000);//새 알람 시작
		}
		;
		//알림 추가된 노티에 이벤트 등록함
		//알림 객체 선택시 해당 알림을 알림창에서 삭제함
		$("li#alarmTongBox ul.menu").on("click", "li.alarmNotiy", function() {
			$(this).remove();
			alarmCountTmp--;
			delAlaram();//알람확인
		});
		//메시지 알림창에서 삭제하기
		$('li#alarmMsgBox ul.menu').on("click", "span.btn-bitbucket",
				function() {
					var msgNo = $(this).siblings("input").val();
					var flag = deleteMsg(msgNo);//메시지 삭제함수 : 반환 true/false
					if (flag) {
						$(this).closeset("li").remove();
					}
				});
		//메시 알림창에서 읽기
		$('li#alarmMsgBox ul.menu').on("click", "span.btn-linkedin",
				function() {
					var msgNo = $(this).siblings("input").val();
					var flag = leadingMsg(msgNo);//메시지 읽기함수 : 반환 true/false
					if (flag) {
						$(this).closeset("li").remove();
					}
				});
		
		//공유된 파일 클라우드에 저장 버튼
		$("#alarmMsgBox").on("click",".cloudGongYouSave",function(){
			var fileNo = $(this).siblings('input[name="fileno"]').val();
			cloudGongYouSave(fileNo);
		});
		//공유된 파일 바로 다운로드 버튼
        $("#alarmMsgBox").on("click",".cloudGongYouDown",function(){
        	var fileNo = $(this).siblings('input[name="fileNo"]').val();
        	var cloudUser = $(this).siblings('input[name="cloudUser"]').val();
        	cloudGongYouDown(fileNo,cloudUser);
        });
	});
	function reflashMessage() {//읽지 않은 메시지 출력
		$
				.ajax({
					url : 'message/reflashMSG',
					type : 'POST',
					success : function(data, status) {//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
						//console.log("성공"+data+","+status);
						$(
								"div.navbar-custom-menu ul.nav.navbar-nav li.dropdown.messages-menu>a.dropdown-toggle>span.label-success")
								.text(data.length);

						var newMSG = '';
						$
								.each(
										data,
										function(i, v) {
											newMSG += '<li><a href="javascript:void(0);"><div class="pull-left">';
											newMSG += '<img src="/sky/resources/images/profile/'+v.senderProfile+'" class="img-circle" alt="User Image">'
											newMSG += '</div><h4>'
													+ v.msgSender
													+ '<small><i class="fa fa-clock-o"></i>'
													+ v.time
													+ '</small></h4><p>'
													+ v.msgCont + '</p>';
											newMSG += '<p>&nbsp;&nbsp;<span class="btn btn-social-icon btn-linkedin"><i class="fa fa-inbox"></i></span><label>메시지읽음&nbsp;&nbsp;</label>';
											newMSG += '<span class="btn btn-social-icon btn-bitbucket"><i class="fa fa-bitbucket"></i></span><label>메시지삭제</label>';
											newMSG += '<input type="hidden" value="'+v.msgNo+'"></p>';
											newMSG += '</a></li>';
										});
						$("li#alarmMsgBox ul.menu").empty();
						$("li#alarmMsgBox ul.menu").append(newMSG);

					},
					error : function(request, status, error) {
						console.log("메시지읽지않음 로드오류 : " + error);
					},
					dataType : 'json'
				});
	}
	function newMessageCount() {//읽지 않은 쪽지 카운트 
		$.ajax({
			url : 'message/myMsgCount',
			type : 'POST',
			success : function(data, status) {//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
				//console.log("성공"+data+","+status);
				var tmp = data.newMSG;
				if (tmp < 1) {//카운트 결과 1보다 작으면 0 으로 초기화
					tmp = 0;
				}
				$("li#alarmMsgBox span.label.label-success").text(tmp);
			},
			error : function(request, status, error) {
				//console.log("메시지카운드 로드오류 : " + error);
			},
			dataType : 'json'
		});
	}
	function newAlaramReg(msg) {//알람등록
		alarmCountTmp++;
		delAlaram();//알람확인
		var newMSG = '';
		newMSG += '<li class="alarmNotiy"><a href="javascript:void(0);"><i class="fa fa-users text-aqua"></i>'
				+ msg.data + '</a></li>';
		$("li#alarmTongBox ul.menu").append(newMSG);
	}
	function delAlaram(ㅐㅠㅓ) {//알람확인
		$("#alarmTongBoxLabel").text(alarmCountTmp);
	    if(alarmCountTmp>1){
	        $("#alarmTongBoxCount").text('새 알랍이 ' + alarmCountTmp + ' 개 있습니다.');
	    }else{
	        $("#alarmTongBoxCount").text('모든 알람을 확인했습니다.');
	    }
	}
	function changeImage() {//알림시 이미지 변경안림 반짝반짝
		$("li#alarmTongBox span.label.label-warning").toggle();
	}
	function onClose(evt) {//연결종료시 실행
	};
	function onError(evt) {//에러발생
	};
	function cloudGongYouSave(fileNo){//공유된 파일 내 클라우드에 저장
		var param = "fileNO="+fileNO;
		
		
	}
	function cloudGongYouDown(fileNo,cloudUser){//공유된 파일 바로 다운로드
		var param="fileNo="+fileNo+"&cloudUser="+cloudUser;
		window.location.href="${pageContext.request.contextPath}/cloud/gongyouFileDouwnload?"+param;
	}
</script>
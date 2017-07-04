<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- FLOT CHARTS -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/flot/jquery.flot.min.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 받는 사람 검색하기 !!
		$("#searchBtn")
				.click(
						function() {
							var location = "${pageContext.request.contextPath}/mail/search";
							window
									.open(location, 'window_name',
											'width=600,height=500,location=no,status=no,scrollbars=yes');
						});

	});
</script>

<style>
.detailBtn:link {
	color: #293818;
	text-decoration: none;
}

.detailBtn:visited {
	color: #293818;
	text-decoration: none;
}

.detailBtn:active {
	text-decoration: none;
}

.detailBtn:hover {
	color: #2F9D27;
	text-decoration: none;
}
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Skynet <small>Main Customized</small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-purple">
					<div class="inner">

						<h3>${memberCount}</h3>

						<p>사원수</p>
					</div>
					<div class="icon">
						<i class="ion ion-person"></i>
					</div>
					<a href="${pageContext.request.contextPath}/member/list"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>${reportWait}</sup>
						</h3>

						<p>처리중인 서류</p>
					</div>
					<div class="icon">
						<i class="fa fa-fw fa-folder-open"></i>
					</div>
					<a href="${pageContext.request.contextPath}/report/state"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>${reportEnd}</h3>

						<p>승인된 서류</p>
					</div>
					<div class="icon">
						<i class="fa fa-fw fa-folder-open"></i>
					</div>
					<a href="${pageContext.request.contextPath}/report/state"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>${reportBack}</h3>

						<p>반려된 서류</p>
					</div>
					<div class="icon">
						<i class="fa fa-fw fa-folder-open"></i>
					</div>
					<a href="${pageContext.request.contextPath}/report/state"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->
		<!-- Main row -->
		<div class="row">
			<!-- Left col -->
			<section class="col-lg-7 connectedSortable">
				<c:forEach var="vo" items="${mianHhtmlLeft}">
          ${vo.customCode}
          </c:forEach>
			</section>
			<!-- /.Left col -->
			<!-- right col (We are only adding the ID to make the widgets sortable)-->
			<section class="col-lg-5 connectedSortable">
				<c:forEach var="vo" items="${mianHhtmlRight}">
          ${vo.customCode}
          </c:forEach>
			</section>
			<!-- right col -->

		</div>
		<!-- /.row (main row) -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script type="text/javascript">
	$(function() {
		$(document)
				.on(
						"click",
						".day",
						function() {
							var date = $(".datepicker-switch").first().text()
									+ " " + $(this).text();
							$
									.ajax({
										type : "POST",
										url : '${pageContext.request.contextPath}/calender/daylist',
										data : {
											"date" : date
										},
										dataType : 'json',
										success : function(data) {
											var v = data.data;
											var htmlCode = '';
											var htmlCode1 = '<div class="col-sm-6">';
											var htmlCode2 = '<div class="col-sm-6">';
											$
													.each(
															v,
															function(index, val) {
																var formattedDate = new Date(
																		val.calendar_regdate);
																var d = formattedDate
																		.getDate();
																var m = formattedDate
																		.getMonth();
																m += 1; // JavaScript months are 0-11
																var y = formattedDate
																		.getFullYear();
																if (index % 2 == 0) {
																	htmlCode1 += '<div class="clearfix">';
																	htmlCode1 += '<span class="pull-left">'
																			+ val.calendar_title
																			+ '</span>';
																	htmlCode1 += '<small class="pull-right">등록일:'
																			+ y
																			+ "/"
																			+ m
																			+ "/"
																			+ d
																			+ '</small>';
																	htmlCode1 += '</div>';
																} else {
																	htmlCode2 += '<div class="clearfix">';
																	htmlCode2 += '<span class="pull-left">'
																			+ val.calendar_title
																			+ '</span>';
																	htmlCode2 += '<small class="pull-right">등록일:'
																			+ y
																			+ "/"
																			+ m
																			+ "/"
																			+ d
																			+ '</small>';
																	htmlCode2 += '</div>';
																}
															});
											htmlCode1 += "</div>";
											htmlCode2 += "</div>";
											htmlCode = htmlCode1 + htmlCode2;
											$("#calendars").html(htmlCode);

										},
										error : function(e) {
											alert(e.responseText);
										}
									});
						});
	});
	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "POST",
									url : '${pageContext.request.contextPath}/main/getdata',
									dataType : 'json',
									success : function(data) {
										var datas = data.data
										var htmlCode = '';
										if (data.state == "sucesse") {
											htmlCode = '<table class="table table-hover table-striped box-body" id="example2">';
											htmlCode = '<tbody><tr><th>Name</th><th>Phone</th><th>ID</th><th>rank</th><th>email</th></tr>';
											$
													.each(
															datas.member,
															function(index, val) {
																if (index < 5) {
																	htmlCode += '<tr>';
																	htmlCode += '<td><span class="text"><a href="${pageContext.request.contextPath}/member/detail/'+val.member_enum+'">'
																			+ val.member_name
																			+ '</a></span></td>';
																	htmlCode += '<td><span class="text">'
																			+ val.member_phone
																			+ '</span></td>';
																	htmlCode += '<td><span class="text">'
																			+ val.member_enum
																			+ '</span></td>';
																	htmlCode += '<td><span class="text">'
																			+ val.rank_name
																			+ '</span></td>';
																	htmlCode += '<td><span class="text">'
																			+ val.member_email
																			+ '</span></td>';
																	htmlCode += '</tr>';
																}
															});
											htmlCode += "</tbody></table>";
											$(".groupMemberResult").html(
													htmlCode);
											htmlCode = '<tbody><tr><th>내용</th><th>등록일</th></tr>';
											$
													.each(
															datas.memo,
															function(index, val) {
																if(index<10){
																htmlCode += '<tr>';
																htmlCode += '<td><span class="text"><a href="${pageContext.request.contextPath}/post/main">'
																		+ val.postCont
																		+ '</a></span></td>';
																htmlCode += '<td><span class="text">'
																		+ (new Date(
																				val.post_date))
																				.toISOString()
																				.slice(
																						0,
																						10)
																		+ '</span></td>';
																htmlCode += '</tr>';
																}
															});
											htmlCode += '</tbody>';
											$(".memoresult").html(htmlCode);
											htmlCode = '<tbody><tr><th>제목</th><th>작성일</th></tr>';
											$
													.each(
															datas.notice,
															function(index, val) {
																if (index < 5) {

																	htmlCode += '<tr>';
																	htmlCode += '<td><small class="label label-default">[';
																	htmlCode += val.notice_type;
																	htmlCode += ']</small>';
																	htmlCode += '<a href="${pageContext.request.contextPath}/notice/detail/';
																	htmlCode +=val.notice_num;
																	htmlCode +='">';
																	htmlCode += '<span class="text">';
																	htmlCode +=val.notice_title;
																	htmlCode +='</span>';
																	htmlCode += '</a>';
																	htmlCode += '</td>';
																	htmlCode += '<td>';
																	htmlCode += '<a href="${pageContext.request.contextPath}/notice/detail/';
																	htmlCode +=val.notice_num;
																	htmlCode +='">';
																	htmlCode += '<span class="text">';
																	htmlCode +=val.notice_date;
																	htmlCode +='</span>';
																	htmlCode += '</a>';
																	htmlCode += '</td>';
																	htmlCode += '</tr>';
																}
															});
											htmlCode += '</tbody>';
										$(".noticeresult").html(htmlCode)
											htmlCode = '';
											$
													.each(
															datas.suggest,
															function(index, val) {
																if (index < 5) {
																	htmlCode += '<div class="item">';
																	htmlCode += '<img src="${pageContext.request.contextPath}/resources/dist/img/user4-128x128.jpg" alt="user image" class="online">';
																	htmlCode += '<p class="message">';
																	htmlCode += '<a href="#" class="name">';
																	htmlCode += ' <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>'
																			+ (new Date(
																					val.sug_regdate))
																					.toISOString()
																					.slice(
																							0,
																							10)
																			+ '</small>';
																	htmlCode += val.sug_name;
																	htmlCode += '</a>';
																	htmlCode += '<b>'
																			+ val.sug_title
																			+ '</b>';
																	htmlCode += '</p>';
																	htmlCode += '<small class="text-muted">  </small>';
																	htmlCode += ' <div class="attachment">';
																	htmlCode += '<span>'
																			+ val.sug_cont
																			+ '</span>';
																	htmlCode += '<div class="pull-right">';
																	htmlCode += '<a href="${pageContext.request.contextPath}/suggest/detailSuggest/'+val.sug_num+'">[Detail]</a>';
																	htmlCode += '</div>';
																	htmlCode += ' </div>';
																	htmlCode += '</div>';
																}
															});
											$(".suggestresult").html(htmlCode);
											htmlCode = '<tbody><tr><th>설문제목</th><th>마감일</th></tr>';
											$
													.each(
															datas.survey,
															function(index, val) {
																htmlCode += "<tr><td><span class='text'><a href='${pageContext.request.contextPath}/survey/detail"+val.survey_num+"''>"
																		+ val.survey_title
																		+ "</a></span></td><td><span class='text'>"
																		+ val.survey_end
																		+ "</span></td></tr>"

															});
											htmlCode += "</tbody></table>";
											$("#surveyresult").html(htmlCode);
											htmlCode = '<tr><th></th><th>분류</th><th>제목</th><th>올린날짜</th><th>시청가능 날짜</th></tr>';
											$
													.each(
															datas.video,
															function(index, val) {
																if (index < 5) {
																	htmlCode += '  <tr id="vvid" title="자세히 보기">';
																	htmlCode += '<td><span class="text">'
																			+ val.bnum
																			+ '</span></td>';
																	htmlCode += '<td><span class="text">'
																			+ val.category
																			+ '</span></td>';
																	htmlCode += '<td><span class="text">'
																			+ val.title
																			+ '</span></td>';
																	htmlCode += '<td><span class="text">'
																			+ new Date(
																					val.reg_date)
																					.toISOString()
																					.slice(
																							0,
																							10)
																			+ '</span></td>';
																	if (val.start_date == null
																			&& val.end_date == null) {
																		htmlCode += '<td><span class="text">'
																				+ '기간제한 없음'
																				+ '</span></td>';
																		htmlCode += '</tr>';
																	} else {
																		htmlCode += '<td><span class="text">'
																				+ new Date(
																						val.start_date)
																						.toISOString()
																						.slice(
																								5,
																								10)
																				+ '  ~  '
																				+ new Date(
																						val.end_date)
																						.toISOString()
																						.slice(
																								5,
																								10)
																				+ '</span></td>';
																		htmlCode += '</tr>';
																	}
																}

															});
											$(".videoResult").html(htmlCode);
											$("#videotomain").html("<a href='${pageContext.request.contextPath}/videoTraining/main'>전체보기</a>");
											$("#totalcnt")
													.html(
															"전체 교육동영상  :  "
																	+ datas.videomap.TOTCNT);
											$("#mymv")
													.html(
															"내가 시청한 동영상  :  "
																	+ datas.videomap.MYMV);
											$("#mying")
													.html(
															"현재 시청중인 동영상  :  "
																	+ datas.videomap.MYING);
											$("#mynomv")
													.html(
															"내가 보지않은 동영상  :  "
																	+ datas.videomap.MYNOMV);
										}
									},
									error : function(e) {
										alert(e.responseText);
									}
								});
					});
</script>
<script type="text/javascript">
	$.ajax({
		url : 'cloud/myCloudCount',
		type : 'POST',
		success : function(data, status) {//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
			//console.log("성공"+data+","+status);
			cloudWeject(data.state, data.user, data.unuser);
		},
		error : function(request, status, error) {
			console.log("클라우드 위젯 로드오류 : " + error);
		},
		dataType : 'json'
	});
	$.ajax({
		url : 'message/myMsgCount',
		type : 'POST',
		success : function(data, status) {//[{MSGNO :"", MSGSENDER : "" , MSGCONT : "" , MSGREGDATE : ""}],[{}],[{}]
			//console.log("성공"+data+","+status);
			mesageWeject(data.newMSG, data.oldMSG, data.saveMSG);
		},
		error : function(request, status, error) {
			console.log("메시지 위젯 로드오류 : " + error);
		},
		dataType : 'json'
	});
	/*
	 * 클라우드위젯 DONUT CHART
	 * -----------
	 */
	function cloudWeject(state, user, unuser) {
		if (state == 0) {
			var donutData = [ {
				label : "클라우드 계정을 만드세요",
				data : 1,
				color : "#3c8dbc"
			} ];
		} else {
			var donutData = [ {
				label : "사용량",
				data : parseInt(user),
				color : "#4d8679"
			}, {
				label : "남은량",
				data : parseInt(unuser),
				color : "#63d2b9"
			} ];
		}

		$.plot("#cloud-donut-chart", donutData, {
			series : {
				pie : {
					show : true,
					radius : 1,
					innerRadius : 0.5,
					label : {
						show : true,
						radius : 2 / 3,
						formatter : cloudLabelFormatter,
						threshold : 0.1
					}

				}
			},
			legend : {
				show : false
			}
		});
	}
	/*
	 * 메시지위젯 DONUT CHART
	 * -----------
	 */
	function mesageWeject(newMSG, oldMSG, saveMSG) {
		var donutData = [];
		if (newMSG < 1 && oldMSG < 1 && saveMSG < 1) {
			donutData = [ {
				label : "쪽지함이 비었음",
				data : 1,
				color : "#3c8dbc"
			} ];
		} else {
			donutData = [ {
				label : "새쪽지",
				data : newMSG,
				color : "#3c8dbc"
			}, {
				label : "읽음",
				data : oldMSG,
				color : "#0073b7"
			}, {
				label : "보관중",
				data : saveMSG,
				color : "#00c0ef"
			} ];
		}
		$.plot("#message-donut-chart", donutData, {
			series : {
				pie : {
					show : true,
					radius : 1,
					innerRadius : 0.5,
					label : {
						show : true,
						radius : 2 / 3,
						formatter : msgLabelFormatter,
						threshold : 0.1
					}
				}
			},
			legend : {
				show : false
			}
		});
	}
	/*
	 * 메시지 및 클라우드 웨젯 라벨 생성함수 Custom Label formatter
	 * ----------------------
	 */
	function cloudLabelFormatter(label, series) {
		return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
				+ label
				+ '<span>( '
				+ series.data[0][1]
				+ ' MD)</span>'
				+ "<br>" + Math.round(series.percent) + "%</div>";
	}
	/*
	 * 메시지 및 클라우드 웨젯 라벨 생성함수 Custom Label formatter
	 * ----------------------
	 */
	function msgLabelFormatter(label, series) {
		return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
				+ label
				+ "<br><span>( "
				+ series.data[0][1]
				+ " 개)</span>"
				+ Math.round(series.percent) + "%</div>";
	}
</script>
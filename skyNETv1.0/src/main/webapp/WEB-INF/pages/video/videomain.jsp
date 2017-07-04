<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.video-link {
	padding-top: 70px;
}

.video-link a:hover, .video-link a:focus {
	outline: 0;
}

a .video-link-text {
	color: #3c8dbc;
	opacity: 0.8;
	-o-transition: all .3s;
	-moz-transition: all .3s;
	-webkit-transition: all .3s;
	-ms-transition: all .3s;
	transition: all .3s;
}

a:hover .video-link-text, a:focus .video-link-text {
	outline: 0;
	/*     color: #fff; */
	opacity: 1;
	border-bottom: 1px dotted #3c8dbc;
}

/***** Modal *****/
.modal-backdrop.in {
	filter: alpha(opacity = 7);
	opacity: 0.7;
}

.modal-content {
	background: none;
	border: 0;
	-moz-border-radius: 0;
	-webkit-border-radius: 0;
	border-radius: 0;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.modal-body {
	padding: 0 25px 25px 25px;
}

.modal-header {
	padding: 25px 25px 15px 25px;
	text-align: right;
}

.modal-header, .modal-footer {
	border: 0;
}

.modal-header .close {
	float: none;
	margin: 0;
	font-size: 36px;
	color: #fff;
	font-weight: 300;
	text-shadow: none;
	opacity: 1;
}

.no-padding {
	padding: 0 !important;
}

.box-footer {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	/*   border-top: 1px solid #f4f4f4; */
	padding: 10px;
	background-color: #fff;
}

.box-header {
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
	/*   border-top: 1px solid #f4f4f4; */
	padding: 10px;
	background-color: #fff;
}

.modalscroll {
	width: 41em;
	height: auto;
	line-height: 2em;
	/* border: 1px solid #ccc; */
	padding: 0;
	margin: 0;
	overflow: auto;
	overflow-x: hidden;
}

.jkfont {
	font-family: 'Source Sans Pro', sans-serif;
	font-weight: 300;
}

.sjk-disabled, .sjk-disabled[disabled] {
	opacity: .4;
	cursor: default !important;
	/*  pointer-events: none; */
}

.vul, .vli {
	list-style: none;
	display: inline-block;
}
/* ////////////////////////////////// */
.metro-box {
	float: left;
	width: 92%;
}

.text-box .metro-style-bg {
	background: #FFF
		url("http://note.baidu.com/statics/images/text-box.png?t=1476163679263")
		0 0 repeat-x;
}

.metro-box .outline {
	border: #dbdbdb 1px solid;
	padding: 5px;
	box-shadow: 0 0 3px #dbdbdb;
	position: relative;
}
</style>
<!-- <script src="https://content.jwplatform.com/libraries/V1BtuEAB.js"></script>
 -->
<script>
	$(function(){
		$('.launch-modal').on('click', function(e) {
			e.preventDefault();
			$('#' + $(this).data('modal-id')).modal({
				backdrop : 'static',
				keyboard : true
			});
			var videoSRC = $(this).attr("data-theVideo");
			var title = $(this).attr("data-title");
			var content = $(this).attr("data-content")
			var comcom = $(this).attr("data-complete");
			var watch = $(this).attr("data-watchvalue");
			//중요
			playSelected(videoSRC);
			src = videoSRC;
			//console.log(src);
			$("#hiddensrc").val(videoSRC);

			//src = $("#hiddensrc").val();
			$("#hiddencomplete").val(comcom);
			$("#hiddenwatch").val(watch);
			bnum = $(this).attr("data-bnum");

			$("#titleplace").text(title);
			$("#contentplace").html(content);
			$("#varbnum").val(bnum);
			/*   $("#modal-video iframe").attr("src",videoSRC);
			  $("#modal-video button.close").click(function(){
			  	 $("#modal-video iframe").attr('src',videoSRC);
			  }); */

		});
		
		$(".progressTable tr").each(function(i) {

			var progress = $(this).find("td").eq(5).text().trim();
			var progressArr = progress.split("(");

			var progressArr2 = progressArr[1];
			if (progressArr2 == undefined) {
				$("#pnum" + i).css("width", "");
			} else {

				var pro3 = progressArr2.substring(0, progressArr2.length - 1);
				$("#pnum" + i).css("width", pro3);
			}
			//var pro3 = progressArr2.substring(0,progressArr2.length-1);
			//var progressArr2 = progressArr[1].split(")");

			if (progress.substring(0, 4) == "시청완료") {
				$("#pnum" + i).removeClass("progress-bar-primary");
				$("#pnum" + i).addClass("progress-bar-success");
				$("#pnum" + i).css("width", "100%");

			}

		});

		var bnum = 0;

		$("#edit")
				.click(
						function() {

							location.href = "${pageContext.request.contextPath}/videoTraining/edit/"
									+ bnum;

						});

		$("#delete")
				.click(
						function() {

							location.href = "${pageContext.request.contextPath}/videoTraining/delete/"
									+ bnum;

						});
		
//  		$('[data-dismiss=modal]').on('click', function(e) {

//  			jwplayer().stop();

// 			jwplayer().removeButton("haltvideo");

//  			//jwplayer('myElement').remove();

//  		})
		
		
	});


</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">  
		<h1>  
			동영상 교육 <small>사원교육의 요람</small>
		</h1>
		<ol class="breadcrumb">
			<c:if test="${sessionScope.id eq 'admin'}">
				<li><a
					href="${pageContext.request.contextPath}/videoTraining/videoupload"
					style="font-size: 17px;"><i class="fa fa-dashboard"></i>업로드</a></li>
			</c:if>
		</ol>

	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-6" style="width: 100%;">
				<div class="box">
					<div class="box-header">

						<!--               <h3 class="box-title">Simple Full Width Table</h3> -->
						<div id="restartca">
							<select class="form-control select2 select2-hidden-accessible"
								style="width: 17%; margin-top: 10px;" tabindex="-1"
								aria-hidden="true" id="mainvideoselect2">
								<c:forEach items="${listcategory}" var="vv">

									<c:if test="${vv.typecategory eq selectedCategory }">
										<option value="${vv.typecategory}" selected="selected">
									</c:if>
									<c:if test="${vv.typecategory ne selectedCategory }">
										<option value="${vv.typecategory}">
									</c:if>

									<c:choose>
										<c:when test="${vv.typecategory =='없음'}">전체보기</c:when>
										<c:otherwise>${vv.typecategory}</c:otherwise>
									</c:choose>
									</option>
								</c:forEach>



							</select>
						</div>

						<!--   <div class="box-tools">
                <ul class="pagination pagination-sm no-margin pull-right">
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
              </div> -->
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<table id="example3" class="table progressTable">
							<thead>
								<tr>
									<th style="width: 4%;">#</th>
									<th style="width: 6%;">분류</th>
									<th style="width: 35%;">제목</th>
									<th style="width: 10%;">등록일</th>
									<th style="width: 20%;">시청가능 기간</th>
									<th style="width: 25%;">상태</th>
								</tr>
							</thead>
							<tbody>

								<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd"
									var="today" />

								<c:forEach var="vo" items="${list}" varStatus="status">
									<fmt:parseDate pattern="yyyy-MM-dd" var="start"
										value="${vo.start_date}" />
									<fmt:formatDate value="${start}" pattern="yyyy-MM-dd" var="st" />
									<fmt:parseDate pattern="yyyy-MM-dd" value="${vo.end_date}"
										var="end" />
									<fmt:formatDate value="${end}" pattern="yyyy-MM-dd" var="en" />


									<tr>
										<td>${vo.bnum}</td>
										<td>${vo.category}</td>
										<c:choose>
											<c:when test="${today > en and sessionScope.id ne 'admin'}">
												<td><a href="#" class="sjk-disabled preventA"
													disabled="disabled" title="기간이 지난 동영상입니다."> <span
														class="">${vo.title}&nbsp;&nbsp;&nbsp;</span><span><i
															class="fa fa-play-circle"></i></span></a></td>
											</c:when>

											<c:when test="${ st > today and sessionScope.id ne 'admin'}">

												<td><a href="#" class="sjk-disabled preventA"
													disabled="disabled" title="기간이 되지않은 동영상입니다."> <span
														class="">${vo.title}&nbsp;&nbsp;&nbsp;</span><span><i
															class="fa fa-play-circle"></i></span></a></td>

											</c:when>

											<c:when test="${ today > en and sessionScope.id eq 'admin' }">
												<td><a href="#" class="launch-modal preventA"
													title="기간이 지난 동영상입니다." data-modal-id="modal-video"
													data-bnum="${vo.bnum}" role="dialog" aria-hidden="true"
													data-backdrop="static" data-keyboard="false" id="givemeSrc"
													data-theVideo="${pageContext.request.contextPath}/videosave/${vo.vinfo.oriname}"
													data-watchvalue="${vo.connectvideo.watchinfo}"
													data-complete="${vo.connectvideo.complete}"
													data-title="${vo.title}" data-content="${vo.content}">
														<span class="video-link-text">${vo.title}&nbsp;&nbsp;&nbsp;</span><span><i
															class="fa fa-play-circle"></i></span>&nbsp;&nbsp;[기간만료]
												</a></td>
											</c:when>

											<c:when test="${ st > today and sessionScope.id eq 'admin'}">

												<td><a href="#" class="launch-modal preventA"
													title="기간이 되지않은 동영상입니다." data-modal-id="modal-video"
													data-bnum="${vo.bnum}" role="dialog" aria-hidden="true"
													data-backdrop="static" data-keyboard="false" id="givemeSrc"
													data-theVideo="${pageContext.request.contextPath}/videosave/${vo.vinfo.oriname}"
													data-watchvalue="${vo.connectvideo.watchinfo}"
													data-complete="${vo.connectvideo.complete}"
													data-title="${vo.title}" data-content="${vo.content}">
														<span class="video-link-text">${vo.title}&nbsp;&nbsp;&nbsp;</span><span><i
															class="fa fa-play-circle"></i></span>&nbsp;&nbsp;[대기]
												</a></td>

											</c:when>

											<c:otherwise>

												<td><a href="#" class="launch-modal preventA"
													data-modal-id="modal-video" data-bnum="${vo.bnum}"
													role="dialog" aria-hidden="true" data-backdrop="static"
													data-keyboard="false" id="givemeSrc"
													data-theVideo="${pageContext.request.contextPath}/videosave/${vo.vinfo.oriname}"
													data-watchvalue="${vo.connectvideo.watchinfo}"
													data-complete="${vo.connectvideo.complete}"
													data-title="${vo.title}" data-content="${vo.content}">
														<span class="video-link-text">${vo.title}&nbsp;&nbsp;&nbsp;</span><span><i
															class="fa fa-play-circle"></i></span>
												</a></td>

											</c:otherwise>



										</c:choose>



										<td><fmt:parseDate pattern="yyyy-MM-dd" var="reg"
												value="${vo.reg_date}" />
											<fmt:formatDate value="${reg}" pattern="yyyy-MM-dd" /></td>
										<td style="font: bold;">${st}<c:if
												test="${vo.start_date eq null && vo.end_date eq null}">
            기간 제한 없음
            </c:if> <c:if
												test="${vo.start_date ne null && vo.end_date ne null }">
             ~
            </c:if> ${en} <!-- 날짜 변환할 땐 fmt태그 사용.  -->
										</td>
										<td><c:if test="${vo.connectvideo.complete eq null}">시청 전</c:if>
											${vo.connectvideo.complete}
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-primary"
													id="pnum${status.count}"></div>
											</div></td>





									</tr>

								</c:forEach>
							</tbody>
							<!-- 
                  <tr>
                  <td>1.</td>
                  <td>Update software</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>Clean database</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td>Cron job running</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-light-blue">30%</span></td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td>Fix and squish bugs</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">90%</span></td>
                </tr>   -->

						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->


				<form style="display: hidden"
					action="${pageContext.request.contextPath}/videoTraining/videocomplete"
					method="POST" id="completeform">
					<input type="hidden" id="varbnum" name="varbnum" value="" /> <input
						type="hidden" id="varwatch" name="varwatch" value="" /> <input
						type="hidden" id="vartotallength" name="vartotallength" value="" />
				</form>




			</div>
		</div>
	</section>
	<!-- /.content -->
	<%--    세션값 :  <c:if test="${sessionScope.id == 'admin' }">관리자접속${sessionScope.id }</c:if> --%>
	<%--   		 <c:if test="${sessionScope.id != 'admin' }">사용자접속${sessionScope.id }</c:if>  --%>



</div>
<!-- /.content-wrapper -->








<!-- MODAL -->
<div class="modal fade" id="modal-video" tabindex="-1" role="dialog"
	data-keyboard="false" aria-labelledby="modal-video-label">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<!--             	  <h4 class="modal-title"><span>라벨 만들기</span></h4> -->
				<input id="hiddencomplete" type="hidden" value=""> <input
					id="hiddenwatch" type="hidden" value=""> <input
					id="hiddensrc" type="hidden" value="">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>

			<div class="modal-body">
				<div class="box-header no-padding"
					style="margin: 0px; background-color: #ecf0f5;">
					<ul class="" style="list-style: none;" id="">



						<li><strong>강의 명 : </strong><span id="titleplace" class="jkfont"> 

						</span><c:if
									test="${sessionScope.id eq 'admin'}">
									<button type="button" id="delete"
										class="btn bg-maroon btn-xs btn-flat pull-right">삭제하기</button>
									<button type="button" id="edit"
										class="btn btn-success btn-xs btn-flat pull-right">수정하기</button>
								</c:if></li>


					</ul>


				</div>
				<div class="modal-video">
					<div class="embed-responsive embed-responsive-16by9">
						<!-- <iframe class="embed-responsive-item" src=""
                                webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> -->
						<div id="myElement"></div>
					</div>
				</div>
				<!--                 <div style="margin-bottom: 30px; clear: both;"> -->
				<div class="box-footer no-padding"
					style="margin-top: 0px; background-color: #ecf0f5;">
					
				
					
					<ul style="list-style: none;" id="">
							<div data-order="0"
		class="metro-box u-drag-content text-box">
		<div class="metro-style-bg">
			<div class="outline">
				<em class="checkbox"><i class="icon"></i></em>

				<div class="content" id="contentplace"></div>

			</div>
			
		</div>
	</div>
						
<!-- 						<li><span id="contentplace" class="jkfont"></span></li> -->


					</ul>  


				</div>


			</div>

		</div>
	</div>
</div>
<script>

	//var src = document.getElementById('givemeSrc').getAttribute('data-theVideo');
	var src = "";
	//var src = document.getElementById('hiddensrc').value;

	var watchvar = 0;
	//document.getElementById('givemeSrc').getAttribute('data-watchvalue');
	var completecheck = "";
	//var completecheck =  document.getElementById('givemeSrc').getAttribute('data-complete');

	//document.getElementById('hiddencomplete').value= completecheck; 

	jwplayer('myElement').on('ready', function() {

		//var src =  "/sky/videosave/SampleVideo_720x480_1mb.mp4";
	});

	function playSelected(fileURL) {

		jwplayer('myElement')
				.setup(
						{
							// URL to the video file
							file : fileURL,
							// URL to the image that should be shown before the video is started
							image : '${pageContext.request.contextPath}/resources/images/skynet.png',
							title : 'Sample 20mb',
							width : '100%',
							aspectratio : '16:9',
							stretching : 'fill',
							mediaid : 'GJIM5cbk'

						});

		jwplayer().on('beforePlay', function() {

			completecheck = document.getElementById('hiddencomplete').value;
			//console.log(completecheck); 
			// src = document.getElementById('hiddensrc').value;

			watchvar = document.getElementById('hiddenwatch').value;

		});

		function sweetalert() {

			swal({
				title : "계속 재생하기",
				text : "체크하시면 계속 진행됩니다!",
				type : "success"
			}, function() {
				jwplayer().pause();//다시 실행

			});

		}

		function sweetalert2() {

			swal({
				title : "계속 재생하기",
				text : "체크하시면 계속 진행됩니다!",
				type : "success"
			}, function() {

				jwplayer().pause();//다시 실행

				jwplayer().setFullscreen(true);

			});

		}

		var resulttime = new Array();
		var totallength = 0;
		var hasbeenpaused = new Array(false, false, false, false, false);

		//특정위치에서 재생
		jwplayer('myElement')
				.on(
						'firstFrame',
						function() {

							totallength = Math.floor(jwplayer('myElement')
									.getDuration());

							resulttime[0] = Math.floor(Math.random()
									* totallength) + 1;
							resulttime[1] = Math.floor(Math.random()
									* totallength) + 1;
							resulttime[2] = Math.floor(Math.random()
									* totallength) + 1;
							resulttime[3] = Math.floor(Math.random()
									* totallength) + 1;
							resulttime[4] = Math.floor(Math.random()
									* totallength) + 1;

							jwplayer('myElement').seek(watchvar);

							var maxPlayPosition = 0;
							var seeking = false;
							if (completecheck != "시청완료") {
								jwplayer()
										.onTime(
												function(event) {

													if (!seeking)
														maxPlayPosition = Math
																.max(
																		event.position,
																		maxPlayPosition)

													var time = Math
															.floor(event.position);

													if (totallength > 3600) {
														//5번
														for (var int = 0; int < 5; int++) {

															if (time == resulttime[int]
																	&& hasbeenpaused[int] == false) {

																jwplayer()
																		.pause();

																if (jwplayer()
																		.getFullscreen()) {
																	jwplayer()
																			.setFullscreen(
																					false)
																	sweetalert2()
																} else {
																	sweetalert();
																}

																hasbeenpaused[int] = true;
															}

														}

													} else if (totallength > 1800) {
														//4번
														for (var int2 = 0; int2 < 4; int2++) {
															if (time == resulttime[int2]
																	&& hasbeenpaused[int2] == false) {

																jwplayer()
																		.pause();

																if (jwplayer()
																		.getFullscreen()) {
																	jwplayer()
																			.setFullscreen(
																					false)
																	sweetalert2()
																} else {
																	sweetalert();
																}

																hasbeenpaused[int2] = true;
															}
														}

													} else if (totallength > 600) {
														//3번
														for (var int3 = 0; int3 < 3; int3++) {
															if (time == resulttime[int3]
																	&& hasbeenpaused[int3] == false) {

																jwplayer()
																		.pause();

																if (jwplayer()
																		.getFullscreen()) {
																	jwplayer()
																			.setFullscreen(
																					false)
																	sweetalert2()
																} else {
																	sweetalert();
																}

																hasbeenpaused[int3] = true;
															}
														}

													} else {
														//2번
														for (var int4 = 0; int4 < 2; int4++) {
															if (time == resulttime[int4]
																	&& hasbeenpaused[int4] == false) {

																jwplayer()
																		.pause();

																if (jwplayer()
																		.getFullscreen()) {
																	jwplayer()
																			.setFullscreen(
																					false)
																	sweetalert2()
																} else {
																	sweetalert();
																}

																hasbeenpaused[int4] = true;
															}
														}

													}

													jwplayer()
															.addButton(
																	"//icons.jwplayer.com/icons/white/download.svg",

																	"시청기록 저장하고 나가기",

																	function() {

																		var wi = Math
																				.floor(jwplayer()
																						.getPosition());

																		document
																				.getElementById('varwatch').value = wi;

																		document
																				.getElementById('vartotallength').value = totallength;

																		document
																				.getElementById('completeform').action = "${pageContext.request.contextPath}/videoTraining/halt";

																		document
																				.getElementById(
																						'completeform')
																				.submit();
																	},

																	"haltvideo"

															);

												})
										.onPlaylistItem(function() {
											maxPlayPosition = 0
										})
										.onSeek(
												function(event) {

													if (!seeking) {
														if (event.offset > maxPlayPosition) {
															seeking = true;
															setTimeout(
																	function() {
																		jwplayer()
																				.seek(
																						maxPlayPosition)
																	}, 100)
														}
													} else
														seeking = false

												});
							}

						});

		/* if(jwplayer().getState()!="playing"){
		  jwplayer().pause();
		} */
		//alert(jwplayer().getState());
		//jwplayer().play();

		//jwplayer().pause(true);

		/*  jwplayer('myElement').seek(10).onTime(function (event) {
		 if(event.position >= 17 ) {
		 this.stop();
		 }
		 });  */

		jwplayer('myElement').on('complete', function() {

			swal({
				title : "동영상 시청이 완료되었습니다!"
			}, function() {

				document.getElementById('completeform').submit();
			});

			//location.href = "${pageContext.request.contextPath}/complete";

		});

		/*
		 jwplayer('myElement').on('time',function(){
		
		 alert("종료");
		 }); */

		/* alert(jwplayer('myElement').seek(jwplayer('myElement').getPosition()-30)); */
		//jwplayer('myElement').getDuration()
	}
	$(function() {
// 		$(".preventA").click(function(e) {
// 			e.preventDefault();
// 		});

		$('#example3').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"pageLength" : 10,
			"searching" : true,
			"ordering" : false,
			"info" : false,
			"autoWidth" : true
		});

		//var progress = $(".progressTable").children(":last-child").text();
		//alert(progress);

		
		

// 		$('.launch-modal').on('click', function(e) {
// 			e.preventDefault();
// 			$('#' + $(this).data('modal-id')).modal({
// 				backdrop : 'static',
// 				keyboard : true
// 			});
// 			var videoSRC = $(this).attr("data-theVideo");
// 			var title = $(this).attr("data-title");
// 			var content = $(this).attr("data-content")
// 			var comcom = $(this).attr("data-complete");
// 			var watch = $(this).attr("data-watchvalue");
// 			//중요
// 			playSelected(videoSRC);
// 			src = videoSRC;
// 			//console.log(src);
// 			$("#hiddensrc").val(videoSRC);

// 			//src = $("#hiddensrc").val();
// 			$("#hiddencomplete").val(comcom);
// 			$("#hiddenwatch").val(watch);
// 			bnum = $(this).attr("data-bnum");

// 			$("#titleplace").append(title);
// 			$("#contentplace").html(content);
// 			$("#varbnum").val(bnum);
// 			/*   $("#modal-video iframe").attr("src",videoSRC);
// 			  $("#modal-video button.close").click(function(){
// 			  	 $("#modal-video iframe").attr('src',videoSRC);
// 			  }); */

// 		});

// 		var bnum = 0;

// 		$("#edit")
// 				.click(
// 						function() {

// 							location.href = "${pageContext.request.contextPath}/videoTraining/edit/"
// 									+ bnum;

// 						});

// 		$("#delete")
// 				.click(
// 						function() {

// 							location.href = "${pageContext.request.contextPath}/videoTraining/delete/"
// 									+ bnum;

// 						});

		$('[data-dismiss=modal]').on('click', function(e) {

			jwplayer().stop();

			jwplayer().removeButton("haltvideo");

			//jwplayer('myElement').remove();

		})

		/* $('#modal-video').on('show.bs.modal', function(e) {
			
			 var mycomplete = $(e.relatedTarget).data('complete');
			    		    
			    //populate the textbox
			    $(e.currentTarget).find('#hiddencomplete').val(mycomplete);
			var comvalue = $("#hiddencomplete").val();
			//alert(comvalue);
		}); */

		$("#mainvideoselect2")
				.change(
						function() {

							var categoryName = $(
									'#mainvideoselect2 option:selected').val();

							if (categoryName == "없음") {
								location.href = "${pageContext.request.contextPath}/videoTraining/main";
							} else {
								location.href = "${pageContext.request.contextPath}/videoTraining/selectbytype/"
										+ categoryName;

							}

							//$(".select2").select2();

						});

		//$(".select2").select2();

	});
</script>







<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <style>
 .emitting {
overflow:hidden;
text-overflow:ellipsis;


}
 
 
 
	.badge2 {
	    display: inline-block;
	    min-width: 10px;
	    padding: 3px 7px;
	    font-size: 12px;
	    font-weight: 700;
	    line-height: 1;
	    color: #fff;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: baseline;
	    background-color: #777;
	   	margin-right: 8px;
	   	border-radius: 3px;
	   	border:none;
	}
	.inl-bl{
		display : inline-block;	
	}
	.colorInfo {
	    margin-top: 88px;
	    width: 90px;
	    height: 90px;
	    background-color: #fff; 
	    margin-right: 40px;
	    margin-bottom: 42px;
	    float: right!important;
	    border: 2px solid #dcdcdc;
	}			
	.colorpicker-2x .colorpicker-saturation {
        width: 200px;
        height: 200px;
    }
    .colorpicker-2x .colorpicker-hue,
    .colorpicker-2x .colorpicker-alpha {
        width: 30px;
        height: 200px;
    }
    .colorpicker-2x .colorpicker-color,
    .colorpicker-2x .colorpicker-color div {
        height: 30px;
    }
</style> 
<script>
var labelSideNumber = 0;
	$(function(){
	// 	-----------
		$("#useless").click(function(e){
			e.preventDefault();
		}); 
	// 	-----------
		$("#useless2").click(function(e){
			e.preventDefault();
		}); 
	// 	-----------
		  $('#cp11').colorpicker(
			 { customClass: 'colorpicker-2x',
	          sliders: {
	              saturation: {
	                  maxLeft: 200,
	                  maxTop: 200
	              },
	              hue: {
	                  maxTop: 200
	              },
	              alpha: {
	                  maxTop: 200
	              }
	          }
		  }); 
		/*    $('[data-dismiss=modal],#createLabel').on('click', function (e) {
				$(".disableLabel").attr("disabled",true);
				$(".disableLabel").removeClass("checked");
				var $t = $(this),
			        target = $t[0].href || $t.data("target") || $t.parents('.modal') || [];

			  $(target)
			    .find("input,textarea,select")
			       .val('')
			       .end()
			    .find("input[type=checkbox], input[type=radio]")
			       .prop("checked", "")
			       .end();
			  
			})  */
		 
	
		  $('#myModal2').on('show.bs.modal', function(e) {

			    //get data-id attribute of the clicked element
			    var mylabelnum = $(e.relatedTarget).data('num2');
			    
			    //populate the textbox
			    //$(e.currentTarget).find('.modal-body #labelnumSide').val(mylabelnum);
			    labelSideNumber = mylabelnum;
			});
		$("#colorChange").click(function(){
			var colorValue = $("#colorValue").val();
			
		
			$.ajax({
							
				'url' : '${pageContext.request.contextPath}/label/modifylabel2',
				'type' : 'post',
				'data' : {'label_color' : colorValue,'label_num' : labelSideNumber },
				'success' : function(data){
								
					//reLoad();
					window.location=location.pathname;
				},
				
				'dataType' : 'json'
						
			})
			
			$(this).attr("data-dismiss","modal");
			
			
			
			
			
			
		});
	
	});
</script>
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}/resources/images/profile/${sessionScope.profileImg}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${login.member_name}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      
<!--       검색창  -->
      <!-- search form -->
<!--       <form action="#" method="get" class="sidebar-form"> -->
<!--         <div class="input-group"> -->
<!--           <input type="text" name="q" class="form-control" placeholder="Search..."> -->
<!--               <span class="input-group-btn"> -->
<!--                 <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> --> 
<!--                  </button> --> 
<!--               </span> -->
<!--         </div> -->
<!--       </form> -->


      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
      
        <li class="header">MAIN NAVIGATION</li>
        <!-- 커스터 마이징 메뉴할때 테이블에 아무것도 없으면 모든 메뉴 보여준다. -->
<!--         사원등록 -->
        <c:if test="${login.member_enum eq 'admin'}">
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/memberJoinForm">
            <i class="fa  fa-plus-square-o"></i>
            <span>사원 등록</span>
          </a>
        </li>
        </c:if>
                    
         <c:if test="${empty sessionScope.custommenu}">
<!--           사원프로필 -->
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/checkPassword">
            <i class="fa fa-check-square-o"></i>
            <span>내 정보 관리</span>
          </a>
          
          
<%--         <li><a href='${pageContext.request.contextPath}/inout/list'><i class='fa fa-calendar'></i><span>근태관리</span><small class='label pull-right bg-gray'>check</small></a></li> --%>
<!-- 근태관리 -->
        <li>
          <a href='${pageContext.request.contextPath}/inout/list'>
            <i class="fa fa-calendar"></i> <span>근태관리</span>
          </a>
        </li>
        
          
          <%-- <li class='treeview'><a href='/sky/checkPassword'><i class='fa fa-check-square-o'></i><span>내 정보 관리</span></a> --%>
<!--         사원목록 -->
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/member/list">
            <i class="fa fa-files-o"></i>
            <span>사원 주소록</span>
          </a>
          
          
          <%-- <li class='treeview'><a href='/sky/member/list'><i class='fa fa-files-o'></i><span>사원 주소록</span></a></li> --%>          
        
<!--         게시판 -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit"></i>
            <span>게시판</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/notice/list"><i class="fa fa-circle-o"></i> 공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/suggest/suggestList"><i class="fa fa-circle-o"></i> 건의사항</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/survey/surveyList">
            <i class="fa fa-files-o"></i>
            <span>설문조사</span>
          </a>
        </li>
        <%-- <li class='treeview'><a href='#'><i class='fa fa-edit'></i><span>게시판</span><i class='fa fa-angle-left pull-right'></i></a><ul class='treeview-menu'><li id='Notics'><a href='/sky/notice/list'><i class='fa fa-circle-o'></i> 공지사항</a></li><li><a href='/sky/suggest/suggestList'><i class='fa fa-circle-o'></i> 건의사항</a></li></ul></li> --%>
        
        
<!--         서류결재 -->
        <li class="treeview preopen">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span id="solution">서류결재</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu preopen">
            <li><a href="${pageContext.request.contextPath}/report/make"><i class="fa fa-circle-o"></i> 서류 작성</a></li>
            <li><a href="${pageContext.request.contextPath}/report/state"><i class="fa fa-circle-o"></i> 서류 현황</a></li>
            <li><a href="${pageContext.request.contextPath}/report/waiting"><i class="fa fa-circle-o"></i>승인대기중</a></li>
            <li id="last">
                  <a href="#"><i class="fa fa-circle-o"></i> 외부서류 신청 <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="${pageContext.request.contextPath}/report/out/main"><i class="fa fa-circle-o"></i> 서류신청</a></li>
                    <li><a href="${pageContext.request.contextPath}/report/out/state"><i class="fa fa-circle-o"></i>신청현황</a></li>
                    <li><a href="${pageContext.request.contextPath}/report/out/check"><i class="fa fa-circle-o"></i>허가대기</a></li>
                  </ul>
                </li>
            <li id="labelmanage"><a href="${pageContext.request.contextPath}/label/select"><i class="fa fa-circle-o"></i>라벨관리</a></li>
          </ul>
        </li>
        
        
        <!-- 일정관리 -->
        <li>
          <a href="${pageContext.request.contextPath}/calendar/main">
            <i class="fa fa-calendar"></i> <span>캘린더</span>
          </a>
        </li>
                
        <%-- <li><a href='/sky/calendar/main'><i class='fa fa-calendar'></i> <span>캘린더</span><small class='label pull-right bg-red'>3</small></a></li> --%>
        
        <!--         통계자료 -->
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/stats">
            <i class="fa fa-line-chart"></i>
            <span>통계 자료</span>
          </a>
          
          <%-- <li class='treeview'><a href='/sky/stats'><i class='fa fa-line-chart'></i><span>통계 자료</span><span class='label label-primary pull-right'>new</span></a> --%>
          
          <!--         메모 -->
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/post/main">
            <i class="fa fa-files-o"></i>
            <span>메모</span>
          </a>
        </li>
          
          <%-- <li class='treeview'><a href='/sky/post/main'><i class='fa fa-files-o'></i><span>메모</span><span class='label label-primary pull-right'>new</span></a> --%>
          
         <!-- 교육 동영상 -->
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/videoTraining/main">
            <i class="fa fa-th"></i> <span>동영상 교육</span>
          </a>
        </li>
        
        <%-- <li><a href='/sky/videoTraining/main'><i class='fa fa-th'></i> <span>동영상 교육</span><small class='label pull-right bg-green'>new</small></a></li> --%>
        
        <!-- 구인 광고 페이스북 등록 -->
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/jobad/jobadForm">
            <i class="fa fa-th"></i> <span>구인광고 소셜 등록</span>
          </a>
        </li>
        
        <%-- <li class="treeview"> <a href="${pageContext.request.contextPath}/jobad/jobadForm"><i class="fa fa-th"></i> <span>구인광고 등록</span><small class="label pull-right bg-green">new</small></a></li> --%>
        
        <!-- 화상회의 -->
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/videochatting">
            <i class="fa fa-th"></i> <span>화상회의</span>
          </a>
        </li>
        
        <%-- <li class='treeview'><a href='${pageContext.request.contextPath}/videochatting'><i class='fa fa-th'></i> <span>화상회의</span></a></li> --%>
        
        

        
         <%-- <li class='treeview'><a href='#'><i class='fa fa-cogs'></i><span> 페이지 설정 </span><i class='fa fa-angle-left pull-right'></i></a><ul class='treeview-menu'><li><a href='${pageContext.request.contextPath}/custom/main'><i class='fa fa-delicious'></i>메인위젯관리</a></li><li><a href='${pageContext.request.contextPath}/custom/menu'><i class='fa fa-unsorted'></i>메뉴관리</a></li></ul></li> --%>      
        
        
        <!-- 클라우드 -->
        <li class="treeview">
          <a href="${pageContext.request.contextPath}/cloud">
            <i class="fa fa-th"></i> <span>클라우드</span>
          </a>
        </li>
<%--         <li class='treeview'><a href='${pageContext.request.contextPath}/cloud'><i class='fa fa-th'></i> <span>클라우드</span><small class='label pull-right bg-green'>new</small></a></li> --%>
<!--         커스터마이징 -->
            <li class='treeview'>
          <a href='#'>
            <i class='fa fa-cogs'></i>
            <span> 페이지 설정 </span>
            <i class='fa fa-angle-left pull-right'></i>
          </a>
          <ul class='treeview-menu'>
            <li><a href='${pageContext.request.contextPath}/custom/main'><i class='fa fa-delicious'></i>메인위젯관리</a></li>
            <li><a href='${pageContext.request.contextPath}/custom/menu'><i class='fa fa-unsorted'></i>메뉴관리</a></li>
          </ul>
        </li>
        

  		</c:if>
  		<c:if test="${not empty sessionScope.custommenu}">
  			<c:forEach var="menuList1" items="${sessionScope.custommenu}">
					${menuList1.PATH}
  			</c:forEach>
  			<li class='treeview'>
          <a href='#'>
            <i class='fa fa-cogs'></i>
            <span> 페이지 설정 </span>
            <i class='fa fa-angle-left pull-right'></i>
          </a>
          <ul class='treeview-menu'>
            <li><a href='${pageContext.request.contextPath}/custom/main'><i class='fa fa-delicious'></i>메인위젯관리</a></li>
            <li><a href='${pageContext.request.contextPath}/custom/menu'><i class='fa fa-unsorted'></i>메뉴관리</a></li>
          </ul>
        </li>
  		</c:if>
  			
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div id="cp11" class="input-group colorpicker-component">
                    <input type="text" id="colorValue" value="" class="form-control" />
                    <span class="input-group-addon"><i></i></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" style="width: 20%; height: 10%;" id="colorChange" class="btn btn-primary">적용</button>
                <button type="button" style="width: 20%; height: 10%;" class="btn btn-secondary" data-dismiss="modal">취소</button>
              </div>
        </div>
    </div>
</div>


      
<script>
function reLoad(){
	//window.locaion.reload();
	window.location=location.pathname;
}
$(function(){
	

	
	
	
	
	
	
	
	
	
	
});


</script>     
         
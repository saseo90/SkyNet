<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<script>
	$(function(){
		
		// 메뉴 변경 버튼 클릭시
		// 메뉴 리스트에 있는 모든 메뉴들의 name을 컨트롤러로 보낸다.
		$("#menuBtn").click(function(){
			
			var checkArr = [];
			
			$("#appendMenuList").children("div").children("span").each(function(){
				checkArr.push($(this).attr("name"));
			});
			
			$.ajax({
				url:'edit',
				type:'post',
				dataType: 'text' ,
				data:{valueArr:checkArr}
			});
		});
		
		// 메뉴 리스트에서 체크박스 선택시 아래에 선택한 메뉴 리스트에 추가
		$(document).on('click','.menuId', function(){
			menuId = $(this).attr("id");
			
			if($(this).is(":checked")){
				var menuName;
				var menuId;
				
				// siblings: 선택한 것의 형제 요소 찾기
				menuName = $(this).siblings("#menuName").text();
				$("#appendMenuList").append("<div><span name="+menuId+">"+ menuName +"</span>&nbsp;<i id=i"+menuId+" class='fa fa-trash-o'></i><br></div>");
			}else if($(this).not(":checked")){
				$('span[name='+menuId+']').parent().remove();
			}
		});
		
		// 선택한 메뉴 리스트에서 휴지통 모양 클릭시 메뉴 삭제 
		$(document).on('click', '.fa-trash-o',function(){
			$(this).parent().remove();
		});
		
		// 모든 메뉴 선택 버튼을 눌렀을때
		$('#selectAll').click(function(){
			if($(this).is(":checked")){
				// 모든 메뉴 선택 체크박스 선택 시
				// 모든 메뉴 리스트 체크 박스를 선택하고 선택한 메뉴리스트에 모든 메뉴리스트가 들어간다.
				$('.menuId').prop("checked", true);
				
				var allMenuId = [];
				var allMenuName = [];
				
				$('.menuId').each(function(){
					allMenuId.push($(this).attr("id"));
					allMenuName.push($(this).siblings("#menuName").text())
				});
				
				// menuName = $(this).siblings("#menuName").text(); 

				for(var i=0; i<allMenuId.length; i++)
				{
					$("#appendMenuList").append("<div><span name="+allMenuId[i]+">"+ allMenuName[i] +"</span>&nbsp;<i id=i"+allMenuId[i]+" class='fa fa-trash-o'></i><br></div>");
				}
				
			}else if($(this).not(":checked")){
				// 모든 메뉴 선택 체크박스 해제 시
				// 모든 메뉴 리스트 체크 박스를 해제하고 선택한 메뉴리스트를 모두 제거한다.
				$('.menuId').prop("checked", false);
				$("#appendMenuList").children().remove();
			}
		});
	});
</script>
    <div class="content-wrapper" style="min-height: 1126px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       메뉴 Customizing
      </h1>
    </section>
    
    <div class="box box-primary">
            <div class="box-header ui-sortable-handle" style="cursor: move;">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title">메뉴 리스트</h3>&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="checkbox" id="selectAll"> 모든 메뉴 선택
            </div>

            <div class="box-body">
              <c:forEach var="list" items="${menuList}">
              <ul class="todo-list ui-sortable">
                <li class="">
                      <span class="handle ui-sortable-handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                  <!-- 체크 박스 -->
                 
                  <input type="checkbox" class="menuId" id="${list.menuId}">
                  <!-- 메뉴 이름 -->
                  <span class="text" class="menuName" id="menuName">${list.name}</span>
                 
                </li>
              </ul>
             </c:forEach>
            </div>
            
            <div class="form-group">
            	  
                  <h4 class="box-title">&nbsp;&nbsp;&nbsp;<i class="ion ion-clipboard"></i>&nbsp;&nbsp;선택한 메뉴 리스트</h4>
                  <div id = "appendMenuList">
                  
                  </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix no-border">
              <input type="button" class="btn btn-default pull-right" id="menuBtn" value="메뉴 변경">
            </div>

          </div>
    </div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<script>
	function writeSuggest(){
		location.href="${pageContext.request.contextPath}/suggest/writeSuggest";
	}
</script>
<style>
.detailBtn:link    { color: #293818; text-decoration:none;     }
   .detailBtn:visited { color: #293818; text-decoration:none;     }
   .detailBtn:active  { text-decoration:none;     }
   .detailBtn:hover   { color: #2F9D27; text-decoration:none;   }}
</style>


<div class="content-wrapper">
	<section class="content-header">
		<h1>Suggest</h1>
		구성원들의 소중한 의견, 제안사항 게시판입니다.<br>
		빠른 처리를 위하여 내용을 상세히 기재해주시기 바랍니다.
		<input type="button" class="btn btn-default pull-right" value="write" onclick="writeSuggest()"/><br><br>
    </section>
 <!-- Main content -->
    <section class="content">
		<div class="row">
		<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
			</div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
					<tr>
						<th class="list_no">no</th>
						<th class="list_title">글제목</th>
						<th class="list_id">사원번호</th>
						<th class="list_name">작성자</th>
						<th class="list_date">작성일</th>
						<th class="list_count">조회수</th>
					</tr>
                </thead>
                <tbody>
		  			<c:forEach var="data" items="${list}" varStatus="vv">
		  			<c:if test="${data.sug_delete == 0}"> 
		  				<tr>
						<td>${ vv.index+1}</td>
						<td> 
							<c:if test="${data.sug_nested > 0}">
		    					<c:forEach begin="1" end="${data.sug_nested}">
		    						<span>&nbsp;&nbsp;&nbsp;</span>
		    					</c:forEach>
		    					<img alt="reply" src="./../resources/img/reply.png" width="12px" height="12px">
	   						</c:if>
						<a class="detailBtn" href="${pageContext.request.contextPath}/suggest/detailSuggest/${data.sug_num}"> ${data.sug_title} </a> </td>
						<td> ${data.sug_id }</td>
						<td> ${data.sug_name }</td>
						<td>${data.sug_regdate}</td>
						<td>${data.sug_rcount}</td>
						</tr>
		  			</c:if>
		  			<c:if test="${data.sug_delete == 1}">
		  			<tr>
						<td>${ vv.index+1}</td> 
						<td> 
							<c:if test="${data.sug_nested > 0}">
		    					<c:forEach begin="1" end="${data.sug_nested}">
		    						<span>&nbsp;&nbsp;&nbsp;</span>
		    					</c:forEach>
		    					<img alt="reply" src="./../resources/img/reply.png" width="12px" height="12px">[RE]
	   						</c:if>
						 작성자의 요청으로 삭제된 글 입니다.  </td>
						<td> - </td>
						<td> - </td>
						<td> - </td>
						<td> - </td>
						</tr>
		  			
		  			</c:if>
						
					</c:forEach>
                </tbody>
              </table>
            </div>
              
            <!-- /.box-body -->
          </div>
          <!-- /.box -->


</div>
</div>
</section>
</div>

<!-- page script -->
<script>
  $(function () {
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": false,
      "info": false,
      "autoWidth": true
    });
  });
</script>

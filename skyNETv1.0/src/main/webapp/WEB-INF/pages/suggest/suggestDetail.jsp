<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true" %>

<script>
	function updateSuggest(){
		location.href="${pageContext.request.contextPath}/suggest/updateSuggest/${vo.sug_num}";
	}
	function deleteSuggest(){
		location.href="${pageContext.request.contextPath}/suggest/deleteSuggest/${vo.sug_num}";
	}
	function suggestList(){
		location.href="${pageContext.request.contextPath}/suggest/suggestList";
	}
	function suggestRewrite(){
		location.href="${pageContext.request.contextPath}/suggest/suggestRewrite/${vo.sug_num}";
	}
	function deleteAnswer(no){
		location.href="${pageContext.request.contextPath}/suggest/answer/delete/${vo.sug_num}/"+no;
	}
	
	function anssubmit(){
		if($("#ans_cont").val()==""){
			alert("내용을 입력해주세요");
			return false;
		};
		location.href="${pageContext.request.contextPath}/suggest/AnswerSuggest/${vo.sug_num}";
		return true;
	};
	
	

</script>


<div class="content-wrapper" style="min-height:901px;">
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Suggest Detail 
      </h1>
        <p> Skynet의 불편사항이나 제안사항을 기재해주시면 빠른 시일내로 처리하도록 하겠습니다.<br>
        		내용을 상세히 기재해주시면 빠른 처리에 도움이 됩니다.
        </p>
    </section>


 <!-- Main content -->
    <section class="content">
          <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">제목 : ${vo.sug_title }</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          ${vo.sug_cont}
          <br />
        </div>
        <!-- /버튼 -->
        <div class="box-footer">
	        <input type="hidden" value="${vo.sug_onum}"> 
			<input type="hidden" value="${vo.sug_gnum}"> 
			<input type="hidden" value="${vo.sug_nested}">
        
        <c:if test="${session.member_enum eq vo.sug_id}">
          <input
				type="button" value="수정" class="btn btn-default btn-xs"
				name="update" id="update" onclick="updateSuggest()"/>
			<input 
				type="button" value="삭제" class="btn btn-default btn-xs"
				name="delete" id="delete" onclick="deleteSuggest()"/>
        </c:if>
				
		    <input
				type="button" value="목록으로" class="btn btn-default btn-xs"
				name="goList" id="goList" onclick="suggestList()" />
			<input type="button" value="답글달기"
				class="btn btn-default btn-xs" name="rewrite" id="rewrite" 
				onclick="suggestRewrite()"/>

        </div>
<!--         댓글 -->
        <div class="box-footer">
		 	<table class="table">	
				<c:forEach var="answer" items="${answer}">
				<tr>
				<td>${answer.ans_name}</td>
				<td>${answer.ans_cont}</td>
				 <c:if test="${login.member_enum} ==  ${answer.ans_id}">
				<td >
					<p onclick="deleteAnswer(${answer.ans_no})"><img src="../resources/suggest/garbage.png"/></p>
				</td>
				</c:if>
				</tr>
				</c:forEach>
			</table>
			
			<form:form commandName="answerf" onsubmit='return anssubmit();' method="post">
				<table class="table">
					<tr>
						<td>댓글
							<form:hidden path="ans_id" value="${sessionScope.id}"/>
							<form:hidden path="ans_name" value="${sessionScope.login.member_name}"/>
							<form:hidden path="ans_sugnum" value="${vo.sug_num}"/>
						</td>
						<td><form:input path="ans_cont" id="ans_cont" style="width: 300px"/></td>
						<td><input type="submit" class="btn btn-default" value="등록"/></td>
					</tr>
				</table>
			</form:form>     
        
        </div>
    
</div>
</section>
</div>
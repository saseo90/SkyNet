<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	#boardList{ width : 800px;  margin : auto;}
	body { margin : auto;}
	#listTitle { width : 800px; margin : auto; text-align: left;}
</style>
</head>
<body>

<span id="listTitle">
<h3> Suggest </h3>
<p> 건의사항 게시판 입니다. </p>
<br><br>
</span>
	
	<table id="detailBoard" class="table">
		
		<tr>
			<th>번호</th><td>${vo.num }</td>
		</tr>	
		<tr>
			<th>작성자</th><td>${vo.name }</td>
		</tr>	
		<tr>
			<th>제목</th><td>${vo.title }
			<input type="hidden" value="${vo.onum}">
			<input type="hidden" value="${vo.gnum}">
			<input type="hidden" value="${vo.nested}">
			</td>
		</tr>	

		<tr>
			<td colspan="2">${vo.cont }<br><br><br><br><br><br></td>
		</tr>
		
		<tr>
			<td colspan="2">
			<a href="index.jsp?contentPage=/board/update/${vo.num}"><input class="button" type="button" value="수정" class="btn btn-default" name="update" id="update"/></a>
			<a href="index.jsp?contentPage=/board/delete/${vo.num}">
			<input class="button" type="button" value="삭제" class="btn btn-info" name="delete" id="delete"/>
			</a>
			<a href="index.jsp?contentPage=/board/list/1">
			<input class="button" type="button" value="목록으로" class="btn btn-info" name="goList" id="goList"/>
			</a>
			<a href="index.jsp?contentPage=/board/rewrite/${vo.num}">
			<input class="button" type="button" value="답글달기" class="btn btn-info" name="" id=""/>
			</a>
			</td>
		</tr>	

	</table>
	
	<table id="answer" class="table">	
		<tr>
		<th>작성자</th><th>내용</th><th> &nbsp;</th>
		</tr>
		<c:forEach var="alist" items="${alist}">
		<tr>
		<td>${alist.nick}</td>
		<td width="500px">${alist.content}</td>
		<td >
			<a href="index.jsp?contentPage=/answer/delete/${alist.pk}" ><img src="./resources/images/garbage.png"></a>
		</td>
		</tr>
		</c:forEach>
	</table>
	<form:form commandName="answer">
		<table id="writeAnswer" class="table">
			<tr>
				<td><form:input path="nick"/></td>
				<td><form:input path="content"/></td>
				<td><input class="btn-default" type="submit" value="전송" ></td>
			</tr>
		</table>
	</form:form>

</body>
</html>
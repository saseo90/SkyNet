<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
  <c:forEach var="fname" items="${list}">
	<a href="${pageContext.request.contextPath}/videoTraining/video/${fname}">${fname}</a><br>
	</c:forEach>

	<video width="640" height="344" controls autoplay="autoplay">
	<source src="${pageContext.request.contextPath}/videoTraining/video/SampleVideo_720x480_20mb.mp4" type="video/mp4">

	</video>
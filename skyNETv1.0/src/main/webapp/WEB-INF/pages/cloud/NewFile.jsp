<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.1.9.1.min.js"></script> --%>
 
<script src="${pageContext.request.contextPath}/resources/fileUpload/js/vendor/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/fileUpload/js/jquery.iframe-transport.js"></script>
<script src="${pageContext.request.contextPath}/resources/fileUpload/js/jquery.fileupload.js"></script>
<!-- we code these -->
<link href="${pageContext.request.contextPath}/resources/fileUpload/css/dropzone.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/fileUpload/js/myuploadfunction.js"></script>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
                    내 클라우드에 오신것을 환영하오 ~ 그대 <small>State panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>report</a></li>
            <li class="active">state</li>
        </ol>
    </section>
    <!-- Content : 클라우드 -->
    <section class="content">
        <!-- 2.사이드바 -->
        <div class="col-md-3">
            <h1>Spring MVC - jQuery File Upload</h1>
            <div style="width: 500px; padding: 20px">

                <input id="fileupload" type="file" name="files[]" data-url="${pageContext.request.contextPath}/upload" multiple>

                <div id="dropzone">Drop files here</div>

                <div id="progress">
                    <div style="width: 0%;"></div>
                </div>

                <table id="uploaded-files">
                    <tr>
                        <th>File Name</th>
                        <th>File Size</th>
                        <th>File Type</th>
                        <th>Download</th>
                    </tr>
                </table>

            </div>
        </div>
    </section>
</div>

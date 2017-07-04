<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
    $("body").attr("class","skin-blue sidebar-mini sidebar-collapse");
});
$(function(){
    $("section.content ul.nav.nav-pills.nav-stacked li").click(function(){
        $("section.content ul.nav.nav-pills.nav-stacked li").removeClass("active");
        $(this).addClass("active");
    });
});
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            내 드라이브 계정 사용신청<small>Cloud</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> cloud</a></li>
            <li class="active">내드라이브</li>
        </ol>
    </section>
    <!-- Content : 클라우드 유저 생성-->
    <section class="content">
        <!-- 클라우드 계정생성 -->

        <div>
            <p>우리 회사에 온것을 환영하오</p>
            <div>
                <a class="CloudBtn" href="${pageContext.request.contextPath}/cloud/createCloudUser" /> 클라우드 계정사용 신청
            </div>
        </div>
    </section>
</div>

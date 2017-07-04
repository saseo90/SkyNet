<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SkyNet | 4월반</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/iCheck/flat/blue.css">
  <!--Sweet alert  -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert/1.1.3/sweetalert.css">
  <!-- Morris chart -->
  <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/morris/morris.css"> --%>
  <!-- jQuery 2.2.0 -->
  <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
  <!-- jvectormap -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker-bs3.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
   <!-- fullCalendar 2.2.5-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fullcalendar/fullcalendar.print.css" media="print">
<!-- daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker-bs3.css">
<!-- bootstrap datepicker -->
<script src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
 <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/colorpicker/bootstrap-colorpicker.min.css">
	
	<!--Sweet Alert js  -->
	<script src="https://cdn.jsdelivr.net/sweetalert/1.1.3/sweetalert.min.js"></script>
	
    <%-- <!-- Bootstrap 3.3.6 -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script> --%>
    <!-- DataTables -->
    <script src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="${pageContext.request.contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.js"></script>
    <!-- jwplayer -->
    <script src="https://content.jwplatform.com/libraries/V1BtuEAB.js"></script>

  <!-- DataTables -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datatables/dataTables.bootstrap.css">

<script type="text/javascript">
$(function(){
	function checkKoreanOnly( koreanChar ) {
		   
		   if ( koreanChar == null ) return false ;
		   
		   for(var i=0; i < koreanChar.length; i++){ 

		     var c=koreanChar.charCodeAt(i); 

		     //( 0xAC00 <= c && c <= 0xD7A3 ) 초중종성이 모인 한글자 
		     //( 0x3131 <= c && c <= 0x318E ) 자음 모음 

		     if( !( ( 0xAC00 <= c && c <= 0xD7A3 ) || ( 0x3131 <= c && c <= 0x318E ) ) ) {      
		        return false ; 
		     }
		   }  
		   return true ;
		}
	
// 	$(".preopen").removeClass("active");
// 	$(".preopen").removeClass("menu-open");
	
     if(location.pathname=="/sky/label/select"){
         $(".preopen").addClass("active");
        
        $(".preopen").addClass("menu-open").css("display","block");
        
        
        
        $.ajax({
            
            'url' : '${pageContext.request.contextPath}/label/side',
            'type' : 'post',
            
            'success' : function(data){
                var code = "";
                var htmlcode="";
                $.each(data,function(i,v){
                
                    var name = v.label_name; 
                   if(checkKoreanOnly(name)){
                	  if(name.length>10){
                		  name = name.substring(0,8)+'...'
                	  }
                   }else{
                	   if(name.length>17){
                       	name = name.substring(0,8)+'...'
                       }
                   }
                   
                                     
                 
                	code+='<div class="dropup" style="margin-bottom: 3%;"><a href="${pageContext.request.contextPath}/report/state2/'+v.label_num+'" id="labelhighnameSide" style="padding-left: 20%;">';
					if(v.label_onum == 0){
					code+= name+'</a>';	
					}else{
					code+= '<i class="fa fa-level-up fa-rotate-90"></i>'+' '+name+'</a>';	
					}
					code+='<button type="button" id="labelInfo" class="badge2 pull-right dropdown-toggle" style="background-color: '+v.label_color+';"';
					code+='data-toggle="dropdown"><span class="caret"></span></button>';
					code+='<ul class="dropdown-menu dropdown-menu-right"><li><a href="#" id="useless2" data-toggle="modal" data-target="#myModal2" data-num2="'+v.label_num+'">라벨색상 변경</a></li>';
				
					
					code+='</ul></div></li>';
                    
                    
                })
                htmlcode='<li id="plusfunction"><div class="" style="margin-bottom: 3%;"><a href="#" class="" id="plusmenu" style="padding-left: 20%;"></a></div></li>';
                $("#labelmanage").before(htmlcode);
                $('#last').append(code);
                                
                
                if($(".dropup").length>6){
                	$("#plusfunction").show();
                    for(var i=6; i<=$(".dropup").length; i++){
                        $(".dropup").eq(i).addClass('hidel');
                        $(".dropup").eq(i).hide();
                        
                    }
                    $("#plusmenu").text("더보기▼");                
                }else{
                	$("#plusfunction").hide();
                }
                
                
                
                    $("#plusmenu").click(function(e){
                        e.preventDefault();
                    
                    
                        $(".hidel").toggle();
                        if($(this).text()=="더보기▼"){
                            $(this).text("숨기기▲");
                        }else{
                            $(this).text("더보기▼");
                        }
                        
                                            
                    });
                    
                                    
                                    
            },
            
            'dataType' : 'json'
                    
        })
    }
    
     if(location.pathname=="/sky/report/make"){
         $(".preopen").addClass("active");
        
        $(".preopen").addClass("menu-open").css("display","block");
     }
    
    
     if(location.pathname=="/sky/report/state"){
         $(".preopen").addClass("active");
        
        $(".preopen").addClass("menu-open").css("display","block");
     }
    
    if(location.pathname.indexOf("report/state2")>-1){
         $(".preopen").addClass("active");
        
        $(".preopen").addClass("menu-open").css("display","block");
    }
    
});

</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper" id="core">
  <!-- Main Header -->
  <tiles:insertAttribute name="main-header"/>
  <!-- /.Main Header -->
  
  <!-- Left side column. contains the logo and sidebar -->
  <tiles:insertAttribute name="main-sidebar" />
  <!-- /.Left side column -->
  
    <!-- content-wrapper -->
  <tiles:insertAttribute name="content-wrapper"/>
  <!-- /.content-wrapper -->
  
  
  <!-- Main Footer -->
  <tiles:insertAttribute name="main-footer" />
  <!-- /.Main Footer -->
  <!-- Control Sidebar -->
  <tiles:insertAttribute name="control-sidebar"/>
  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="${pageContext.request.contextPath}/resources/plugins/knob/jquery.knob.js"></script>

<!-- datepicker -->
<script src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="${pageContext.request.contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${pageContext.request.contextPath}/resources/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/resources/dist/js/demo.js"></script>
<!-- bootstrap color picker -->
<script src="${pageContext.request.contextPath}/resources/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/plugins/select2/select2.min.css"/>
<!-- fullCalendar 2.2.5 -->
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- InputMask -->
<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- webSocket Test -->
<script src="//cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/resources/plugins/select2/select2.full.min.js"></script>
<!-- ChartJS 1.0.1 -->
<%-- <script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script> --%>
</body>
</html>

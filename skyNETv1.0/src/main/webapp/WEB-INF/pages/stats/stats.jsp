<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script type="text/javascript">
   
    var a1 =Number("${listA[0].ST_SALECOUNT}");
    var a2 =Number("${listA[1].ST_SALECOUNT}");
    var a3 =Number("${listA[2].ST_SALECOUNT}");
    var a4 =Number("${listA[3].ST_SALECOUNT}");
    var a5 =Number("${listA[4].ST_SALECOUNT}");
    var a6 =Number("${listA[5].ST_SALECOUNT}");
    var a7 =Number("${listA[6].ST_SALECOUNT}");
    var a8 =Number("${listA[7].ST_SALECOUNT}");
    var a9 =Number("${listA[8].ST_SALECOUNT}");
    var a10 =Number("${listA[9].ST_SALECOUNT}");
    var a11 =Number("${listA[10].ST_SALECOUNT}");
    var a12 =Number("${listA[11].ST_SALECOUNT}");
    
    var b1 =Number("${listB[0].ST_SALECOUNT}");
    var b2 =Number("${listB[1].ST_SALECOUNT}");
    var b3 =Number("${listB[2].ST_SALECOUNT}");
    var b4 =Number("${listB[3].ST_SALECOUNT}");
    var b5 =Number("${listB[4].ST_SALECOUNT}");
    var b6 =Number("${listB[5].ST_SALECOUNT}");
    var b7 =Number("${listB[6].ST_SALECOUNT}");
    var b8 =Number("${listB[7].ST_SALECOUNT}");
    var b9 =Number("${listB[8].ST_SALECOUNT}");
    var b10 =Number("${listB[9].ST_SALECOUNT}");
    var b11 =Number("${listB[10].ST_SALECOUNT}");
    var b12 =Number("${listB[11].ST_SALECOUNT}");

     window.onload = function() {
       
      var chart1 = new CanvasJS.Chart("chartContainer1", {
         title : {
            text : "B제품 판매량"
         },         
         data : [ {
            type : "column",
            
            dataPoints: [
               { y: a1, label: "1월" },
               { y: a2, label: "2월" },
               { y: a3, label: "3월" },
               { y: a4, label: "4월" },
               { y: a5, label: "5월" },
               { y: a6, label: "6월" },
               { y: a7, label: "7월" },
               { y: a8, label: "8월" },
               { y: a9, label: "9월" },
               { y: a10, label: "10월" },
               { y: a11, label: "11월" },
               { y: a12, label: "12월" }
            ] 
         } ]
      });
      chart1.render();
      
      var chart2 = new CanvasJS.Chart("chartContainer2", {
         title: {
            text: "A제품 판매량"
         },	
         data: [{
            type: "spline",
            dataPoints: [
              { x: 1, y: b1 },
              { x: 2, y: b2 },
              { x: 3, y: b3 },
              { x: 4, y: b4 },
              { x: 5, y: b5 },
              { x: 6, y: b6 },
              { x: 7, y: b7 },
              { x: 8, y: b8 },
              { x: 9, y: b9 },
              { x: 10, y: b10 },
              { x: 11, y: b11 },
              { x: 12, y: b12 }
            ]
         }]
      });
      chart2.render();
      
      var chart3 = new CanvasJS.Chart("chartContainer3", {
         title: {
            text: "A, B제품 판매량 비교",
            fontSize: 30
         },
         animationEnabled: true,
         axisX: {
            gridColor: "Silver",
            tickColor: "silver",
         },
         toolTip: {
            shared: true
         },
         theme: "theme2",
         axisY: {
            gridColor: "Silver",
            tickColor: "silver"
         },
         legend: {
            verticalAlign: "center",
            horizontalAlign: "right"
         },
         data: [
         {
            type: "line",
            showInLegend: true,
            lineThickness: 2,
            name: "A제품",
            markerType: "square",
            color: "#F08080",
            dataPoints: [
            { x: 1, y: a1 },
            { x: 2, y: a2 },
            { x: 3, y: a3 },
            { x: 4, y: a4 },
            { x: 5, y: a5 },
            { x: 6, y: a6 },
            { x: 7, y: a7 },
            { x: 8, y: a8 },
            { x: 9, y: a9 },
            { x: 10, y: a10 },
            { x: 11, y: a11 },
            { x: 12, y: a12}
            ]
         },
         {
            type: "line",
            showInLegend: true,
            name: "B제품",
            color: "#20B2AA",
            lineThickness: 2,

            dataPoints: [
            { x: 1, y: b1 },
            { x: 2, y: b2 },
            { x: 3, y: b3 },
            { x: 4, y: b4 },
            { x: 5, y: b5 },
            { x: 6, y: b6 },
            { x: 7, y: b7 },
            { x: 8, y: b8 },
            { x: 9, y: b9 },
            { x: 10, y: b10 },
            { x: 11, y: b11 },
            { x: 12, y: b12}
            ]
         }
         ],
         legend: {
            cursor: "pointer",
            itemclick: function (e) {
               if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                  e.dataSeries.visible = false;
               }
               else {
                  e.dataSeries.visible = true;
               }
               chart3.render();
            }
         }
      });

      chart3.render();
   }
     
     
   
     $(function(){
         $( "#tabs" ).tabs();
     });
     
     

</script>
<script src="./resources/js/canvasjs.min.js"></script>

<div class="content-wrapper">

   <section class="content">
      <div class="row">
         <div class="col-md-12">
            <div class="box">
               <!--                <h1>차트</h1> -->
               <br>
               <div class="box-body">
               <div id="tabs">
                 <ul>
                   <li><a href="#tabs-1">A, B제품 판매량 비교</a></li>
                   <li><a href="#tabs-2">A제품 판매량</a></li>
                   <li><a href="#tabs-3">B제품 판매량</a></li>
                 </ul>
                 <div id="tabs-1">
                    <div class="box col-md-12" id="chartContainer3" style=" width: 100%"></div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                 </div>
                 <div id="tabs-2" >
                    <div class="box col-md-12" id="chartContainer2" style=" width: 100%"></div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                 </div>
                 <div id="tabs-3" >
                    <div class="box col-md-12" id="chartContainer1" style=" width: 100%"></div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                 </div>
               </div>
               </div>
               <!-- <div id="chartContainer1" style="height: 400px; width: 100%;"></div>
               <div id="chartContainer2" style="height: 400px; width: 100%;"></div> -->
            </div>
         </div>
      </div>
   </section>
</div>
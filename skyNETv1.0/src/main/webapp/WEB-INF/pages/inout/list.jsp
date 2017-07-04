<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	function addIn(){
		location.href="${pageContext.request.contextPath}/inout/addIn";
	}
	
	function addOut(){
		location.href="${pageContext.request.contextPath}/inout/addOut";
	}
</script>




<div class="content-wrapper">
    <section class="content-header">
      <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua">
            <span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">나의 정상 근무</span>
              <span class="info-box-number">
						${success} 일
              </span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description"> 정시출근을 응원합니다.
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text"> 이번 달 초과 근무 시간 </span>
              <span class="info-box-number"> ${overtime} 시간 </span>

              <div class="progress">
                <div class="progress-bar" style="width: ${overtime}%"></div>
              </div>
                  <span class="progress-description">
                    	정시퇴근을 권장합니다. 
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="fa fa-check-square-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">오늘 나의 출퇴시간은? </span>
               <div class="progress-bar" style="width: 0%"></div>
              <span class="info-box-number">출근 ${today.inout_intime} </span>
 			  <span class="info-box-number">퇴근 ${today.inout_outtime} </span>
              <div class="progress">
               
              </div>
                  <span class="progress-description">
                    
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-red">
            <span class="info-box-icon"><i class="fa fa-ban"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">이번 달 조퇴/지각 내역</span>
              <span class="info-box-number">${late} 일</span>

              <div class="progress">
                <div class="progress-bar" style="width: ${late*10}"></div>
              </div>
                  <span class="progress-description">
                    70% Increase in 30 Days
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </section>

	<!-- Main content -->
	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
				<input type="button" class="btn btn-default pull-right" value="퇴근" onclick="addOut()" /> &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-default pull-right" value="출근" onclick="addIn()" />
			
				<h3><b>${login.member_name}</b> 님의 근태관리 페이지 입니다. <br></h3>
				출근 내역은 하루 한번만 입력되며, 퇴근 내역은 입력 중 마지막 시간으로 저장됩니다.
								
				<br><br>
				
				* 근태 표시 설명 => 정상출석:[0] 지각&조퇴:[1] 무단결석:[2] <br>
				* 휴가는 정상 출석 처리 됩니다. <br>
				* 오늘의 초과시간, 상태는 마지막 퇴근 입력 후 반영됩니다. <br>
				
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div>
					<table id="example2" class="table table-bordered table-hover" >
						<thead>
						<tr>
							<th> 번호 </th>
							<th> 날짜 </th>
							<th> 이름 </th>
							<th> 출근시간 </th>
							<th> 퇴근시간 </th>
							<th> 근태 </th>
							<th> 초과근무시간 </th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="list" items="${list}" varStatus="vv" >
							<tr>
								<td> ${ vv.index+1} </td>
								<td> ${list.inout_date}</td>
								<td> ${list.inout_member}</td>
								<td> ${list.inout_intime}</td>
								<td> ${list.inout_outtime}</td>
								<td> ${list.inout_state}</td>
								<td> ${list.inout_overtime}</td>
								
							</tr>
						</c:forEach>
						</tbody> 
					</table>
					<button class="btn btn-danger" onclick="goPDF()" ><i class="fa fa-file-pdf-o"></i>&nbsp;PDF</button>
					<button class="btn btn-success" onclick="goExcel()"><i class="fa fa-file-excel-o"></i>&nbsp;Excel</button>
					</div>
					<div>
					</div>
					
				</div>

				<!-- /.box-body -->
			</div>
			<!-- /.box -->


		</div>
	</div>
	</section>
</div>


<script>

	function goPDF(){
		location.href="${pageContext.request.contextPath}/inout/pdf/${login.member_enum}";
	}

	
	function goExcel(){
		location.href="${pageContext.request.contextPath}/inout/excel/${login.member_enum}";
	}

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
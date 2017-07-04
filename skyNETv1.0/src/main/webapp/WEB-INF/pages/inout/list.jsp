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
              <span class="info-box-text">���� ���� �ٹ�</span>
              <span class="info-box-number">
						${success} ��
              </span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description"> ��������� �����մϴ�.
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
              <span class="info-box-text"> �̹� �� �ʰ� �ٹ� �ð� </span>
              <span class="info-box-number"> ${overtime} �ð� </span>

              <div class="progress">
                <div class="progress-bar" style="width: ${overtime}%"></div>
              </div>
                  <span class="progress-description">
                    	��������� �����մϴ�. 
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
              <span class="info-box-text">���� ���� ����ð���? </span>
               <div class="progress-bar" style="width: 0%"></div>
              <span class="info-box-number">��� ${today.inout_intime} </span>
 			  <span class="info-box-number">��� ${today.inout_outtime} </span>
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
              <span class="info-box-text">�̹� �� ����/���� ����</span>
              <span class="info-box-number">${late} ��</span>

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
				<input type="button" class="btn btn-default pull-right" value="���" onclick="addOut()" /> &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-default pull-right" value="���" onclick="addIn()" />
			
				<h3><b>${login.member_name}</b> ���� ���°��� ������ �Դϴ�. <br></h3>
				��� ������ �Ϸ� �ѹ��� �ԷµǸ�, ��� ������ �Է� �� ������ �ð����� ����˴ϴ�.
								
				<br><br>
				
				* ���� ǥ�� ���� => �����⼮:[0] ����&����:[1] ���ܰἮ:[2] <br>
				* �ް��� ���� �⼮ ó�� �˴ϴ�. <br>
				* ������ �ʰ��ð�, ���´� ������ ��� �Է� �� �ݿ��˴ϴ�. <br>
				
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div>
					<table id="example2" class="table table-bordered table-hover" >
						<thead>
						<tr>
							<th> ��ȣ </th>
							<th> ��¥ </th>
							<th> �̸� </th>
							<th> ��ٽð� </th>
							<th> ��ٽð� </th>
							<th> ���� </th>
							<th> �ʰ��ٹ��ð� </th>
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
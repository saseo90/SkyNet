package it.net.sky.inout.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import it.net.sky.inout.vo.InoutVo;

public class ExcelView extends AbstractExcelView {
	
	/**
	 * 엑셀 문서 만드는 VIEW
	 */
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<InoutVo> list = (List<InoutVo>) model.get("list");

		HSSFSheet workSheet = null;
		HSSFRow row = null;
		
		
		 String sheetName = "출근내역";
		// 워크북을 이용해 시트 생성
		workSheet = workbook.createSheet(sheetName);

		row = workSheet.createRow(0);	// 리스트의 제목을 담을 ROW 를 생성한다. 
		row.createCell(0).setCellValue("날짜");	// ROW 의 첫번째 Cell 에 제목 (아이디) 을 담는다. 
		row.createCell(1).setCellValue("이름");
		row.createCell(2).setCellValue("출근시간");
		row.createCell(3).setCellValue("퇴근시간");
		row.createCell(4).setCellValue("근태상태");
		row.createCell(5).setCellValue("초과근무시간");
		

		for (int i = 0; i < list.size(); i++) {
			// for문을 돌면서 ROW 생성
			row = workSheet.createRow(i + 1);
			// 해당 ROW 의 CELL 에 리스트에서 가져온 값을 넣는다. 
			row.createCell(0).setCellValue(list.get(i).getInout_date());
			row.createCell(1).setCellValue(list.get(i).getInout_member());
			row.createCell(2).setCellValue(list.get(i).getInout_intime());
			row.createCell(3).setCellValue(list.get(i).getInout_outtime());
			row.createCell(4).setCellValue(list.get(i).getInout_state());
			row.createCell(5).setCellValue(list.get(i).getInout_overtime());
		}
		
			
		  String filename = URLEncoder.encode(sheetName, "UTF-8");
	      response.setContentType("Application/msexcel");
	      response.setHeader("Content-Disposition", "attachment;filename=" + filename + "-excel.xls");
	}

}

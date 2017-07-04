package it.net.sky.util.poi;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import it.net.sky.member.vo.MemberVo;
/**
 * 사원 목록 EXCEL VIEW
 * @author pc23
 *
 */
public class MemberExcel extends AbstractExcelView {
	
	/**
	 * 사원목록 엑셀 만드는 VIEW
	 */
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List<MemberVo> list = (List<MemberVo>) model.get("list");
		
		HSSFSheet workSheet = null ; 
		HSSFRow row = null ;
		
		String sheetName = "사원목록";
		workSheet = workbook.createSheet(sheetName);	// 워크북을 이용해 시트 생성

		//헤더부분 셀에 스타일을 주기위한 인스턴스 생성
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cellStyle.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
		cellStyle.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
		cellStyle.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
		
		HSSFFont font = workbook.createFont();
		font.setBoldweight((short)700);
		cellStyle.setFont(font);
				
		// cell 별 width 정하기
		workSheet.setColumnWidth(0, 3000);
		workSheet.setColumnWidth(1, 2000);
		workSheet.setColumnWidth(2, 3000);
		workSheet.setColumnWidth(3, 2000);
		workSheet.setColumnWidth(4, 5000);
		workSheet.setColumnWidth(5, 7000);
		
		
		// 헤더 그리기
		row = workSheet.createRow(0);
		
		HSSFCell cell = row.createCell(0);
		cell.setCellStyle(cellStyle);
		cell.setCellValue("부서");
		
		cell = row.createCell(1);
		cell.setCellStyle(cellStyle);
		cell.setCellValue("직급");
		
		cell = row.createCell(2);
		cell.setCellStyle(cellStyle);
		cell.setCellValue("사원번호");
		
		cell = row.createCell(3);
		cell.setCellStyle(cellStyle);
		cell.setCellValue("이름");
		
		cell = row.createCell(4);
		cell.setCellStyle(cellStyle);
		cell.setCellValue("전화번호");
		
		cell = row.createCell(5);
		cell.setCellStyle(cellStyle);
		cell.setCellValue("이메일");
		
		for (int i = 0; i < list.size(); i++) {
			row = workSheet.createRow(i+1);
			row.createCell(0).setCellValue(list.get(i).getDep_name());
			row.createCell(1).setCellValue(list.get(i).getRank_name());
			row.createCell(2).setCellValue(list.get(i).getMember_enum());
			row.createCell(3).setCellValue(list.get(i).getMember_name());
			row.createCell(4).setCellValue(list.get(i).getMember_phone());
			row.createCell(5).setCellValue(list.get(i).getMember_email());
		}
		
		String filename = URLEncoder.encode(sheetName, "UTF-8");
		response.setContentType("Application/msexcel");
		response.setHeader("Content-Disposition", "attachment;filename="+filename+ "-excel.xls");
	}

}

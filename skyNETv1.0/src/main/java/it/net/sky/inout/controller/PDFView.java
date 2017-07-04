package it.net.sky.inout.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

import it.net.sky.inout.vo.InoutVo;

public class PDFView extends AbstractPdfView {
	private String fontPath = "c:\\Windows\\Fonts\\malgun.ttf";

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<InoutVo> list = (List<InoutVo>) model.get("list");
		Table table = new Table(6, list.size() + 1);
		table.setPadding(5);
		BaseFont bfKorean = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font = new Font(bfKorean);
		Cell cell = new Cell(new Paragraph("날짜", font));
		cell.setHeader(true);
		table.addCell(cell);

		cell = new Cell(new Paragraph("이름", font));
		cell.setHeader(true);
		table.addCell(cell);

		cell = new Cell(new Paragraph("출근시간", font));
		cell.setHeader(true);
		table.addCell(cell);
		
		cell = new Cell(new Paragraph("퇴근시간", font));
		cell.setHeader(true);
		table.addCell(cell);
		
		cell = new Cell(new Paragraph("근태", font));
		cell.setHeader(true);
		table.addCell(cell);
		
		cell = new Cell(new Paragraph("초과근무시간", font));
		cell.setHeader(true);
		table.addCell(cell);

		table.endHeaders();

		for (InoutVo vo : list) {
			cell = new Cell(new Paragraph(vo.getInout_date(), font));
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getInout_member(), font));
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getInout_intime(), font));
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getInout_outtime(), font));
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getInout_state(), font));
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getInout_overtime()));
			cell.setHeader(false);
			table.addCell(cell);
		}
		document.add(table);
		
		String sheetName = "나의 출근내역";
		String filename = URLEncoder.encode(sheetName, "UTF-8");
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".pdf");
		document.close();
		writer.close();
	}

}

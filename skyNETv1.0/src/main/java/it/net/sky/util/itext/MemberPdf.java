package it.net.sky.util.itext;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.itextpdf.text.Element;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

import it.net.sky.member.vo.MemberVo;

/**
 * 사원목록 PDF VIEW
 * 
 * @author pc23
 *
 */
public class MemberPdf extends AbstractPdfView {

	private String fontPath = "c:\\Windows\\Fonts\\malgun.ttf";
	
	/**
	 * 사원목록 PDF 생성
	 */
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter pdfWriter,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<MemberVo> list = (List<MemberVo>) model.get("list");
		Table table = new Table(6, list.size() + 1);
		table.setPadding(5);
		table.setAlignment(Element.ALIGN_CENTER);
		table.setCellsFitPage(true);
		table.setTableFitsPage(true);
		
		BaseFont bfKorean = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font = new Font(bfKorean);
		document.addTitle("사원목록");

		Cell cell = new Cell(new Paragraph("부서", font));
		cell.setHeader(true);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		cell = new Cell(new Paragraph("직급", font));
		cell.setHeader(true);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		cell = new Cell(new Paragraph("사원번호", font));
		cell.setHeader(true);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		cell = new Cell(new Paragraph("이름", font));
		cell.setHeader(true);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		cell = new Cell(new Paragraph("전화번호", font));
		cell.setHeader(true);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);
		cell = new Cell(new Paragraph("이메일", font));
		cell.setHeader(true);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_CENTER);
		table.addCell(cell);

		table.endHeaders();

		for (MemberVo vo : list) {
			cell = new Cell(new Paragraph(vo.getDep_name(), font));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getRank_name(), font));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getMember_enum(), font));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getMember_name(), font));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getMember_phone(), font));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setHeader(false);
			table.addCell(cell);
			cell = new Cell(new Paragraph(vo.getMember_email(), font));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setHeader(false);
			table.addCell(cell);
		}

		document.add(table);

		String sheetName = "사원목록";
		String filename = URLEncoder.encode(sheetName, "UTF-8");
		response.setContentType("Application/pdf");
		response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".pdf");
		document.close();
		pdfWriter.close();
	};

}

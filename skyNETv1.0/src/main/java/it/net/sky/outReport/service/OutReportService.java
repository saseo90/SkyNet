package it.net.sky.outReport.service;

import java.util.List;
import java.util.Map;

import it.net.sky.outReport.vo.ConnectReportVo;
import it.net.sky.report.vo.ReportVo;

public interface OutReportService {
	public List<ReportVo> surch(Map<String, Object> keyword);
	public int appluSurch(ConnectReportVo vo);
	public int appply(ConnectReportVo vo);
	public List<ConnectReportVo> stateList(String id);
	public List<ConnectReportVo> checkList(String id);
	public int agreeReport(ConnectReportVo vo);
	public int disagreeReport(ConnectReportVo vo);
	public String detailReport(int report_no);
}

package it.net.sky.report.service;

import java.sql.SQLException;
import java.util.List;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.report.vo.ReportVo;

public interface ReportService {
	public int insert(ReportVo vo);
	public List<ReportVo> select(LoginVo vo);
	public List<ReportVo> check(LoginVo vo);
	public List<LoginVo> getUser();
	public ReportVo selectOne(int num) throws SQLException;
	public int check(int num) throws SQLException;
	public int back(ReportVo vo) throws SQLException;
	public void updateLabelNumPlus(ReportVo vo);
	public void updateLabelNumMinus(ReportVo vo);
	public List<ReportVo> labelnumlist();
	public List<ReportVo> select2(int labelnum);
	public List<Integer> stateList(String id);
}

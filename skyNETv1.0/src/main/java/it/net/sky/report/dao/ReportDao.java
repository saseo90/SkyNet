package it.net.sky.report.dao;

import java.sql.SQLException;
import java.util.List;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.report.vo.ReportVo;

public interface ReportDao {
	public int insert(ReportVo vo) throws SQLException;
	public List<LoginVo> getUser() throws SQLException;
	public List<ReportVo> select(LoginVo vo) throws SQLException;
	public List<ReportVo> check(LoginVo vo) throws SQLException;
	public ReportVo selectOne(int num) throws SQLException;
	public int check(int num) throws SQLException;
	public int back(ReportVo vo) throws SQLException;
	public void updateLabelNumPlus(ReportVo vo) throws SQLException;
	public void updateLabelNumMinus(ReportVo vo) throws SQLException;
	public List<ReportVo> labelnumlist() throws SQLException;
	public List<ReportVo> select2(int labelnum) throws SQLException;
	public List<Integer> stateList(String id) throws SQLException;
}

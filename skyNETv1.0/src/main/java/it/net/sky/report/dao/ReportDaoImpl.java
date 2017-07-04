package it.net.sky.report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.report.vo.ReportVo;

@Repository(value = "reportDao")
public class ReportDaoImpl implements ReportDao {
	@Autowired
	SqlSessionTemplate client;

	@Override
	public int insert(ReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.insert("report.insert", vo);
	}

	@Override
	public List<ReportVo> select(LoginVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("report.select", vo);
	}

	@Override
	public List<ReportVo> check(LoginVo vo) throws SQLException {
		return client.selectList("report.check", vo);
	}

	@Override
	public List<LoginVo> getUser() throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("login.userlist");
	}

	@Override
	public ReportVo selectOne(int num) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("report.selectOne", num);
	}

	@Override
	public int check(int num) throws SQLException {
		// TODO Auto-generated method stub
		ReportVo vo = client.selectOne("report.selectOne", num);
		return client.update("report.updateReport", vo);
	}

	@Override
	public int back(ReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("report.backReport", vo);
	}

	@Override
	public void updateLabelNumPlus(ReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.update("report.updateLabelNumPlus", vo);
	}

	@Override
	public void updateLabelNumMinus(ReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.update("report.updateLabelNumMinus", vo);

	}

	@Override
	public List<ReportVo> labelnumlist() throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("report.labelnumlist");
	}

	@Override
	public List<ReportVo> select2(int labelnum) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("report.select2", labelnum);
	}

	@Override
	public List<Integer> stateList(String id) throws SQLException {
		// TODO Auto-generated method stub
		List<Integer> list = new ArrayList<>();
		list.add((Integer) client.selectOne("report.waitCont", id));
		list.add((Integer) client.selectOne("report.endCont", id));
		list.add((Integer) client.selectOne("report.backCont", id));
		return list;
	}

}

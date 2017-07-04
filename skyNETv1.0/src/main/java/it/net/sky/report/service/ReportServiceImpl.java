package it.net.sky.report.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.report.dao.ReportDao;
import it.net.sky.report.vo.ReportVo;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
	@Resource(name="reportDao")
	ReportDao dao;
	@Override
	public int insert(ReportVo vo) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=dao.insert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<ReportVo> select(LoginVo vo) {
		// TODO Auto-generated method stub
		List<ReportVo> list=null;
		try {
			list=dao.select(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<ReportVo> check(LoginVo vo) {
		// TODO Auto-generated method stub
		List<ReportVo> list=null;
		try {
			list =dao.check(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<LoginVo> getUser() {
		// TODO Auto-generated method stub
		List<LoginVo>list =null;
		try {
			list =dao.getUser();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public ReportVo selectOne(int num) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectOne(num);
	}
	@Override
	public int check(int num) throws SQLException {
		// TODO Auto-generated method stub
		return dao.check(num);
	}
	@Override
	public int back(ReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.back(vo);
	}
	@Override
	public void updateLabelNumPlus(ReportVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.updateLabelNumPlus(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void updateLabelNumMinus(ReportVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.updateLabelNumMinus(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public List<ReportVo> labelnumlist() {
		List<ReportVo> list = null;
		try {
			list = dao.labelnumlist();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<ReportVo> select2(int labelnum) {
		// TODO Auto-generated method stub
				List<ReportVo> list=null;
				try {
					list=dao.select2(labelnum);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return list;
	}
	@Override
	public List<Integer> stateList(String id) {
		// TODO Auto-generated method stub
		List<Integer> list = null;
		try {
			list = dao.stateList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}

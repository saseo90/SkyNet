package it.net.sky.inout.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.inout.dao.InoutDao;
import it.net.sky.inout.vo.InoutVo;

@Service("inoutService")
public class InoutServiceImpl implements InoutService{

	@Resource(name="inoutDao")
	InoutDao dao;
	
	@Override
	public int insertIntime(String inout_member) {
		int a = 0;
		try {
			a = dao.insertIntime(inout_member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public int insertOuttime(String inout_member) {
		int a = 0;
		try {
			a = dao.insertOuttime(inout_member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public List<InoutVo> listMember(String inout_member) {
		
		List<InoutVo> list = null;
		try {
			list = dao.listMember(inout_member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<InoutVo> listMonth(String inout_member) {
		
		List<InoutVo> list = null;
		
		try {
			list = dao.listMonth(inout_member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public InoutVo searchToday(Map<String, Object> map) {
		InoutVo vo = null;
		
		try {
			vo = dao.searchToday(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public int updateState(InoutVo vo) {
		try {
			dao.updateState(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateOver(InoutVo vo) {
		try {
			dao.updateOver(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateEarly(InoutVo vo) {
		try {
			dao.updateEarly(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int noInCheck(String inout_member) {
		
			try {
				dao.noInCheck(inout_member);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return 0;
	}

}

package it.net.sky.stats.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.stats.dao.StatsDao;
import it.net.sky.stats.vo.StatsVo;

@Service(value="statsService")
public class StatsServiceImpl implements StatsService{

	@Resource(name="statsDao")
	StatsDao dao;
	
	@Override
	public List<StatsVo> listACount() {
		List<StatsVo> vo = null;
		
		try {
		vo	= dao.listACount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public List<StatsVo> listBCount() {
		List<StatsVo> vo = null;
		
		try {
			vo = dao.listBCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
}

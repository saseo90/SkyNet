package it.net.sky.suggest.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.suggest.dao.SuggestDao;
import it.net.sky.suggest.vo.SuggestVo;

@Service("suggestService")
public class SuggestServiceImpl implements SuggestService{

	@Resource(name="suggestDao")
	SuggestDao dao;	
	
	
	@Override
	public int writeSuggest(SuggestVo vo) {
		int a = 0;
		try {
			a = dao.writeSuggest(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public int deleteSuggest(int sug_num) {
		int a = 0;
		
		try {
			a = dao.deleteSuggest(sug_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public int updateSuggest(SuggestVo vo) {
		
		int a = 0;
		
		try {
			a = dao.updateSuggest(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public SuggestVo detailSuggest(int sug_num) {
		
		SuggestVo vo = null;
		try {
			vo = dao.detailSuggest(sug_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public List<SuggestVo> listAll() {
		List<SuggestVo> list = null;
		try {
			list = dao.listAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<SuggestVo> listAll(Map<String, Object> params) {

		List<SuggestVo> list = null;
		
		try {
			list = dao.listAll(params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int countUp(int sug_num) {
		
		int a = 0;
		try {
			a = dao.countUp(sug_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public int insertReply(SuggestVo vo) {
		int a = 0;
		
		try {
			a= dao.insertReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public int listCount(Map<String, Object> map) {
		int a = 0;
		
		try {
			a = dao.listCount(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public int updateOnum(Map<String, Object> map) {
		
		int a = 0;
		
		try {
			a = dao.updateOnum(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}

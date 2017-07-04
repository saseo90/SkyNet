package it.net.sky.suggest.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.suggest.vo.SuggestVo;

@Repository("suggestDao")
public class SuggestDaoImpl implements SuggestDao{
	
	@Autowired
	SqlSessionTemplate client;

	@Override
	public int writeSuggest(SuggestVo vo) throws SQLException {
		return client.insert("suggest.writeSuggest", vo);
	}

	@Override
	public int deleteSuggest(int sug_num) throws SQLException {
		return client.delete("suggest.deleteSuggest", sug_num);
	}

	@Override
	public int updateSuggest(SuggestVo vo) throws SQLException {
		return client.update("suggest.updateSuggest", vo);
	}

	@Override
	public SuggestVo detailSuggest(int sug_num) throws SQLException {
		return client.selectOne("suggest.detailSuggest", sug_num);
	}

	@Override
	public List<SuggestVo> listAll() throws SQLException {
		return client.selectList("suggest.listAll");
	}

	@Override
	public List<SuggestVo> listAll(Map<String, Object> params) throws SQLException {
		return client.selectList("suggest.listAll", params);
	}

	@Override
	public int countUp(int sug_num) throws SQLException {
		return client.update("suggest.countUp", sug_num);
	}

	@Override
	public int insertReply(SuggestVo vo) throws SQLException {
		return client.insert("suggest.insertReply" , vo);
	}

	@Override
	public int listCount(Map<String, Object> map) throws SQLException {
		return client.selectOne("suggest.listCount", map);
	}

	@Override
	public int updateOnum(Map<String, Object> map) throws SQLException {
		return client.update("board.updateOnum",map);
	}

}

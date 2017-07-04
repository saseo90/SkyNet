package it.net.sky.stats.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.stats.vo.StatsVo;

@Repository(value="statsDao")
public class StatsDaoImpl implements StatsDao{

	@Autowired
	SqlSessionTemplate client;

	@Override
	public List<StatsVo> listACount() throws SQLException {
		return client.selectList("stats.listACount");
	}

	@Override
	public List<StatsVo> listBCount() throws SQLException {
		return client.selectList("stats.listBCount");
	}
	
}

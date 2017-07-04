package it.net.sky.stats.dao;

import java.sql.SQLException;
import java.util.List;

import it.net.sky.stats.vo.StatsVo;

public interface StatsDao {

	// A제품 판매 통계를 내기 위해 판매량 가져오기
	public List<StatsVo> listACount() throws SQLException;
	
	// B제품 판매 통계를 내기 위해 판매량 가져오기
	public List<StatsVo> listBCount() throws SQLException;
}

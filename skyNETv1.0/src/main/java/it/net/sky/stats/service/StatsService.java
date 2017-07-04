package it.net.sky.stats.service;

import java.util.List;

import it.net.sky.stats.vo.StatsVo;

public interface StatsService {
	
	// 판매 통계를 내기위해 판매량 가져오기
	public List<StatsVo> listACount();
	
	// 판매 통계를 내기위해 판매량 가져오기
	public List<StatsVo> listBCount();
}

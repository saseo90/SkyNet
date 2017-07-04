package it.net.sky.join.service;

import java.util.List;
import it.net.sky.join.vo.JoinVo;

public interface JoinService {

	// 회원 가입
	public void insertMember(JoinVo vo);
		
	// 회원 조회
	public List<JoinVo> allMember();
}

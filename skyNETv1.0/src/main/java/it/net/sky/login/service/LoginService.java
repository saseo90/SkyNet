package it.net.sky.login.service;

import it.net.sky.login.vo.LoginVo;

public interface LoginService {
	public LoginVo loginCheckID(LoginVo vo);
	
	public LoginVo checkPW(LoginVo vo);
	
	// 로그인한 회원 사진 파일 이름 가져오는 코드
	public String profileImg(String id);
}

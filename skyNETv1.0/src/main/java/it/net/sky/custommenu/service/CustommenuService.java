package it.net.sky.custommenu.service;

import java.util.List;
import java.util.Map;

import it.net.sky.custommenu.vo.CustommenuVo;

public interface CustommenuService {

	// 전체 메뉴 리스트
	public List<CustommenuVo> menuList();
	
	// 메뉴 커스터마이징 하기 전에 전체 삭제 해주기
	public void allMenuDelete(String id);
		
	// 메뉴 삽입하기
	public void insertMenu(Map<String, Object> menuList);

	// 커스텀 메뉴 있나 없나
	public List<CustommenuVo> selectCustommenuList(String id);
	
}

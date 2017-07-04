package it.net.sky.custommenu.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.custommenu.dao.CustommenuDao;
import it.net.sky.custommenu.vo.CustommenuVo;

@Service(value="custommenuService")
public class CustommenuServiceImpl implements CustommenuService{

	@Resource(name="custommenuDao")
	CustommenuDao dao;
	
	@Override
	public List<CustommenuVo> menuList() {
		List<CustommenuVo> list = null;
		
		try {
			list = dao.menuList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void allMenuDelete(String id) {
		try {
			dao.allMenuDelete(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertMenu(Map<String, Object> menuList) {
		try {
			dao.insertMenu(menuList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CustommenuVo> selectCustommenuList(String id) {
		List<CustommenuVo> list = null;
		try {
			list=dao.selectCustommenuList(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}

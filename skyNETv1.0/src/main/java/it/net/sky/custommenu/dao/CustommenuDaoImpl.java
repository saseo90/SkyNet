package it.net.sky.custommenu.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.custommenu.vo.CustommenuVo;

@Repository(value="custommenuDao")
public class CustommenuDaoImpl implements CustommenuDao {

	@Autowired
	SqlSessionTemplate client;
	
	@Override
	public List<CustommenuVo> menuList() throws SQLException {

		return client.selectList("custommenu.menuList");
	}

	@Override
	public void allMenuDelete(String id) throws SQLException {
		client.delete("custommenu.allMenuDelete", id);
	}

	@Override
	public void insertMenu(Map<String, Object> menuList) throws SQLException {
		client.insert("custommenu.insertMenu", menuList);
	}

	@Override
	public List<CustommenuVo> selectCustommenuList(String id) throws SQLException {
		return client.selectList("custommenu.selectCustommenuList", id);
	}
}

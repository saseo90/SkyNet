package it.net.sky.custommenu.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.custommenu.vo.CustomMainHTMLVo;
import it.net.sky.custommenu.vo.CustomMainVo;

public interface CustomMainDao {
	public int getConunt(String id) throws SQLException;
	public List<CustomMainVo> getList(CustomMainVo vo) throws SQLException;
	public List<CustomMainVo> getFirst(String loc) throws SQLException;
	public  int updateList(Map<String, Object> map) throws SQLException;
	public int insertList(Map<String, Object> map) throws SQLException;
	public int deleteList(String id) throws SQLException;
	public List<CustomMainHTMLVo> getHTMLList(CustomMainVo vo) throws SQLException;

}

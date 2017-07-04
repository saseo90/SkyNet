package it.net.sky.custommenu.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.custommenu.vo.CustomMainHTMLVo;
import it.net.sky.custommenu.vo.CustomMainVo;

public interface CustomMainService {
	public Map<String, List<CustomMainVo>> getList(String id);
	public  int saveList(Map<String, Object> map);
	public int deleteList(String id);
	public Map<String, List<CustomMainHTMLVo>> getHTMLList(String id);
}

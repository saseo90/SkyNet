package it.net.sky.video.dao;

import java.sql.SQLException;
import java.util.List;


import it.net.sky.video.vo.VideoCategoryVo;

public interface VideoCategoryDao {
	
	
	
	public void insertcategory(VideoCategoryVo vo) throws SQLException;
	
	public List<VideoCategoryVo> selecttypecategory() throws SQLException;
	
	public void deletevideocategory(String type) throws SQLException;
	
	public String typedistinct(String type) throws SQLException;
	
}

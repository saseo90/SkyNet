package it.net.sky.video.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.video.vo.VideoBoardVo;

public interface VideoTrainDao {
	public List<VideoBoardVo> selectvideo(String id) throws SQLException;
	
	public void insertvideo(VideoBoardVo vo) throws SQLException;
	
	public VideoBoardVo selectbnum(int bnum) throws SQLException;
	
	public void updatevideo(VideoBoardVo vo) throws SQLException;
	
	public void deletevideo(int bnum) throws SQLException;
	
	
	////////////////////////////
	
	public Map<String,Integer> selectcount(String id) throws SQLException;
	
	//////////////////
	
	public  List<VideoBoardVo>  selectbytype(Map<String,String> map) throws SQLException;
	
}

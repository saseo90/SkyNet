package it.net.sky.video.dao;

import java.sql.SQLException;

import it.net.sky.video.vo.VideoInfoVo;

public interface VideoInfoDao {
	public void insertvideoinfo(VideoInfoVo vo) throws SQLException; 
	
	public void deleteinfo(int bnum) throws SQLException;
	
	public void updateinfo(int bnum) throws SQLException;
	
}

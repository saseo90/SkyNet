package it.net.sky.video.dao;

import java.sql.SQLException;

import it.net.sky.video.vo.ConnectVideoVo;

public interface VideoConnectDao {
	
	public void insertvideocomplete(ConnectVideoVo vo) throws SQLException;
	
	public ConnectVideoVo selectvideocomplete(ConnectVideoVo vo) throws SQLException;
	
	public void updatevideocomplete(ConnectVideoVo vo) throws SQLException;
	
	public void updateAllvideocomplete(ConnectVideoVo vo) throws SQLException;
	
	public void deletevideocomplete(int bnum) throws SQLException;
}
	
package it.net.sky.video.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.video.vo.VideoInfoVo;
@Repository("videoInfoDao")
public class VideoInfoDaoImpl implements VideoInfoDao {
	
	@Autowired
	SqlSessionTemplate client;
	
	@Override
	public void insertvideoinfo(VideoInfoVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.insert("videoinfo.insertvideoInfo", vo);
	}

	@Override
	public void deleteinfo(int bnum) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("videoinfo.deleteinfo", bnum);
	}

	@Override
	public void updateinfo(int bnum) throws SQLException {
		// TODO Auto-generated method stub
		client.update("videoinfo.updateinfo", bnum);
	}

}

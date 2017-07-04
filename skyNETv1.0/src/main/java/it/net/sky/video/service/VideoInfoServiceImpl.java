package it.net.sky.video.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.video.dao.VideoInfoDao;
import it.net.sky.video.vo.VideoInfoVo;
@Service("videoInfoService")
public class VideoInfoServiceImpl implements VideoInfoService {
	
	@Resource(name="videoInfoDao")
	VideoInfoDao dao;
	
	@Override
	public void insertvideoinfo(VideoInfoVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.insertvideoinfo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteinfo(int bnum) {
		// TODO Auto-generated method stub
		try {
			dao.deleteinfo(bnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateinfo(int bnum) {
		// TODO Auto-generated method stub
		try {
			dao.updateinfo(bnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

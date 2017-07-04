package it.net.sky.video.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.video.dao.VideoConnectDao;
import it.net.sky.video.vo.ConnectVideoVo;

@Service("videoConnectService")
public class VideoConnectServiceImpl implements VideoConnectService {
	@Resource(name="videoConnectDao")
	VideoConnectDao dao;

	@Override
	public void insertvideocomplete(ConnectVideoVo vo) {

		try {
			dao.insertvideocomplete(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public ConnectVideoVo selectvideocomplete(ConnectVideoVo vo2) {
		ConnectVideoVo vo = null;
		try {
			vo = dao.selectvideocomplete(vo2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
		return vo;
				
	}

	@Override
	public void updatevideocomplete(ConnectVideoVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.updatevideocomplete(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deletevideocomplete(int bnum) {
		// TODO Auto-generated method stub
		try {
			dao.deletevideocomplete(bnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateAllvideocomplete(ConnectVideoVo vo) {
		// TODO Auto-generated method stub
				try {
					dao.updateAllvideocomplete(vo);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
	}
}

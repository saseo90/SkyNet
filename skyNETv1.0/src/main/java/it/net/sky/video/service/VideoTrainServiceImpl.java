package it.net.sky.video.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.video.dao.VideoTrainDao;
import it.net.sky.video.vo.VideoBoardVo;
@Service("videoTrainService")
public class VideoTrainServiceImpl implements VideoTrainService {

	@Resource(name="videoTrainDao")
	VideoTrainDao dao;
	
	@Override
	public List<VideoBoardVo> selectvideo(String id) {
		// TODO Auto-generated method stub
		List<VideoBoardVo> list = null;
		try {
			list = dao.selectvideo(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertvideo(VideoBoardVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.insertvideo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public VideoBoardVo selectbnum(int bnum) {
		// TODO Auto-generated method stub
		VideoBoardVo vo = null;
		try {
			vo = dao.selectbnum(bnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void updatevideo(VideoBoardVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.updatevideo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deletevideo(int bnum) {
		// TODO Auto-generated method stub
		try {
			dao.deletevideo(bnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Map<String, Integer> selectcount(String id) {
		Map<String, Integer> mp = null;
		try {
			mp = dao.selectcount(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mp;
	}

	@Override
	public List<VideoBoardVo> selectbytype(Map<String, String> map) {
		List<VideoBoardVo> list = null;
			try {
				list = dao.selectbytype(map);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
	}

	

}

package it.net.sky.video.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.video.dao.VideoCategoryDao;

import it.net.sky.video.vo.VideoCategoryVo;

@Service("videoCategoryService")
public class VideoCategoryServiceImpl implements VideoCategoryService {

	@Resource(name="videoCategoryDao")
	VideoCategoryDao dao;
	
	

	@Override
	public void insertcategory(VideoCategoryVo vo) {
		// TODO Auto-generated method stub
		try {
			dao.insertcategory(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<VideoCategoryVo> selecttypecategory() {
		// TODO Auto-generated method stub
		List<VideoCategoryVo> list = null;
		
		try {
			list= dao.selecttypecategory();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deletevideocategory(String type) {
		// TODO Auto-generated method stub
		try {
			dao.deletevideocategory(type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String typedistinct(String type) {
		// TODO Auto-generated method stub
		String tp = "";
		try {
			tp = dao.typedistinct(type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tp;
	}

}

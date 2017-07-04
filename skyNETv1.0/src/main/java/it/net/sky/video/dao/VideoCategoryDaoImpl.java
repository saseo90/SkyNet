package it.net.sky.video.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import it.net.sky.video.vo.VideoCategoryVo;
@Repository("videoCategoryDao")
public class VideoCategoryDaoImpl implements VideoCategoryDao {

	@Autowired
	SqlSessionTemplate client;
	
	
	@Override
	public void insertcategory(VideoCategoryVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.insert("videocategory.insertvideocategory", vo);
	}

	@Override
	public List<VideoCategoryVo> selecttypecategory() throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("videocategory.selecttypecategory");
	}

	@Override
	public void deletevideocategory(String type) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("videocategory.deletevideocategory", type);
	}

	@Override
	public String typedistinct(String type) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("videocategory.typedistinct", type);
	}

	

}

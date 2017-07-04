package it.net.sky.video.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.video.vo.VideoBoardVo;
@Repository("videoTrainDao")
public class VideoTrainDaoImpl implements VideoTrainDao {
	
	@Autowired
	SqlSessionTemplate client;
	
	@Override
	public List<VideoBoardVo> selectvideo(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("video.selectvideo",id);
	}

	@Override
	public void insertvideo(VideoBoardVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.insert("video.insertvideo", vo);
	}

	@Override
	public VideoBoardVo selectbnum(int bnum) throws SQLException {
		// TODO Auto-generated method stub
		return (VideoBoardVo) client.selectOne("video.selectbnum", bnum);
	}

	@Override
	public void updatevideo(VideoBoardVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.update("video.updatevideo", vo);
	}

	@Override
	public void deletevideo(int bnum) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("video.deletevideo", bnum);
	}

	@Override
	public Map<String, Integer> selectcount(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("video.selectcount", id);
	}

	@Override
	public List<VideoBoardVo> selectbytype(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("video.selectbytype", map);
	}

	

}

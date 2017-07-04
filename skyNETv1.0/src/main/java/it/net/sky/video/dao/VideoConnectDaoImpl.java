package it.net.sky.video.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.video.vo.ConnectVideoVo;

@Repository("videoConnectDao")
public class VideoConnectDaoImpl implements VideoConnectDao {
	@Autowired
	SqlSessionTemplate client;

	@Override
	public void insertvideocomplete(ConnectVideoVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.insert("videoconnect.insertvideocomplete", vo);
	}

	@Override
	public ConnectVideoVo selectvideocomplete(ConnectVideoVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("videoconnect.selectvideocomplete",vo);
	}

	@Override
	public void updatevideocomplete(ConnectVideoVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.update("videoconnect.updatevideocomplete", vo);
	}

	@Override
	public void deletevideocomplete(int bnum) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("videoconnect.deletevideocomplete",bnum);
	}

	@Override
	public void updateAllvideocomplete(ConnectVideoVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.update("videoconnect.updateAllvideocomplete", vo);
	}
	
	
}

package it.net.sky.post.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.omg.CORBA.Object;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.post.vo.PostVo;
@Repository(value="postDao")
public class PostDaoImpl implements PostDao{
	@Autowired
	SqlSessionTemplate service;
	@Override
	public List<PostVo> selectList(LoginVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return service.selectList("post.selectList",vo);
	}

	@Override
	public int insert(PostVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return service.insert("post.insert",vo);
	}

	@Override
	public int delete(Map<String, List<PostVo>> num) throws SQLException {
		// TODO Auto-generated method stub
		return service.delete("post.delete",num);
	}

}

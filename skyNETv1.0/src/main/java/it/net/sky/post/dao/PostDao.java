package it.net.sky.post.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.omg.CORBA.Object;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.post.vo.PostVo;

public interface PostDao {
	public List<PostVo> selectList(LoginVo vo) throws SQLException;
	public int insert(PostVo vo) throws SQLException;
	public int delete(Map<String, List<PostVo>> num) throws SQLException;
}

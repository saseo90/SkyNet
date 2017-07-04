package it.net.sky.post.sercvice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.omg.CORBA.Object;
import org.springframework.stereotype.Service;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.post.dao.PostDao;
import it.net.sky.post.vo.PostVo;
@Service(value="postService")
public class PostServiceImpl implements PostService{
	@Resource(name ="postDao")
	PostDao dao;
	@Override
	public List<PostVo> selectList(LoginVo vo) {
		// TODO Auto-generated method stub
		List<PostVo> list=null;
		try {
			list=dao.selectList(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insert(PostVo vo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result =dao.insert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(Map<String, List<PostVo>> num) {
		int result = 0;
		try {
			result =dao.delete(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}

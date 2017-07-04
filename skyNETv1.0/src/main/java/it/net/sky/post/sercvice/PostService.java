package it.net.sky.post.sercvice;

import java.util.List;
import java.util.Map;

import org.omg.CORBA.Object;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.post.vo.PostVo;

public interface PostService {
	public List<PostVo> selectList(LoginVo vo);
	public int insert(PostVo vo);
	public int delete(Map<String, List<PostVo>> num);
	
}

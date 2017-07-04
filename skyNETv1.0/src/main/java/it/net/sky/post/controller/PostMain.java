package it.net.sky.post.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Object;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.post.sercvice.PostService;
import it.net.sky.post.vo.PostVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class PostMain {
	@Resource(name = "postService")
	PostService service;

	@RequestMapping(value = "/post/main")
	public String postMain(HttpServletRequest request) {

		LoginVo vo = null;
		try {
			vo = (LoginVo) SessionUtil.getAttribute("login");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<PostVo> list = list = service.selectList(vo);
		request.setAttribute("postList", list);
		return "post/main";
	}

	@RequestMapping(value = "/post/main", method = RequestMethod.POST)
	public String postInsert(PostVo vo) {
		LoginVo user = null;
		try {
			user = (LoginVo) SessionUtil.getAttribute("login");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		vo.setPostId(user.getMember_enum());
		service.insert(vo);
		return "redirect:/post/main";
	}

	@RequestMapping(value = "/post/delete", method = RequestMethod.POST)
	public String postdelete(int[] delete) {
		List<PostVo> list = new ArrayList<PostVo>();
		for (int i = 0; i < delete.length; i++) {
			PostVo vo =new PostVo();
			vo.setPostNo(delete[i]);
			list.add(vo);
		}
		Map<String, List<PostVo>> map = new HashMap<String, List<PostVo>>();
		map.put("list",list);
		service.delete(map);

		return "redirect:/post/main";
	}
}

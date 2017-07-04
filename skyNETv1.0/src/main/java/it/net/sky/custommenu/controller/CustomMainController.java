package it.net.sky.custommenu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import it.net.sky.custommenu.service.CustomMainService;
import it.net.sky.custommenu.vo.CustomMainVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class CustomMainController {
	@Resource(name="customMainService")
	CustomMainService service;
	@RequestMapping(value="/custom/main")
	public String custommain(Model model){
		Map<String, List<CustomMainVo>> map = null;
		try {
			String id= (String) SessionUtil.getAttribute("id");
			
			map= service.getList(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", map);
		return "custom/custommain";
	}
	@RequestMapping(value="/custom/main/insert")
	public @ResponseBody Map<String, Object> savecustomamin(
								@RequestParam(value="non[]", defaultValue="1")String[] non,
								@RequestParam(value="right[]", defaultValue="1")String[]right,
								@RequestParam(value="left[]", defaultValue="1")String[] left){
		int result = 0;
		Map<String, Object> map= new HashMap<>();
		List<CustomMainVo> list = new ArrayList<>();
		for (int i = 0; i < non.length; i++) {
			CustomMainVo vo = new CustomMainVo();
			try {
				vo.setCustomId(non[i]);
				vo.setCustomLoc("non");
				vo.setCustomRank(Integer.toString(i));
				vo.setReg_Id((String) SessionUtil.getAttribute("id"));
				list.add(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		for (int i = 0; i < right.length; i++) {
			CustomMainVo vo = new CustomMainVo();
			try {
				vo.setCustomId(right[i]);
				vo.setCustomLoc("right");
				vo.setCustomRank(Integer.toString(i));
				vo.setReg_Id((String) SessionUtil.getAttribute("id"));
				list.add(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		for (int i = 0; i < left.length; i++) {
			CustomMainVo vo = new CustomMainVo();
			try {
				vo.setCustomId(left[i]);
				vo.setCustomLoc("left");
				vo.setCustomRank(Integer.toString(i));
				vo.setReg_Id((String) SessionUtil.getAttribute("id"));
				list.add(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		map.put("list", list);

		result = service.saveList(map);
		return map;
	}
}

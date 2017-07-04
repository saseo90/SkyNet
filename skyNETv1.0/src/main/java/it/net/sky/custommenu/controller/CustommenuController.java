package it.net.sky.custommenu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import it.net.sky.custommenu.service.CustommenuService;
import it.net.sky.custommenu.vo.CustommenuVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class CustommenuController {
	
	@Resource(name="custommenuService")
	CustommenuService service;
	
	@RequestMapping(value="/custom/menu")
	public String customMenu(Model model){
		
		model.addAttribute("menuList", service.menuList());
		
		return "custommenu";
	}
	
	@RequestMapping(value="/custom/edit")
	public String customMenuEdit(@RequestParam(value="valueArr[]") List<Integer> valueArr){
		Map<String , Object> map = new HashMap<String , Object>();
		List<CustommenuVo> list = new ArrayList<CustommenuVo>();
		try {
			String id;
			id= (String) SessionUtil.getAttribute("id");
			// 첫번째로 사용자의 메뉴 리스트 초기화
			service.allMenuDelete(id);
			
			for(int i = 0; i<valueArr.size(); i++)
			{
				CustommenuVo vo = new CustommenuVo();
				vo.setMember_enum(id);
				vo.setMenuId(valueArr.get(i));
				vo.setSnum(i);
				
				list.add(i,vo);
				
			}
			map.put("list", list);
			service.insertMenu(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/custommenu", method=RequestMethod.POST)
	public String custommenu(){
		String id;
		
		// 커스터 마이징한 메뉴리스트
		try {
			id = (String) SessionUtil.getAttribute("id");
			service.selectCustommenuList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
}

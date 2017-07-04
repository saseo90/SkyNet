package it.net.sky.custommenu.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.custommenu.dao.CustomMainDao;
import it.net.sky.custommenu.vo.CustomMainHTMLVo;
import it.net.sky.custommenu.vo.CustomMainVo;
import it.net.sky.util.session.SessionUtil;

@Service(value = "customMainService")
public class CustomMainServiceImpl implements CustomMainService {
	@Resource(name = "CustomMainDao")
	CustomMainDao dao;

	@Override
	public Map<String, List<CustomMainVo>> getList(String id) {
		// TODO Auto-generated method stub
		List<CustomMainVo> noList =null;
		List<CustomMainVo> lList =null;
		List<CustomMainVo> rList =null;
		Map<String, List<CustomMainVo>> map =new HashMap<String, List<CustomMainVo>>();
		try {
			CustomMainVo vo = new CustomMainVo();
			vo.setReg_Id(id);
			vo.setCustomLoc("non");
			noList = dao.getList(vo);
			vo.setCustomLoc("right");
			lList = dao.getList(vo);
			vo.setCustomLoc("left");
			rList = dao.getList(vo);
			if(noList.size()==0&&lList.size()==0&&rList.size()==0){
			noList=dao.getFirst("non");
			rList=dao.getFirst("right");
			lList=dao.getFirst("left");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			map.put("non", noList);
			map.put("left", rList);
			map.put("right", lList);
		}
		return map;
	}

	@Override
	public int saveList(Map<String, Object> map){
		// TODO Auto-generated method stub
		int result=0;
		try {
			if(dao.getConunt((String) SessionUtil.getAttribute("id"))!=0){
				result=dao.updateList(map);
			}else{
				result =dao.insertList(map);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteList(String id) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = dao.deleteList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Map<String, List<CustomMainHTMLVo>> getHTMLList(String id) {
		// TODO Auto-generated method stub
		CustomMainVo vo =new CustomMainVo();
		Map<String, List<CustomMainHTMLVo>> map =new HashMap<>();
		try {
			if(dao.getConunt((String) SessionUtil.getAttribute("id"))!=0){
				vo.setReg_Id(id);
			}else{
				vo.setReg_Id("admin");
			}
			vo.setCustomLoc("left");
			map.put("left", dao.getHTMLList(vo));
			vo.setCustomLoc("right");
			map.put("right", dao.getHTMLList(vo));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}
}

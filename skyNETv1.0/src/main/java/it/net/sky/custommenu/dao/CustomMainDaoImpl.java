package it.net.sky.custommenu.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.custommenu.vo.CustomMainHTMLVo;
import it.net.sky.custommenu.vo.CustomMainVo;
@Repository(value="CustomMainDao")
public class CustomMainDaoImpl implements CustomMainDao {
	@Autowired
	SqlSessionTemplate client;
	@Override
	public List<CustomMainVo> getList(CustomMainVo vo) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println(vo.getCustomId());
		System.out.println(vo.getCustomLoc());
		return client.selectList("custommain.getList",vo);
	}

	@Override
	public List<CustomMainVo> getFirst(String loc) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("custommain.getfirst",loc);
	}

	@Override
	public int updateList(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		List<CustomMainVo> list = (List<CustomMainVo>) map.get("list");
		for (CustomMainVo vo : list) {
			client.update("custommain.updateList",vo);
		}
		return 0;
	}

	@Override
	public int insertList(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("custommain.insrtList",map);
	}

	@Override
	public int deleteList(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("custommain.deleteList",id);
	}

	@Override
	public int getConunt(String id) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, String> map =new HashMap<>();
		map.put("id", id);
		int result = (int)client.selectOne("custommain.getlistCount",map);
		return result;
	}

	@Override
	public List<CustomMainHTMLVo> getHTMLList(CustomMainVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("custommain.getHTMLCODE",vo);
	}

}

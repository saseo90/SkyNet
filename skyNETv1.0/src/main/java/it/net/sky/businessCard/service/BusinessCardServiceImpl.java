package it.net.sky.businessCard.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.businessCard.dao.BusinessCardDao;
import it.net.sky.businessCard.vo.BusinessCardVo;
import it.net.sky.calendar.dao.CalendarDao;
@Service("businessCardService")
public class BusinessCardServiceImpl implements BusinessCardService {
	@Resource(name = "businessCardDao")
	BusinessCardDao dao;
	@Override
	public List<BusinessCardVo> getCard(String id) {
		// TODO Auto-generated method stub
		List<BusinessCardVo> list = null;
		try {
			list = dao.getCard(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int createCard(BusinessCardVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.createCard(vo);
		
	}
	@Override
	public int removeCard(int num) throws SQLException {
		// TODO Auto-generated method stub
		return dao.removeCard(num);
	}

}

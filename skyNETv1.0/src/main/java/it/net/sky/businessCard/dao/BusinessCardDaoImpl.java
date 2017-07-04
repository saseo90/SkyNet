package it.net.sky.businessCard.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.businessCard.vo.BusinessCardVo;

@Repository(value = "businessCardDao")
public class BusinessCardDaoImpl implements BusinessCardDao {
	@Autowired
	SqlSessionTemplate client;

	@Override
	public List<BusinessCardVo> getCard(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("business.listCard",id);
	}

	@Override
	public int createCard(BusinessCardVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.insert("business.addCard", vo);
	}

	@Override
	public int removeCard(int num) throws SQLException {
		// TODO Auto-generated method stub
		return client.insert("business.removeCard", num);
	}

}

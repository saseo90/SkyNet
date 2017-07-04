package it.net.sky.businessCard.dao;

import java.sql.SQLException;
import java.util.List;

import it.net.sky.businessCard.vo.BusinessCardVo;

public interface BusinessCardDao {
	public List<BusinessCardVo> getCard(String id)throws SQLException;
	public int createCard(BusinessCardVo vo)throws SQLException;
	public int removeCard(int num) throws SQLException;
}

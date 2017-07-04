package it.net.sky.businessCard.service;

import java.sql.SQLException;
import java.util.List;

import it.net.sky.businessCard.vo.BusinessCardVo;

public interface BusinessCardService {
	public List<BusinessCardVo> getCard(String id);
	public int createCard(BusinessCardVo vo)throws SQLException;
	public int removeCard(int num) throws SQLException;
}

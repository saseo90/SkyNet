package it.net.sky.calendar.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.calendar.vo.CalendarVo;
@Repository(value = "calendarDao")
public class CalendarDaoImpl implements CalendarDao {
	@Autowired
	SqlSessionTemplate client;

	@Override
	public int inserCalender(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return client.insert("calendar.insert",map);
	}

	@Override
	public CalendarVo selectCalender(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("calendar.seletOne",vo);
	}

	@Override
	public int deleteCalender(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("calendar.delete",vo);
	}

	@Override
	public int updateCalender(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("calendar.update",vo);
	}

	@Override
	public List<CalendarVo> selectCalenderAll(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.seletList",id);
	}

	@Override
	public List<CalendarVo> dayCalendarList(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("calendar.dayList",vo);
	}

}

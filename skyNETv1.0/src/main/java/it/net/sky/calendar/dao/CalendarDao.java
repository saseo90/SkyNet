package it.net.sky.calendar.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import it.net.sky.calendar.vo.CalendarVo;

public interface CalendarDao {
	public int inserCalender(Map<String, Object> map) throws SQLException;
	public CalendarVo selectCalender(CalendarVo vo) throws SQLException;
	public List<CalendarVo> selectCalenderAll(String id) throws SQLException;
	public int deleteCalender(CalendarVo vo) throws SQLException;
	public int updateCalender(CalendarVo vo) throws SQLException;
	public List<CalendarVo> dayCalendarList(CalendarVo vo) throws SQLException;
}

package it.net.sky.calendar.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import it.net.sky.calendar.vo.CalendarVo;

public interface CalendarService {
	public int inserCalender(Map<String, Object> map);
	public CalendarVo selectCalender(CalendarVo vo);
	public int deleteCalender(CalendarVo vo) throws SQLException;
	public int updateCalender(CalendarVo vo) throws SQLException;
	public List<CalendarVo> selectCalenderAll(String id);
	public List<CalendarVo> dayCalendarList(CalendarVo vo);
}

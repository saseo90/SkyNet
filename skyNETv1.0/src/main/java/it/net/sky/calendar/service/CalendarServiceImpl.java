package it.net.sky.calendar.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.calendar.dao.CalendarDao;
import it.net.sky.calendar.vo.CalendarVo;
@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {
	
	@Resource(name = "calendarDao")
	CalendarDao dao;
	@Override
	public int inserCalender(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result =dao.inserCalender(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public CalendarVo selectCalender(CalendarVo vo) {
		// TODO Auto-generated method stub
		CalendarVo selectvo = null ;
		try {
			selectvo =dao.selectCalender(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectvo;
	}

	@Override
	public int deleteCalender(CalendarVo vo) throws SQLException{
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result =dao.deleteCalender(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateCalender(CalendarVo vo) throws SQLException {
	// TODO Auto-generated method stub
	
		return dao.updateCalender(vo);
	}

	@Override
	public List<CalendarVo> selectCalenderAll(String id) {
		// TODO Auto-generated method stub
		List<CalendarVo> list=null;
		try {
			list =dao.selectCalenderAll(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<CalendarVo> dayCalendarList(CalendarVo vo) {
		// TODO Auto-generated method stub
		List<CalendarVo> list=null;
		try {
			list=dao.dayCalendarList(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}

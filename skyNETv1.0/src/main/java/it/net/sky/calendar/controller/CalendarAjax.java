package it.net.sky.calendar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import it.net.sky.calendar.service.CalendarService;
import it.net.sky.calendar.vo.CalendarVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class CalendarAjax {
	@Resource(name = "calendarService")
	CalendarService service;

	@RequestMapping(value = "/calendar/data")
	public @ResponseBody List<Map<String, String>> calendar() {
		List<Map<String, String>> list = new ArrayList<>();

		String id = null;
		try {
			id = (String) SessionUtil.getAttribute("id");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<CalendarVo> listVo = service.selectCalenderAll(id);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = null;
		String endDate = null;
		for (CalendarVo vo : listVo) {
			Map<String, String> map = new HashMap<>();
			startDate = dateFormat.format(vo.getCalendar_start());
			endDate = dateFormat.format(vo.getCalendar_end());
			map.put("title",vo.getCalendar_title());
			map.put("start",startDate);
			map.put("end", endDate);
			map.put("backgroundColor",vo.getCalendar_color());
			map.put("borderColor",vo.getCalendar_color());
			map.put("allDay", "false");
			map.put("description",Integer.toString(vo.getCalendar_no()));
			list.add(map);
		}
		return list;
	}
}

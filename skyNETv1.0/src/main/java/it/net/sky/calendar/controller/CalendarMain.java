package it.net.sky.calendar.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import it.net.sky.calendar.service.CalendarService;
import it.net.sky.calendar.vo.CalendarVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class CalendarMain {
	@Resource(name = "calendarService")
	CalendarService service;
	@RequestMapping(value = "/calendar/main")
	public String calendar(HttpServletRequest request) {
		return "calendar";
	}
	@RequestMapping(value = "/calendar/main",method=RequestMethod.POST)
	public String savecalendar(HttpServletRequest request,String[] 
			calendar_color,	Date[] calendar_start,	
			Date[] calendar_end,
			String[] calendar_title,
			String[] calendar_cont,	
			String[] calendar_remark){ 
		List<CalendarVo> list =new ArrayList<CalendarVo>();
		String id=null;
		System.out.println(calendar_title.length);
		for (int i=0;i<calendar_title.length;i++) {
			CalendarVo vo = new CalendarVo();
			if(calendar_start.length!=0){
				vo.setCalendar_start(calendar_start[i]);
			}
			if(calendar_end.length!=0){
				vo.setCalendar_end(calendar_end[i]);
			}
			if(calendar_title.length!=0){
				vo.setCalendar_title(calendar_title[i]);
			}
			if(calendar_cont.length!=0){
				vo.setCalendar_cont(calendar_cont[i]);
			}
			if(calendar_remark.length!=0){
				vo.setCalendar_remark(calendar_remark[i]);
			}
			if(calendar_color.length!=0){
				vo.setCalendar_color(calendar_color[i]);
			}
			list.add(vo);
			try {
				id= (String) SessionUtil.getAttribute("id");
				list.get(i).setCalendar_regid(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		service.inserCalender(map);
		request.setAttribute("calendarList",service.selectCalenderAll(id));
		return "calendar";
	}
	@RequestMapping(value = "/calendar/update",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object>   modify
		 (int calendar_no,Date calendar_start,Date calendar_end,
		  String calendar_title,String calendar_cont,
		  String calendar_remark,String calendar_color) {
		CalendarVo vo = new CalendarVo();
		vo.setCalendar_no(calendar_no);
		vo.setCalendar_start(calendar_start);
		vo.setCalendar_end(calendar_end);
		vo.setCalendar_cont(calendar_cont);
		vo.setCalendar_remark(calendar_remark);
		vo.setCalendar_color(calendar_color);
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		try {
			service.updateCalender(vo);
			jsonObject.put("state", "success");
		} catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calendar/delete",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object>   remove(int calendar_no) {
		///int calendar_no,Date calendar_start,Date calendar_end,String calendar_title,String calendar_cont,String calendar_remark,String calendar_color
		CalendarVo vo = new CalendarVo();
		vo.setCalendar_no(calendar_no);
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		try {
			service.deleteCalender(vo);
			jsonObject.put("state", "success");
		} catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calender/select",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> select(CalendarVo vo) {
		System.out.println(vo.getCalendar_no());
		CalendarVo selectVo = service.selectCalender(vo);
		Map<String, Object> jsonObject = new HashMap<String, Object>();

		if(selectVo!=null){
			jsonObject.put("state", "success");
		}else{
			jsonObject.put("state", "fail");
		}
		try {
			if(!selectVo.getCalendar_regid().equals(SessionUtil.getAttribute("id")))
			jsonObject.put("admin", "true");
			
			jsonObject.put("select", selectVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/calender/daylist",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> select(String date) {
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		String[] spDate = date.split(" ");
		spDate[0] =spDate[0].substring(0, 3);
		date =spDate[2]+"-"+spDate[0]+"-"+spDate[1];

		
		SimpleDateFormat formet = new SimpleDateFormat("dd-MMM-yyyy",Locale.ENGLISH);
		CalendarVo vo =new CalendarVo();
		Date result =null;
		try {
			result = formet.parse(date);
			vo.setCalendar_regdate(result);
			vo.setCalendar_regid((String) SessionUtil.getAttribute("id"));
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<CalendarVo>list = service.dayCalendarList(vo);
		jsonObject.put("data", list);
		return jsonObject;
	}
}

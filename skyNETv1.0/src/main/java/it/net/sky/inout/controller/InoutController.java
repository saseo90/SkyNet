package it.net.sky.inout.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.net.sky.inout.service.InoutService;
import it.net.sky.inout.vo.InoutVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class InoutController {

	@Resource(name="inoutService")
	InoutService service;
	
	/**
	 * 근태 페이지 조회
	 * */
	@RequestMapping("inout/list")
	public String inoutList(Model model){
		
		String member_enum = "";
		Map<String, Object> map = new HashMap<String, Object>();
			try {
				member_enum = (String) SessionUtil.getAttribute("id");
				System.out.println(member_enum);
			} catch (Exception e) {
				e.printStackTrace();
			}
		map.put("inout_member", member_enum);
			
		//오늘상태
		InoutVo today = service.searchToday(map);

		//개인근태내역
		List<InoutVo> list = service.listMember(member_enum); //
		
		//이번달 내역 조회
		List<InoutVo> monthList = service.listMonth(member_enum);
		
		model.addAttribute("today", today);
		model.addAttribute("list", list);
		model.addAttribute("monthList", monthList);

		int success = 0;
		int overtime = 0;
		int late = 0;
		//이번달 정상근무수
		for (InoutVo inoutVo : monthList) {
			overtime += inoutVo.getInout_overtime(); //초과근무시간
			String state = inoutVo.getInout_state(); //상태검사 (정상근무수 구하려고) 
			
			if (state.equals("0") ) { //정상출근수 계산
				success += 1;
			}
			
			if (state.equals("1")) {//조퇴 지각 수	
				late += 1;
			}
		}
		model.addAttribute("success", success);
		model.addAttribute("overtime", overtime);
		model.addAttribute("late", late);
		
		
		
		return "inout/list";
	}

	/**
	 * 이다정 : 출근 체크
	 * 출근을 여러번 찍어도 제일 먼저 찍은 것만 기록되게 함 
	 * */
	@RequestMapping("inout/addIn")
	public String addIn(){
		
		String inout_member = "";
		InoutVo vo = null;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			inout_member = (String) SessionUtil.getAttribute("id");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("inout_member", inout_member);
		vo = service.searchToday(map);
		if(vo == null){
			service.insertIntime(inout_member);
			InoutVo check = service.searchToday(map);
			service.updateState(check);
		}
		
		return "redirect:/inout/list";
	}
	
	/**
	 * 이다정 : 퇴근 체크
	 * 출근 내역이 있을 때만 퇴근 기록 할 수 있게 함
	 * 퇴근 내역 수정하고 
	 * 퇴근 시간에 따른 set 초과근무시간, 상태(조퇴유무)
	 * */
	@RequestMapping("inout/addOut")
	public String addOut(){
		
		String inout_member = "";
		InoutVo vo = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			inout_member = (String) SessionUtil.getAttribute("id");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//출근 찍엇나 확인한다.
		map.put("inout_member", inout_member);
		
		vo = service.searchToday(map);
		
		//출근 값이 있을때만 퇴근 찍는다. 
		if(vo != null){
			service.insertOuttime(inout_member);
			InoutVo check = service.searchToday(map);
			service.updateOver(check); //초과근무시간set
			service.updateEarly(check); //조퇴유무set
			
			
		}
		
		return "redirect:/inout/list";
	}
	
	/**
	 * 엑셀 출력 
	 * */
	@RequestMapping(value="/inout/excel/{inout_member}")
	public String excelSave(@PathVariable String inout_member, Model model){

		List<InoutVo> list =  service.listMember(inout_member);
		model.addAttribute("list", list);
		
		if(!model.asMap().containsKey("list")){	
			throw new NullPointerException();

		}
		return "excelView";
	}
	
	/**
	 * PDF 출력
	 */
	@RequestMapping(value="/inout/pdf/{inout_member}")
	public String pdfSave(@PathVariable String inout_member, Model model){
		
		List<InoutVo> list =  service.listMember(inout_member);
		model.addAttribute("list", list);
		
		if(!model.asMap().containsKey("list")){	
			throw new NullPointerException();

		}
		return "pdfView";
	}
	
}

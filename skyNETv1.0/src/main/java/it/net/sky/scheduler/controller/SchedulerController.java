package it.net.sky.scheduler.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import it.net.sky.inout.service.InoutService;
import it.net.sky.inout.vo.InoutVo;
import it.net.sky.member.service.MemberService;
import it.net.sky.member.vo.MemberVo;
import it.net.sky.message.service.MessageService;
import it.net.sky.scheduler.service.SchedulerService;

@Component
public class SchedulerController {
	@Resource(name="schedulerservice")
	SchedulerService schedulerService;
	@Resource(name="messageService")
    private MessageService msgService;
	@Resource(name="inoutService")
	InoutService iService;
	@Resource(name="memberService")
	MemberService service;
	
	
	@Scheduled(cron="0 0 0 * * *")
	public void removeMemo(){
		schedulerService.removeMemeo();
	}
	@Scheduled(cron="0 0 0 2 * *")
    public void removeMSG(){
        msgService.deleteTimeMessage();
    }
	
	
	@Scheduled(cron="0 0 23 * * *")
	public void noCheck(){
		
		List<MemberVo> list =  service.listAll();
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (MemberVo vo : list) {
			String inout_member = vo.getMember_enum();
			map.put("inout_member",inout_member);
			InoutVo inout = iService.searchToday(map);
			if(inout == null){
				iService.insertIntime(inout_member);
				iService.noInCheck(inout_member);
			}
		}
		
	}
	
}

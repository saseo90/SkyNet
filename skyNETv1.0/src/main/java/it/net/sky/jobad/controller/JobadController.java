package it.net.sky.jobad.controller;


import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import it.net.sky.jobad.vo.JobadVo;

@Controller
@RequestMapping(value="jobad")
/**
 * ClassName : jobadController.java
 * Description : 구인등록을 페이스북에 올려주는 컨트롤러
 * @author pc07
 * 
 */
public class JobadController {
	
	private String app_id = "1107748589262498";
	private String url = "https://www.facebook.com/dialog/feed?app_id="+app_id+"&redirect_uri=http://localhost/sky";
	
	@ModelAttribute("jobad")
	public JobadVo formValue(){
		return new JobadVo();
	}
	
	/**
	 * 구인등록폼을 보여준다.
	 * @return
	 */
	@RequestMapping(value="/jobadForm")
	public String jobadForm()
	{
		return "jobad/jobadForm";
	}
	
	/**
	 * 구인등록 폼에서 넘어온 vo값을 DB에 저장하고 글을 페이스북에 올린다.
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/jobadForm", method=RequestMethod.POST)
	public @ResponseBody String jobadInsert(HttpServletResponse response,@ModelAttribute("jobad") JobadVo vo,@RequestParam String caption,
			@RequestParam String name, @RequestParam String description, @RequestParam String link)
	{	
		response.addHeader("X-FRAME-OPTIONS","DENY");
		url+= "&caption="+ caption;
		url+= "&name=" + name;
		url+= "&description=" + description;
		url+= "&link=" + link;
		return url;
	}
}


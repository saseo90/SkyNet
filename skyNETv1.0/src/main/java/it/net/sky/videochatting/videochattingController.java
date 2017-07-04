package it.net.sky.videochatting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class videochattingController {

	@RequestMapping(value="/videochatting")
	public String videochatting()
	{
		return "videochatting";
	}
}

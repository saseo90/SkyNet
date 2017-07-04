package it.net.sky.join.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import it.net.sky.join.service.JoinService;
import it.net.sky.join.vo.JoinVo;
import it.net.sky.util.commons.codec.CodecUtil;

@Controller
public class JoinController {

	@ModelAttribute("command")
	public JoinVo formback(){
		return new JoinVo();
	}
	
	@Value("#{memberProp.savePath}")
	File saveFolder;
	
	@Resource(name="joinService")
	JoinService service;
	
	@RequestMapping(value="/memberJoinForm")
	public String memberJoinForm()
	{
		return "memberJoinForm";
	}
	
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST)
	public String memberJoin(JoinVo vo, HttpServletRequest req)//MultipartHttpServletRequest request)//HttpServletRequest request, 
	{	
		JoinVo vo2=vo;
		String pass = "";
		String name = ""; 
		/*// 사원 등록 페이지에서 사원 사진을 아무것도 지정하지 않았을때 기본 이미지로 보이게 하기 위한 코드
		if(vo.getProfile().getSize() == 0)
		{
			// 파일 타입을 MultipartFile 타입으로 바꾸기 위한 코드
			File file = new File(saveFolder,"employee.png");
			DiskFileItem fileItem = new DiskFileItem("file", "text/plain", false, file.getName(), (int)file.length(), file.getParentFile());
			
			try {
				fileItem.getOutputStream();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			MultipartFile result = new CommonsMultipartFile(fileItem);
			
			vo.setProfile(result); // 여기에서 기본 이미지 파일을 셋팅 해준다.
		}
		
		if(vo.getSign().getSize() == 0)
		{
			File file = new File(saveFolder,"sign.png");
			DiskFileItem fileItem = new DiskFileItem("file", "text/plain", false, file.getName(), (int)file.length(), file.getParentFile());
			try {
				fileItem.getOutputStream();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			MultipartFile result = new CommonsMultipartFile(fileItem);
			vo.setSign(result); // 여기에서 기본 이미지 파일을 셋팅 해준다.
		}*/
		String path =  req.getServletPath();
		
		// 파일을 지정한 경로에 저장하고 리턴값으로 파일의 이름을 가져온다.
		String p = this.uploadProcess(vo.getProfile(), vo.getMember_enum(), path);
		String s = this.uploadProcess(vo.getSign(), vo.getMember_enum(), path);

		vo.setMember_profile(p);
		vo.setMember_sign(s);
		
		// 비밀번화와 이름 복호하
		try {
			CodecUtil cu = new CodecUtil();
			pass = cu.aesEncode(vo.getMember_pass());
 		} catch (Exception e) {
			e.printStackTrace();
		}
		vo.setMember_pass(pass);
		
		service.insertMember(vo);
		
		return "redirect:memberJoinForm";
	}
	
	// 파일을 지정한 경로에 저장하는 메서드
	private String uploadProcess(MultipartFile multipart, String imgname, String path) {
		
		String filename = multipart.getOriginalFilename();
		File file = new File("D:/springwork/skyNET/src/main/webapp/resources/images/profile/", imgname +"_" +filename);
		String origin = imgname +"_" +filename;
		try {
			// form에서 넘어온 파일을 실제 서버에 저장하는 메소드
			multipart.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return origin; // 파일 이름 리턴하지만 여기선 쓰이지 않는다.
	}

	public static String getPath(){
		String path= JoinController.class.getResource("/").getPath();
		path= path.substring(0, path.lastIndexOf("/"));
		path= path.substring(0, path.lastIndexOf("/"));
		path= path.substring(0, path.lastIndexOf("/"));
		path=path+"/";
		return path;    
	}
}

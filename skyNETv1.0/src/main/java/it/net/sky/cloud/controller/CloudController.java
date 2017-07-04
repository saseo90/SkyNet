package it.net.sky.cloud.controller;



import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import it.net.sky.cloud.service.CloudService;
import it.net.sky.cloud.vo.CloudCount;
import it.net.sky.cloud.vo.CloudFileHistory;
import it.net.sky.cloud.vo.CloudFileInfo;
import it.net.sky.cloud.vo.DownloadView;
import it.net.sky.cloud.vo.MyDriveCount;
import it.net.sky.util.session.SessionUtil;

/**
 * 일반사원의 클라우드 접속 
 * 
 * @author pc25
 *
 */
@Controller
public class CloudController {
	@Resource(name="cloudService")
    CloudService service;

    @Value("#{memberProp.cloudPath}")
    File saveFolder;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	/**
	 * 1.신규계정 접속화면
	 * IP 필터검사 확인?: 없으면 return '접속권한부재' 
	 * 세션 존재여부 확인  : 없으면 return '홈'
	 * 
	 */
	@RequestMapping(value="/cloud")
	public String main(){
		//@RequestParam("users") List<String> list
		//세션비교 해 본인 클라우드가 있는지 확인함
		String user = "대추나무";
		try {
			user = (String) SessionUtil.getAttribute("id");

			//ser = "TM000001"; 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
        if(service.countCloud(user)>0){//나의 기본 클라우드가 있는 경우
            return "redirect:/cloud/"+user; 
        }else{//세션이 있지만 클라우드가 없는 경우
            return "cloud/new";
        }
	}
	/**
	 * 1.2.나의 클라우드
	 * 
	 * 본인이 아닐경우 메인으로 이동
	 * 클라우드 존재여부 확인 
	 * : 없으면 return cloud/new   튜토리얼 추가예정
	 * : 있으면 return cloud/cloud
	 * 
	 */
	@RequestMapping(value="/cloud/{cloudUser}")
	public String main(@PathVariable String cloudUser){
		//세션과 cloudUser 비교해 접속가능 판단함  
		String user = "대추나무";
		try {
			user = (String) SessionUtil.getAttribute("id");
			//System.out.println("id : "+user);
			//user = "TM000001"; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		if(!cloudUser.equals(user)){//본인이 아닐경우
			return "redirect:/";
		}else if(service.countCloud(user)>0){
			log.debug("1===============================");
			return "cloud/cloud";
		}else{
			log.debug("2===============================");
			return "cloud/new";
		}
	}
	/**
	 * 2.클라우드 신규생성
	 * 파라미터 세션 아이디 획득함
	 * 등록성공한 경우 return redirect:/cloud";
	 * 
	 */
	@RequestMapping(value="/cloud/createCloudUser")
	public String createCloudUser(){
		int tmp0 = -1;
		//세션과 cloudUser 비교해 접속가능 판단함  
		try {
			String user = (String) SessionUtil.getAttribute("id");
			//user = "TM000001"; 
			tmp0 = service.createCloudUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(tmp0>0){//클라우드 등록성공한 경우
			log.debug("1===============================");
			return "redirect:/cloud";
		}else{//실패하면 다시 이동
			log.debug("2===============================");
			return "cloud/new";
		}
	}

	/**
	 * 2.0.폴더생성
	 */
	@RequestMapping(value="/cloud/newfolder")
	public String insertFordel(){
		boolean flag = true;
		if(service.countCloud("TM000001")>0){
			return "cloud/cloud";	
		}else{
			return "cloud/new";
		}
	}
	/**
	 * 2.1.그룹신규생성
	 */
	@RequestMapping(value="/cloud/newgroup")
	public String insertGroupCloud(){
		boolean flag = true;
		if(service.countCloud("TM000001")>0){
			return "cloud/cloud";	
		}else{
			return "cloud/new";
		}
	}
	
	/**
	 * 3.파일업로드
	 * 
	 * 파라미터 파일 ,그룹번호,
	 * 
	 * 세션
	 * 
	 */
	@RequestMapping(value="cloud/fileUpload",method=RequestMethod.POST)
	public @ResponseBody List<Boolean> insertFile(@RequestParam List<MultipartFile> filedata){
	    System.out.println("파일업로드 컨트롤러 : "+filedata.toString());
	    List<Boolean> result = service.insertMycloudFile(filedata);
		return result;
	}
	/**
	 * 4.다운로드 
	 * 단일 과 다중 구분함
	 * 다중일 때 zip 파일 압축해 출력함
	 */
	@RequestMapping(value="cloud/fileDouwnload")
	public void douwnloadFile(Model model ,Integer fileNo,HttpServletRequest rq,HttpServletResponse rs){
		DownloadView downloadView = new DownloadView();
		
	    Map<String,Object> result = service.downLoadFile(fileNo);
	    File file = (File)result.get("file");
	    String oriname = (String)result.get("oriname");
       // model.addAttribute("filename",filename);
      //  model.addAttribute("downloadFile",file);
        Map<String, Object> model2 = new HashMap<>();
        model2.put("downloadFile", file);
        model2.put("filename", oriname);
		try {
			downloadView.getRender(model2, rq, rs);
		} catch (Exception e) {
			e.printStackTrace();
		};
		
	}
	/**
	 * 5.1.1.파일정보 변경 - 이동 : 삭제
	 * 
	 * 휴지통으로 이동
	 * 
	 */
	@RequestMapping(value="cloud/fileMove0")
	public @ResponseBody boolean updateFileDelete(@RequestParam List<Integer> fileNo){
		boolean result = false;
		        result = service.moveGavage(fileNo);
		return  result;
	}
	/**
	 * 5.1.2.파일정보 변경 - 이동 : 삭제
	 * 
	 * 휴지통에서 복원
	 * 
	 */
	@RequestMapping(value="cloud/fileMove1")
	public @ResponseBody boolean  updateFileRestoration(@RequestParam List<Integer> fileNo){
		boolean result = false;
        	result = service.recoverGavage(fileNo);
        return  result;
	}
	/**
	 * 5.1.3.파일정보 변경 - 이동 : 경로변경
	 */
	@RequestMapping(value="cloud/fileMove2")
	public String updateFileDiv(){
		boolean flag = true;
		if(service.countCloud("TM000001")>0){
			return "cloud/cloud";	
		}else{
			return "cloud/new";
		}
	}

	/**
	 * 5.2.파일정보 변경 - 이름 : 이름변경
	 * 
	 */
	@RequestMapping(value="cloud/fileMove3")
	public String updateFileName(){
		boolean flag = true;
		if(service.countCloud("TM000001")>0){
			return "cloud/cloud";	
		}else{
			return "cloud/new";
		}
	}
	
	/**
	 * 6.1.조회 : 파일상세정보
	 * 
	 * (유형,크기,위치(디렉토리),소유자,수정한 날짜,열어본날짜,만든날짜,설명,공유여부,공유부서)
	 * 파라미터 파일의 번호
	 * 
	 */
	@RequestMapping(value="cloud/fileInfo")
	public String selectFileInfo(){
		boolean flag = true;
		if(service.countCloud("TM000001")>0){
			return "cloud/cloud";	
		}else{
			return "cloud/new";
		}
	}
	/**
	 * 6.2.조회 : 파일활동
	 * 
	 * 파라미터 파일의 번호
	 * 
	 * 이력 : 생성, 경로이동 ,수정(복사 ,내용수정 ,이름변경,)
	 * 
	 */
	@RequestMapping(value="cloud/fileHistory")
	public @ResponseBody List<CloudFileHistory> selectFileHistory(@RequestParam Integer fileNo){
		return 	service.selectFileHistory(fileNo);
	}
	/**
	 * 6.3.조회 : 디렉토리 내 검색
	 * 
	 * 파라미터 클라우드_그룹 번호 와 디렉토리
	 * (특정 디렉토리 내 검색 ,검색조건 : 다일이름 또는 디렉토리이름)
	 * 
	 * 
	 */
	@RequestMapping(value="cloud/selectMyMsgCount")
	public String selectFileSearch(){
		boolean flag = true;
		if(service.countCloud("TM000001")>0){
			return "cloud/cloud";	
		}else{
			return "cloud/new";
		}
	}
	/**
	 * 7.1.통계 :
	 * 파라미터 : 클라우드유저번호
	 * 결과 : 클라우드 사용여부 ,사용량 , 남은 사용량
	 * 
	 */
	@RequestMapping(value="cloud/myCloudCount")
	public @ResponseBody CloudCount selectCloudCoudnt(){
		CloudCount result = null;
		try {
			String id = (String)SessionUtil.getAttribute("id");
			result = service.selectMyCloudCount(id);
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 내 클라우드 의 사원그룹의 파일리스트
	 * 
	 * @param 
	 * 파라미터 : -1 내 그룹 파일 0 문서 1 사진 2 동영상 3 음악 4 휴지통
	 */
	@RequestMapping(value="cloud/selectMyCloudFileList")
    public @ResponseBody List<CloudFileInfo> selectMyCloudFileList(@RequestParam Integer param, @RequestParam Integer dir){
	   List<CloudFileInfo> result = null;
       try {
           result = service.selectMyCloudFileList((String)SessionUtil.getAttribute("id"),param,dir);
       } catch (Exception e) {
        e.printStackTrace();
       }
       //System.out.println(result.toString());
       return result;
    }
	/**
	 * 멀티다운로드
	 */
	@RequestMapping(value="cloud/multidownload")
	public void douwnloadFile2(Model model ,@RequestParam  List<Integer> fileNo,HttpServletRequest rq,HttpServletResponse rs){
		rs.setContentType("application/download;charset=UTF-8");
		DownloadView downloadView = new DownloadView();
        
        Map<String,Object> result = service.multiDownLoadFile(fileNo,rq);
        File file = (File) result.get("file");
        String zipname = (String)result.get("zipname");
        
        Map<String, Object> model2 = new HashMap<>();
        model2.put("downloadFile", file);
        model2.put("filename", zipname );
        try {
            downloadView.getRenderMeulti(model2, rq, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	/**
	 * 다운로드 테스트 URL
	 */
	@RequestMapping(value="cloud/testUrl")
    public @ResponseBody List<Integer> cloudTestUrl(@RequestParam List<Integer> fileNo){
       return fileNo;
    }
	
	/**
	 * 내 드라이브 파일개수 카운팅
	 * 결과 : 내드라이브 파일개수, 내 휴지통 파일개수
	 */
	@RequestMapping(value="cloud/myDriverCount")
    public @ResponseBody  MyDriveCount selectMyDriveCount(){
       return service.selectMyDriveCount();
    }
	/**
	 * 파일공유하기
	 * 
	 */
	@RequestMapping(value="cloud/sendGongYou")
    public @ResponseBody String sendGongYou(@RequestParam List<String>user ,@RequestParam List<String>option,@RequestParam Integer fileNo,HttpServletRequest rq){
		try {
			rq.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		service.sendGongYou(user, option, fileNo);
		return "성공";
    }
	/**
	 * 공유받은 파일 다운로드
	 */
	@RequestMapping(value="cloud/gongyouFileDouwnload")
	public void downlaodGongYou(Model model ,@RequestParam Integer fileNo, @RequestParam String cloudUser ,HttpServletRequest rq,HttpServletResponse rs){
		try {
			rq.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		DownloadView downloadView = new DownloadView();
		
	    Map<String,Object> result = service.downLoadFile(fileNo,cloudUser);
	    File file = (File)result.get("file");
	    String oriname = (String)result.get("oriname");
       // model.addAttribute("filename",filename);
      //  model.addAttribute("downloadFile",file);
        Map<String, Object> model2 = new HashMap<>();
        model2.put("downloadFile", file);
        model2.put("filename", oriname);
		try {
			downloadView.getRender(model2, rq, rs);
		} catch (Exception e) {
			e.printStackTrace();
		};
		
	}
	/**
	 * 파일완전 삭제
	 */
	@RequestMapping(value="cloud/deleteMyFile")
	public @ResponseBody List<Boolean> deleteMyFile(@RequestParam List<Integer> fileNo) {
		List<Boolean> result = service.deleteMyFile(fileNo);
		return result;
	}
}

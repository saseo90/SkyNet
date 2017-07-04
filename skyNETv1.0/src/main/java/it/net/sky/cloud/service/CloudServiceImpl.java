package it.net.sky.cloud.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import it.net.sky.cloud.dao.CloudDao;
import it.net.sky.cloud.vo.CloudCount;
import it.net.sky.cloud.vo.CloudFileHistory;
import it.net.sky.cloud.vo.CloudFileInfo;
import it.net.sky.cloud.vo.CloudGroupVo;
import it.net.sky.cloud.vo.MyDriveCount;
import it.net.sky.login.vo.LoginVo;
import it.net.sky.message.dao.MessageDao;
import it.net.sky.message.vo.MessageVo;
import it.net.sky.util.session.SessionUtil;
import it.net.sky.util.websocket.AlarmWebSocketHandler;


@Service(value="cloudService")
public class CloudServiceImpl implements CloudService{
	
    @Value("#{memberProp.cloudPath}")
    File saveFolder;
    
    
    
	@Resource(name="cloudDao")
	private CloudDao dao;
	
	@Resource(name="messageDao")
	private MessageDao msgDao;

	@Override
	public int countCloud(String cloudUser) {
		int result = -1;
		try {
			result = dao.countCloud(cloudUser);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Transactional
	@Override
	public int createCloudUser(String cloudUser) {
		int result = -1;
		try {
			Map<String, Object> cloudUserMap = new HashedMap();
			cloudUserMap.put("cloudUser", cloudUser);
			int cloudSeq = dao.selectCloudVal();
			cloudUserMap.put("cloudNum", cloudSeq);
			result = dao.createCloudUser(cloudUserMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public CloudCount selectMyCloudCount(String cloudUser){
		CloudCount result = null;
		try {
			CloudCount vo = new CloudCount();
			vo.setCloudUser(cloudUser);
			result = dao.selectMyCloudCount(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

    @Override
    public List<CloudFileInfo> selectMyCloudFileList(String cloudUser,Integer param,Integer dir){
        List<CloudFileInfo> result = null;
        Map<String,Object> cloudUserMap = new HashMap<String, Object>();
        cloudUserMap.put("cloudUser", cloudUser);
        //-1 내 그룹 파일 0 문서 1 사진 2 동영상 3 음악 4 휴지통 
        // 0 내드라이브   1 휴지통  삭제여부
        try {
            if(param == -1 ){
                result = dao.selectMyCloudFileList(cloudUserMap);                
            }else if(param == 0 && dir >= 0 && dir < 2){
                cloudUserMap.put("fileType", 0);
                cloudUserMap.put("fileDel", dir);
                result = dao.selectMyCloudFileTypeList(cloudUserMap);
            }else if(param == 1 && dir >= 0 && dir < 2){
                cloudUserMap.put("fileType", 1);
                cloudUserMap.put("fileDel", dir);
                result = dao.selectMyCloudFileTypeList(cloudUserMap);
            }else if(param == 2 && dir >= 0 && dir < 2){
                cloudUserMap.put("fileType", 2);
                cloudUserMap.put("fileDel", dir);
                result = dao.selectMyCloudFileTypeList(cloudUserMap);
            }else if(param == 3 && dir >= 0 && dir < 2){
                cloudUserMap.put("fileType", 3);
                cloudUserMap.put("fileDel", dir);
                result = dao.selectMyCloudFileTypeList(cloudUserMap);
            }else if(param == 4 ){//휴지통
            	result = dao.selectMyGabege(cloudUserMap);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    @Override
    public List<Boolean> insertMycloudFile(List<MultipartFile> filedata) {
    	List<Boolean> result = new ArrayList<>();
        int insertResult = -1;
        File file ;
        CloudFileInfo info = null;
       
        for (MultipartFile multipartFile : filedata) {
        	info = new CloudFileInfo();
            try {
            	Map<String,Object> downloadMap = new HashMap<String, Object>();
            	downloadMap.put("cloudUser", (String)SessionUtil.getAttribute("id"));
            	CloudGroupVo vo = dao.cloudFileInsertMyGroupInfo(downloadMap);
            	int fileNo = dao.selectFileVal();
            	String fileUser =(String)SessionUtil.getAttribute("id");
            	String oriName  = multipartFile.getOriginalFilename();
            	String fileName = fileUser+"_cloud_"+fileNo +"_"+oriName;//사원번호_cloud_경로_파일시퀀스
            	String fileType = "";
            	String typeTmp = oriName.substring(oriName.lastIndexOf(".")+1);
            	System.out.println(typeTmp);
            	switch (typeTmp){
	        	    case "xlsx" : fileType = "0";//문서
	        	    case "xls"  : fileType = "0";//문서
	        	    case "txt"  : fileType = "0";//문서
	        	    case "rtf"  : fileType = "0";//문서
	        	    case "hwp"  : fileType = "0";//문서
	        	    case "asv"  : fileType = "0";//문서
	        	    case "pdf"  : fileType = "0";//문서
	        	    case "doc"  : fileType = "0";//문서
	        	    case "ppt"  : fileType = "0";//문서
	        	    case "mdb"  : fileType = "0";//문서
	        	    case "html" : fileType = "0";//문서
	        	    case "docx" : fileType = "0";//문서
	        	    case "sql"  : fileType = "0";//문서
	        	    break;
            	    case "png"  : fileType = "1";//사진
            	    case "gif"  : fileType = "1";//사진
            	    case "bmp"  : fileType = "1";//사진
            	    case "jpeg" : fileType = "1";//사진
            	    case "jpg"  : fileType = "1";//사진           	    
            	    break;
            	    case "avi"  : fileType = "2";//동영상
            	    case "mov"  : fileType = "2";//동영상
            	    case "mpg"  : fileType = "2";//동영상
            	    case "mpeg" : fileType = "2";//동영상
        	        break;
            	    case "mp3" : fileType = "3";//음악
            	    case "wav" : fileType = "3";//음악
            	    case "mid" : fileType = "3";//음악
            		break;
            		default    : fileType = "0";
            	}
            	
            	info.setFileNo(fileNo);//파일번호
            	info.setFileGroup((int)vo.getGroupNo());//그룹번호
            	info.setGorupSeq((int)vo.getGroupSeq());//클라우드 번호
            	info.setFileName(fileName);//파일이름
            	info.setFileUser(fileUser);//파일소유자
                info.setFileSize(Math.round(multipartFile.getSize()));
                info.setFileType(fileType);//타입
                info.setFileOriName(oriName);//원본이름
                info.setFileDirectory("내드라이브");//경로
            	insertResult = dao.insertFile(info);//디비에 정보
				if(insertResult > 0){//디비에 정보가 입력됬을 때 파일생성한다.
					file = new File(saveFolder,fileName);
					multipartFile.transferTo(file);
					result.add(new Boolean(true));
				}else{
					result.add(new Boolean(false));	
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

        }
        return result;
    }

    @Transactional
    @Override
    public Map<String,Object> downLoadFile(Integer fileNo) {
        Map<String,Object> result = new HashedMap();
        Map<String,Object> downloadMap = new HashMap<>();
        String oriname  = "";
        String uniqname = "";
        try {
            downloadMap.put("cloudUser",(String)SessionUtil.getAttribute("id"));
            downloadMap.put("fileNo", fileNo);
            //System.out.println("검색조건 : "+downloadMap);
            CloudFileInfo fileInfo = dao.selectDownloadFileInfo(downloadMap);
            oriname = fileInfo.getFileOriName();
            uniqname = fileInfo.getFileName();
           // System.out.println(HtmlRead.getPath()+saveFolder.getPath());
            //System.out.println("검색결과 : "+ fileInfo);
            File file = new File(saveFolder,uniqname);
            result.put("file", file);
            result.put("oriname", oriname);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    @Transactional
    @Override
    public Map<String,Object> multiDownLoadFile(List<Integer> fileNo, HttpServletRequest request) {
        Map<String,Object> result = new HashedMap();

        File file;
        String zipname  = "";
        String uniqname = "";
        String oriname = "";
        
        int bufSize = 1024;
        byte[] buf = new byte[1024];
        List<File> files = new ArrayList<>();
        try {
            //파일 로딩
            for (Integer integer : fileNo) {
                Map<String,Object> downloadMap = new HashMap<>();
                downloadMap.put("cloudUser",(String)SessionUtil.getAttribute("id"));
                downloadMap.put("fileNo", integer);
                //System.out.println("검색조건 : "+downloadMap);
                CloudFileInfo fileInfo = dao.selectDownloadFileInfo(downloadMap);
                oriname = fileInfo.getFileOriName();
                uniqname = fileInfo.getFileName();
                //System.out.println(HtmlRead.getPath()+saveFolder.getPath());
                file = new File(saveFolder,uniqname);
               // file.renameTo(new File(saveFolder,oriname));
                files.add(file);
            }
            
            zipname = files.get(0).getName().substring(files.get(0).getName().lastIndexOf("_")+1,files.get(0).getName().lastIndexOf("."))+".zip";
            String path = request.getSession().getServletContext().getRealPath("/cloudsave");
            String zipfileotnmae =path+zipname;
           // System.out.println(zipfileotnmae);
            File zipFile = new File(zipfileotnmae);
           //1.ZIP 파일 생성
            ZipOutputStream zipOut = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(zipFile)));
            FileInputStream fs= null;
            BufferedInputStream in =  null;
            //2.ZIP 파일 내 압축
            for (File filez : files) {
                //2.1.zip 파일 내 파일엔트리 추가
                zipOut.putNextEntry(new ZipEntry(filez.getName()));
                //2.2.해당 파일 데이터 읽기
                fs = new FileInputStream(filez);
                in = new BufferedInputStream(fs,bufSize);
                
                int data = 0;
                while ((data = in.read(buf)) > 0) {
                   zipOut.write(buf, 0, data);
                }
                //하나의 파일을 압축하였다.
                zipOut.closeEntry();
                in.close();
            }
            //완료
            zipOut.close();
            result.put("file", zipFile);
            result.put("zipname", zipname);
            

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    @Override
    public boolean moveGavage(List<Integer> fileNos) {
    	boolean result = false;
        try {
            String modUser = (String) SessionUtil.getAttribute("id");
            Map<String,Object> modmap = null;
            for (Integer fileno : fileNos) {
            	 modmap = new HashedMap();
            	 modmap.put("modUser", modUser);
            	 modmap.put("fileNo", fileno);
               if(dao.cloudMoveGabege(modmap) >0){            	   
            	  dao.cloudMoveGabegeHistory(modmap);
               }
            }
            result=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
	@Override
	public boolean recoverGavage(List<Integer> fileNos) {
		boolean result = false;
        try {
            String modUser = (String) SessionUtil.getAttribute("id");
        	Map<String,Object> modmap = null;
            for (Integer fileno : fileNos) {
            	modmap = new HashedMap();
            	modmap.put("modUser", modUser);
            	modmap.put("fileNo", fileno);
               if(dao.cloudRecorvertGabege(modmap) >0){            	   
            	  dao.cloudRecorvertGabegeHistory(modmap);
               }
            }
            result=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
	}

	@Override
	public List<CloudFileHistory> selectFileHistory(Integer fileNo) {
		List<CloudFileHistory> result = null;
		Map<String,Object> fileHistoryMap = new HashedMap();
		try {
			fileHistoryMap.put("fileNo", fileNo);
			result = dao.cloudSelectFileHistory(fileHistoryMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MyDriveCount selectMyDriveCount() {
		MyDriveCount result = null;
		Map<String,Object> myCountMap = new HashedMap();
		try {
			String cloudUser = (String) SessionUtil.getAttribute("id");
			myCountMap.put("cloudUser", cloudUser);
			result = dao.selectMyDriveCount(myCountMap);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void sendGongYou(List<String> users, List<String> option, Integer fileNo) {
		AlarmWebSocketHandler handle = new AlarmWebSocketHandler();
		MessageVo vo = new MessageVo();
		String msg ="";

		try {
	  		   LoginVo login = (LoginVo) SessionUtil.getAttribute("login");
	  	       String sender = login.getMember_enum();
	  	       String senderName = login.getMember_name();
  			   if(option.contains("downloadOption")){
	 	  	       msg += "<span class='btn btn-social-icon btn-linkedin cloudGongYouDown'>";
		  	       msg += "<i class='fa fa-cloud-download'></i>";
		  	       msg += "</span>";
		  	       msg += "<label>즉시 다운로드</label>";
  			   }
  			   if(option.contains("cloudSaveOption")){
	  			   msg += "<span class='btn btn-social-icon btn-linkedin cloudGongYouSave'>";
	  	  	       msg += "<i class='fa fa-cloud-upload'></i>";
	  	  	       msg += "</span>";
	  	  	       msg += "<label>즉시 다운로드</label>";
  			   }
	  	       msg += "<input type='hidden' name='fileNo' value='"+fileNo+"'>";
	  	       msg += "<input type='hidden' name='cloudUser' value='"+sender+"'>";
	  		   for (String user : users) {
		  		   vo = new MessageVo();
		  		   vo.setMsgCont(msg);
		  		   vo.setMsgSender(sender);
		  		   vo.setMsgReceiver(user);
		  		   msgDao.sendMessage(vo);
		  		   handle.sendEventFILE(user,msg,senderName);
	//			    log.info("[메시지발송]["+user+"]에게 ["+msg+"]발송");
	       	   }//파라미터 : 보낸자 , 수신자 ,내용
	  		   Map<String,Object> memberNo = new HashedMap();
		  		 memberNo.put("fileNo",fileNo);
		  		 memberNo.put("modUser", sender);
	  		   //파일이력 등록
	  		   dao.insertGonyouHistory(memberNo);

	  	   } catch (Exception e) {
	  		   e.printStackTrace();
	  	   }
		
		
	}

	@Override
	public Map<String, Object> downLoadFile(Integer fileNo, String cloudUser) {
		Map<String,Object> result = new HashedMap();
        Map<String,Object> downloadMap = new HashMap<>();
        String oriname  = "";
        String uniqname = "";
        try {
            downloadMap.put("cloudUser",cloudUser);
            downloadMap.put("fileNo", fileNo);
            //System.out.println("검색조건 : "+downloadMap);
            CloudFileInfo fileInfo = dao.selectDownloadFileInfo(downloadMap);
            oriname = fileInfo.getFileOriName();
            uniqname = fileInfo.getFileName();
           // System.out.println(HtmlRead.getPath()+saveFolder.getPath());
            //System.out.println("검색결과 : "+ fileInfo);
            File file = new File(saveFolder,uniqname);
            result.put("file", file);
            result.put("oriname", oriname);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
	}


	@Override
	public List<Boolean> deleteMyFile(List<Integer> fileNos) {
		List<Boolean> results = new ArrayList<Boolean>();
        Map<String,Object> downloadMap = new HashMap<>();
		try {
			downloadMap.put("cloudUser",(String)SessionUtil.getAttribute("id"));
			for (Integer fileNo : fileNos) {
				downloadMap.put("fileNo", fileNo);
				results.add(fileDelete(downloadMap));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return results;
	}
	@Transactional
	public boolean fileDelete(Map<String,Object> downloadMap){
		boolean result = false;
		try {
			CloudFileInfo fileInfo = dao.selectDownloadFileInfo(downloadMap);
			String uniqname = fileInfo.getFileName();
			//파일이력 삭제
			int tmp = dao.deleteFileHistory(downloadMap);
			if(tmp >-1){
			    dao.deleteFileInfo(downloadMap);
			    //실제파일 삭제
			    File file = new File(saveFolder,uniqname);
			    result = file.delete();
			    result = true;			    
			}
			//파일정보 삭제
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}

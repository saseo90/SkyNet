package it.net.sky.cloud.vo;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
@Component("downloadView")
public class DownloadView extends AbstractView {
	Map<String, Object> model;
	HttpServletRequest rq;
	HttpServletResponse rs;
    public DownloadView(){
        setContentType("application/download;charset=UTF-8");
    }
    
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest rq, HttpServletResponse rs) throws Exception {
       File file = (File) model.get("downloadFile");
       String tmp = (String) model.get("filename");
       System.out.println("파일 이름 : "+tmp);
       rs.setCharacterEncoding("UTF-8");
       rs.setContentType(super.getContentType());
       rs.setContentLength((int) file.length());
       String userAgent = rq.getHeader("User-Agent");
       boolean ie = userAgent.indexOf("Trident") > -1;
       String fileName = null;
       if(ie){
//           fileName = URLEncoder.encode(file.getName(),"UTF-8");
           fileName = URLEncoder.encode(tmp,"UTF-8");
       }else{
           fileName = new String(tmp.getBytes("UTF-8"),"iso-8859-1");
           //fileName = new String(tmp);
       }
       rs.setHeader("Content-Disposition", "attachment;fileName="+fileName+";");
       rs.setHeader("Content-Transfer-Encoding", "Binary");
       OutputStream out = null;
       FileInputStream fis = null;
       
       out = rs.getOutputStream();
       fis = new FileInputStream(file);
       FileCopyUtils.copy(fis, out);
       if(fis != null){fis.close();}
       if(out != null){out.flush();out.close();}
    }
    public void getRender(Map<String, Object> model, HttpServletRequest rq, HttpServletResponse rs) throws Exception{
    	this.model =model;
    	this.rq =rq;
    	this.rs =rs;
    	this.renderMergedOutputModel(model, rq, rs);
    };
    
    public void getRenderMeulti(Map<String, Object> model, HttpServletRequest rq, HttpServletResponse rs) throws Exception{
    	this.model =model;
    	this.rq =rq;
    	this.rs =rs;
    	this.renderMergedOutputModel(model, rq, rs);
    	File file = (File) model.get("downloadFile");
    	file.delete();
    }
   
    

}
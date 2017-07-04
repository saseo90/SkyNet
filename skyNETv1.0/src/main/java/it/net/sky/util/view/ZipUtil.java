package it.net.sky.util.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.springframework.beans.factory.annotation.Value;



/**
 * 참고 Url : http jazzlib.sourceforge.net/
 * 참고  url : http www.oraclejavanew.kr/bbs/board.php?bo_table=LecJava&wr_id=461
 * 참고 Url : http develop.sunshiny.co.kr/427
 * 참고 Url : http genius3k.tistory.com/entry/java-zip%EC%9C%BC%EB%A1%9C-%EC%95%95%EC%B6%95%EC%8B%9C-%ED%95%9C%EA%B8%80%EA%B9%A8%EC%A7%90-%ED%95%B4%EA%B2%B0%EB%B0%A9%EB%B2%95
 * 
 * 
 * 압축파일 생성
 * 
 * 1.
 * 
 * @author LEE SEONG-HYUN
 *
 */
public class ZipUtil {
    //버퍼 사이즈를 정한다. 한번에 1024byte를 읽어온다.
    private static final byte[] buf = new byte[1024];
    
    @Value("#{memberProp.cloudPath}")
    File saveFolder;
    
    /**
     * 파일만 압축하기
     * @param files[]
     * @throws Exception
     */
    public void crateZip(File[] files) throws Exception{
        //1.ZIP 파일 생성
        ZipOutputStream zipOut = new ZipOutputStream(new FileOutputStream(new File(".zip")));
        FileInputStream in = null;
        //2.ZIP 파일 내 압축
        for (File file : files) {
            //2.1.zip 파일 내 파일엔트리 추가
            zipOut.putNextEntry(new ZipEntry(file.getName()));
            //2.2.해당 파일 데이터 쓰기
            in = new FileInputStream(file);
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

    }
}
    



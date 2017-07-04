package it.net.sky.cloud.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import it.net.sky.cloud.vo.CloudCount;
import it.net.sky.cloud.vo.CloudFileHistory;
import it.net.sky.cloud.vo.CloudFileInfo;
import it.net.sky.cloud.vo.MyDriveCount;

public interface CloudService {
	/**
	 * 클라우드 접속시 계정 존재여부 확인
	 *  
	 */
	public int countCloud(String cloudUser);
	/**
	 * 클라우드 계정생성
	 * 
	 */
	public int createCloudUser(String cloudUser);
	/**
	 * 통계
	 */
	public CloudCount selectMyCloudCount(String cloudUser);
	/**
	 * 계정이 해당 그룹내 소유한 해당 디렉토리내 파일목록 
	 * 사원 테이블의 내것 이기 때문에 
	 * 파리미터 는 사원번호
	 * 
	 * */
	public List<CloudFileInfo> selectMyCloudFileList(String attribute, Integer param, Integer dir);
	/**
	 * 파일저장
	 * 
	 */
	public List<Boolean> insertMycloudFile(List<MultipartFile> fileData);
	/**
	 * 파일다운로드
	 */
	public Map<String,Object> downLoadFile(Integer fileNo);
	/**
	 * 멀티 다운로드
	 * @param fileNo
	 * @return
	 */
	public Map<String,Object> multiDownLoadFile(List<Integer> fileNo, HttpServletRequest request);
	/**
	 * 내파일 휴지통 이동
	 * 파라미터 사원번호,파일번호
	 * 결과 boolean
	 */
	public boolean moveGavage(List<Integer> fileNo);
	/**
	 * 내파일 휴지통 복원
	 */
	public boolean recoverGavage(List<Integer> fileNo);
	/**
	 * 파일 활동이력 조회 - 단일 검색 
	 * 파라미터 : 파일번호
	 */
	public List<CloudFileHistory> selectFileHistory(Integer fileNo);
	/**
     * 내 드라이브 의 파일 카운팅
     * 파라미터 : 사원번호
     * 결과     : 내드라이브 파일개수 , 내휴지통 파일개수
     * 
     */
    public MyDriveCount selectMyDriveCount();
    /**
     * 파일공유하기
     *  파라미터 : 유저정보(사원번호), 파일번호, 옵션
     */
    public void sendGongYou(List<String>user , List<String>option, Integer fileNo);
    /**
     * 공유된 파일 다운로드
     * 
     */
    /**
	 * 파일다운로드
	 */
	public Map<String,Object> downLoadFile(Integer fileNo,String cloudUser);
	/**
	 * 파일 삭제
	 */
	public List<Boolean> deleteMyFile(List<Integer> fileNos);
    
}

package it.net.sky.cloud.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.cloud.vo.CloudCount;
import it.net.sky.cloud.vo.CloudFileHistory;
import it.net.sky.cloud.vo.CloudFileInfo;
import it.net.sky.cloud.vo.CloudGroupVo;
import it.net.sky.cloud.vo.CloudInsertVo;
import it.net.sky.cloud.vo.MyDriveCount;

public interface CloudDao {
	/**
	 * 클라우드 접속시 계정 존재여부 확인
	 *  
	 */
	public int countCloud(String cloudUser) throws SQLException;

	/**
	 * 클라우드 계정생성
	 * 
	 */
	public int createCloudUser(Map<String, Object> cloudUser) throws SQLException;
	/**
	 * 시퀀스 증가 후 반환
	 */
	public int selectCloudVal() throws SQLException;
	/**
	 * 그룹 생성
	 */
	public int createGroup(CloudInsertVo vo) throws SQLException;

	/**
	 * 통계
	 */
	public CloudCount selectMyCloudCount(CloudCount vo) throws SQLException;
	/**
     * 계정이 해당 그룹내 소유한 해당 디렉토리내 파일목록 
     * 사원 테이블의 내것 이기 때문에 
     * 파리미터 는 사원번호
     * 
     * */
    public List<CloudFileInfo> selectMyCloudFileList(Map<String, Object> cloudUser) throws SQLException;
    /**
     * 다운로드 위한 파일 정보
     * 
     */
    public CloudFileInfo selectDownloadFileInfo(Map<String, Object> downloadMap) throws SQLException;
    /**
     * 업로드 
     */
    public int insertFile(CloudFileInfo info) throws SQLException;
    /**
     * 파일업로드 시퀀스 증가후 반환
     */
    public int selectFileVal() throws SQLException;
    /**
     * 파일업로드 내 그룹정보 반화
     * 파라미터 : 내 사원번호
     */
    public CloudGroupVo cloudFileInsertMyGroupInfo(Map<String, Object> downloadMap) throws SQLException;
    /**
     * 파일이력 등록
     * 파라미터 : 
     * 
     */
    public void insertFileHistory() throws SQLException;
    /**
     * 파일조회 파입별 나의 파일목록
     * 파라미터 : 사원번호 , 타입번호
     * 
     */
    public List<CloudFileInfo> selectMyCloudFileTypeList(Map<String, Object> cloudUser) throws SQLException;
    /**
     * 휴지통 내 휴지통 조회
     * 파라미터 : 사원번호 
     */
    public List<CloudFileInfo> selectMyGabege(Map<String, Object> cloudUser) throws SQLException;
    
    /**
     * 파일 휴지통 이동
     */
    public int cloudMoveGabege(Map<String, Object>gabegeMap) throws SQLException;
    /**
     * 파일 이동 기록
     */
    public void cloudMoveGabegeHistory(Map<String, Object>gabegeMap) throws SQLException;
    /**
     * 파일 휴지통 복원
     */
    public int cloudRecorvertGabege(Map<String, Object>recorverMap) throws SQLException;
    /**
     * 파일 복원 기록
     */
    public void cloudRecorvertGabegeHistory(Map<String, Object> recorverMap) throws SQLException;
    /**
     * 파일이력조회
     */
    public List<CloudFileHistory> cloudSelectFileHistory(Map<String, Object> fileHistoryMap) throws SQLException;
    /**
     * 내 드라이브 의 파일 카운팅
     * 파라미터 : 사원번호
     * 결과     : 내드라이브 파일개수 , 내휴지통 파일개수
     * 
     */
    public MyDriveCount selectMyDriveCount(Map<String,Object> myCountMap) throws SQLException;
    /**
	 * 파일 활동이력 등록
	 * 공유활동
	 * 파라미터 파일보
	 */
	public int insertGonyouHistory(Map<String,Object> memberNo) throws SQLException;
	/**
	 * 파일정보 삭제
	 * 파라미터 파일번호 : 사원번호
	 */
	public int deleteFileInfo(Map<String,Object> fileNo) throws SQLException;
	/**
	 * 파일정보 삭제
	 * 이력정보
	 * 파라미터 파일번호:사원번호
	 */
	public int deleteFileHistory(Map<String,Object> fileNo) throws SQLException;
	
}

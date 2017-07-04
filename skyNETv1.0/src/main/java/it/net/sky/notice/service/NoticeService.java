package it.net.sky.notice.service;

import java.util.List;
import java.util.Map;

import it.net.sky.notice.vo.NoticeVo;

public interface NoticeService {
	
	/** 게시글 수 구하기 */
	public int getListCount(Map<String, Object> params);
	/** 목록 보기 */
	public List<NoticeVo> getNoticeList();
	/** 게시글 추가 */
	public int insertNotice(NoticeVo vo);
	/** 게시글 상세 */
	public NoticeVo selectNotice(int notice_num);
	/** 조회 수 증가 */
	public int updateReadCnt(int notice_num);
	/** 게시글 수정 */
	public int updateNotice(NoticeVo vo);
	/** 게시글 삭제 */
	public int deleteNotice(Map<String, Object> params);
	
}

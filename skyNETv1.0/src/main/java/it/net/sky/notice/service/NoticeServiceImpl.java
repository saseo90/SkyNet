package it.net.sky.notice.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.notice.dao.NoticeDao;
import it.net.sky.notice.vo.NoticeVo;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name="noticeDao")
	private NoticeDao dao;
	
	@Override
	public int getListCount(Map<String, Object> params) {
		int cnt = 0;
		try {
			cnt = dao.getListCount(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<NoticeVo> getNoticeList() {
		List<NoticeVo> list = null;
		try {
			list = dao.getNoticeList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertNotice(NoticeVo vo) {
		int cnt = 0;
		try {
			cnt = dao.insertNotice(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public NoticeVo selectNotice(int notice_num) {
		NoticeVo vo = null;
		try {
			vo = dao.selectNotice(notice_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int updateReadCnt(int notice_num) {
		int cnt = 0;
		try {
			cnt = dao.updateReadCnt(notice_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVo vo) {
		int cnt = 0;
		try {
			cnt = dao.updateNotice(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteNotice(Map<String, Object> params) {
		int cnt = 0;
		try {
			cnt = dao.deleteNotice(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}

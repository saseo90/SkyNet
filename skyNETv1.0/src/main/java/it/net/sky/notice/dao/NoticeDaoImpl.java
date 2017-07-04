package it.net.sky.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.notice.vo.NoticeVo;

@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSessionTemplate client;
	
	@Override
	public int getListCount(Map<String, Object> params) throws SQLException {
		return client.selectOne("notice.getListCount", params);
	}

	@Override
	public List<NoticeVo> getNoticeList() throws SQLException {
		return client.selectList("notice.getNoticeList");
	}

	@Override
	public int insertNotice(NoticeVo vo) throws SQLException {
		return client.insert("notice.insertNotice", vo);
	}

	@Override
	public NoticeVo selectNotice(int notice_num) throws SQLException {
		return client.selectOne("notice.selectNotice", notice_num);
	}

	@Override
	public int updateReadCnt(int notice_num) throws SQLException {
		return client.update("notice.updateReadCnt", notice_num);
	}

	@Override
	public int updateNotice(NoticeVo vo) throws SQLException {
		return client.update("notice.updateNotice", vo);
	}

	@Override
	public int deleteNotice(Map<String, Object> params) throws SQLException {
		return client.delete("notice.deleteNotice", params);
	}

}

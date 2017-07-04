package it.net.sky.suggest.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import it.net.sky.suggest.vo.SuggestVo;

public interface SuggestDao {

	//건의사항 글 쓰기
	public int writeSuggest(SuggestVo vo) throws SQLException;
	
	//건의사항 글 삭제
	public int deleteSuggest(int sug_num) throws SQLException;
	
	//건의사항 글 수정
	public int updateSuggest(SuggestVo vo) throws SQLException;
	
	//건의사항 글 상세보기
	public SuggestVo detailSuggest(int sug_num) throws SQLException;
	
	//글 전체목록 보기
	public List<SuggestVo> listAll() throws SQLException;
	
	//검색
	public List<SuggestVo> listAll(Map<String, Object> params) throws SQLException; 
		
	//조회수증가
	public int countUp(int sug_num) throws SQLException;
	
	//답글작성
	public int insertReply(SuggestVo vo) throws SQLException;
	
	//전체글 개수
	public int listCount(Map<String,Object> map) throws SQLException;

	//onum
	public int updateOnum(Map<String,Object> map) throws SQLException;

}

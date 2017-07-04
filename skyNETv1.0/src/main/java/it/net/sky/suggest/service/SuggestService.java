package it.net.sky.suggest.service;

import java.util.List;
import java.util.Map;

import it.net.sky.suggest.vo.SuggestVo;

public interface SuggestService {
	
	//건의사항 글 쓰기
	public int writeSuggest(SuggestVo vo)  ;
	
	//건의사항 글 삭제
	public int deleteSuggest(int sug_num)  ;
	
	//건의사항 글 수정
	public int updateSuggest(SuggestVo vo)  ;
	
	//건의사항 글 상세보기
	public SuggestVo detailSuggest(int sug_num)  ;
	
	//글 전체목록 보기
	public List<SuggestVo> listAll()  ;
	
	//검색
	public List<SuggestVo> listAll(Map<String, Object> params)  ; 
		
	//조회수증가
	public int countUp(int sug_num)  ;
	
	//답글작성
	public int insertReply(SuggestVo vo)  ;
	
	//전체글 개수
	public int listCount(Map<String,Object> map)  ;

	//onum
	public int updateOnum(Map<String,Object> map)  ;

}

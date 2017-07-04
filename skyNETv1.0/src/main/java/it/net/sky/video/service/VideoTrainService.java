package it.net.sky.video.service;

import java.util.List;
import java.util.Map;

import it.net.sky.video.vo.VideoBoardVo;

public interface VideoTrainService {
	public List<VideoBoardVo> selectvideo(String id);
	
	public void insertvideo(VideoBoardVo vo);
	
	public VideoBoardVo selectbnum(int bnum);
	
	public void updatevideo(VideoBoardVo vo);
	
	public void deletevideo(int bnum);
	
	
	//////////////////////////////////
	
	public Map<String,Integer> selectcount(String id);
	
	//////////////////////////////////
	
	public  List<VideoBoardVo>  selectbytype(Map<String,String> map);
}

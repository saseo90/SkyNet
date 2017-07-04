package it.net.sky.video.service;

import java.util.List;


import it.net.sky.video.vo.VideoCategoryVo;

public interface VideoCategoryService {
	
	
	public void insertcategory(VideoCategoryVo vo);
	
	public List<VideoCategoryVo> selecttypecategory();
	
	public void deletevideocategory(String type);
	
	public String typedistinct(String type);
}

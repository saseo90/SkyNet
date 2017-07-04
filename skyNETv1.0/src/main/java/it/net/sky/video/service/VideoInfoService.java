package it.net.sky.video.service;

import it.net.sky.video.vo.VideoInfoVo;

public interface VideoInfoService {
	public void insertvideoinfo(VideoInfoVo vo);
	
	public void deleteinfo(int bnum);
	
	public void updateinfo(int bnum);
}

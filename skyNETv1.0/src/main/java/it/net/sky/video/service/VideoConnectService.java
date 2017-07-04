package it.net.sky.video.service;


import it.net.sky.video.vo.ConnectVideoVo;

public interface VideoConnectService {
			
	public void insertvideocomplete(ConnectVideoVo vo);
	
	public ConnectVideoVo selectvideocomplete(ConnectVideoVo vo);
	
	public void updatevideocomplete(ConnectVideoVo vo);
	
	public void updateAllvideocomplete(ConnectVideoVo vo);
	
	public void deletevideocomplete(int bnum);
	
	

}

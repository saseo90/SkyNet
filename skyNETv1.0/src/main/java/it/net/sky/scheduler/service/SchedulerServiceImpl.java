package it.net.sky.scheduler.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.scheduler.dao.SchedulerDao;
@Service(value="schedulerservice")
public class SchedulerServiceImpl implements SchedulerService {
	@Resource(name="schedulerDao")
	SchedulerDao dao;
	@Override
	public void removeMemeo(){
		// TODO Auto-generated method stub
		try {
			dao.removeMemeo();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

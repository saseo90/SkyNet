package it.net.sky.scheduler.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("schedulerDao")
public class SchedulerDaoImpl implements SchedulerDao {
	@Autowired
	SqlSessionTemplate client;
	@Override
	public void removeMemeo() throws SQLException {
		// TODO Auto-generated method stub
		client.delete("scheduler.memo");
	}

}

package it.net.sky.cloud.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.cloud.vo.CloudCount;
import it.net.sky.cloud.vo.CloudFileHistory;
import it.net.sky.cloud.vo.CloudFileInfo;
import it.net.sky.cloud.vo.CloudGroupVo;
import it.net.sky.cloud.vo.CloudInsertVo;
import it.net.sky.cloud.vo.MyDriveCount;

@Repository(value="cloudDao")
public class CloudDaoImpl implements CloudDao{
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int countCloud(String cloudUser)throws SQLException {
		return session.selectOne("com.dao.cloud.clountCloud", cloudUser);
	}

	@Override
	public int createCloudUser(Map<String, Object> cloudUser) throws SQLException {
		return session.insert("com.dao.cloud.cloudNewUser", cloudUser);
	}

	@Override
	public int selectCloudVal() throws SQLException {
		return (int)session.selectOne("com.dao.cloud.selectCloudVal");
	}

	@Override
	public int createGroup(CloudInsertVo vo) throws SQLException {
		return (int)session.insert("com.dao.cloud.cloudNewCloud",vo);
	}

	@Override
	public CloudCount selectMyCloudCount(CloudCount vo) throws SQLException {
		return session.selectOne("com.dao.cloud.myCloudCount",vo);
	}

    @Override
    public List<CloudFileInfo> selectMyCloudFileList(Map<String, Object> cloudUser) throws SQLException {
        return session.selectList("com.dao.cloud.cloudSelectCloud",cloudUser);
    }

    @Override
    public CloudFileInfo selectDownloadFileInfo(Map<String, Object> downloadMap) throws SQLException {
    	return session.selectOne("com.dao.cloud.downloadFileInfo",downloadMap);
    }

	@Override
	public int insertFile(CloudFileInfo info) throws SQLException {
		return session.insert("com.dao.cloud.cludFileInsert",info);
	}

	@Override
	public int selectFileVal() throws SQLException {
		return session.selectOne("com.dao.cloud.insertFileVal");
	}

	@Override
	public CloudGroupVo cloudFileInsertMyGroupInfo(Map<String, Object> downloadMap) throws SQLException {
		return session.selectOne("com.dao.cloud.cloudFileInsertMyGroupInfo",downloadMap);
	}

    @Override
    public void insertFileHistory() throws SQLException {
        // TODO Auto-generated method stub
        
    }

    @Override
    public List<CloudFileInfo> selectMyCloudFileTypeList(Map<String, Object> cloudUser) throws SQLException {
        return session.selectList("com.dao.cloud.cloudSelectCloudType", cloudUser);
    }

    @Override
    public int cloudMoveGabege(Map<String, Object> gabegeMap) throws SQLException {
    	return session.update("com.dao.cloud.cloudMoveGabege", gabegeMap);
    }

    @Override
    public void cloudMoveGabegeHistory(Map<String, Object> gabegeMap) throws SQLException {
        session.insert("com.dao.cloud.cloudMoveGabegeHistory", gabegeMap);
    }

    @Override
    public int cloudRecorvertGabege(Map<String, Object> recorverMap) throws SQLException {
    	return session.update("com.dao.cloud.cloudRecorvertGabege", recorverMap);
    }

    @Override
    public void cloudRecorvertGabegeHistory(Map<String, Object> recorverMap) throws SQLException {
        session.insert("com.dao.cloud.cloudRecorvertGabegeHistory", recorverMap);  
    }

	@Override
	public List<CloudFileHistory> cloudSelectFileHistory(Map<String, Object> recorverMap) throws SQLException {
		return session.selectList("com.dao.cloud.cloudSelectFileHistory", recorverMap);
	}

	@Override
	public List<CloudFileInfo> selectMyGabege(Map<String, Object> cloudUser) throws SQLException {
		return session.selectList("com.dao.cloud.selectMyGabege", cloudUser);
	}

	@Override
	public MyDriveCount selectMyDriveCount(Map<String, Object> myCountMap) throws SQLException {
		return session.selectOne("com.dao.cloud.selectMyDriveCount", myCountMap);
	}

	@Override
	public int insertGonyouHistory(Map<String, Object> memberNo) throws SQLException {
		return session.insert("com.dao.cloud.gongyouHistory", memberNo);
	}
	@Override
	public int deleteFileInfo(Map<String, Object> fileNo) throws SQLException {
		return session.delete("com.dao.cloud.cloudFileInfoDelete", fileNo);
	}

	@Override
	public int deleteFileHistory(Map<String, Object> fileNo) throws SQLException {
		return session.delete("com.dao.cloud.cloudFilHistoryeDelete", fileNo);
	}

	
}

package com.pojo.step3;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import com.util.MyBatisCommonFactory;

public class MemberDao {
	Logger logger = Logger.getLogger(MemberDao.class);

	MyBatisCommonFactory mcf = new MyBatisCommonFactory();

	public Map<String, Object> login(Map<String, Object> pMap) {
		Map<String, Object> rmap = null;
		SqlSessionFactory sqlSessionFactory = null;
		SqlSession sqlSession = null;
		try {
			sqlSessionFactory = mcf.getSqlSessionFactory();
			sqlSession = sqlSessionFactory.openSession();
			rmap = sqlSession.selectOne("login", pMap);
			logger.info(rmap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rmap;
	}		
}

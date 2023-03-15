package com.pojo.step3;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MyBatisCommonFactory;
//@Service(mvc패턴을 공부중이므로)
//@Repository(원칙은)
public class CommonDao {
	Logger logger = Logger.getLogger(CommonDao.class);
	MyBatisCommonFactory mcf = new MyBatisCommonFactory();

	public List<Map<String, Object>> zipcodeList(Map<String, Object> pMap) {
		logger.info("zipcodeList 호출");
		List<Map<String, Object>> zList = null;
		SqlSessionFactory sqlSessionFactory = null;
		SqlSession sqlSession = null;
		try {
			sqlSessionFactory = mcf.getSqlSessionFactory();
			sqlSession = sqlSessionFactory.openSession();
			zList = sqlSession.selectList("zipcodeList", pMap);
			logger.info(zList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return zList;
	}
}

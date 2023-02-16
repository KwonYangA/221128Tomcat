package com.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import com.util.MyBatisCommonFactory;

public class TestDao {
	Logger logger = Logger.getLogger(TestDao.class);
	MyBatisCommonFactory mcf = new MyBatisCommonFactory();
	public List<Map<String, Object>> getBookMember(){
		List<Map<String, Object>> mList = null;
		SqlSessionFactory sqlSessionFactory = null;
		SqlSession sqlSession = null;
		try {
			sqlSessionFactory = mcf.getSqlSessionFactory();
			sqlSession = sqlSessionFactory.openSession();
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("mem_id", "tomato");
			pMap.put("mem_pw", "123");
			mList = sqlSession.selectList("getBookMember", pMap);
			logger.info(mList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mList;
	}
	public String testDate() {
		String cTime = null;
		SqlSessionFactory sqlSessionFactory = null;
		SqlSession sqlSession = null;
		try {
			sqlSessionFactory = mcf.getSqlSessionFactory();
			sqlSession = sqlSessionFactory.openSession();
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("mem_id", "tomato");
			pMap.put("mem_pw", "123");
			cTime = sqlSession.selectOne("testDate", pMap);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cTime;
	}
}

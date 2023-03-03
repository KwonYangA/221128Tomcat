package com.pojo.step2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.mvc.dao.TestDao;
import com.util.MyBatisCommonFactory;

public class Board2Dao {
	Logger logger = Logger.getLogger(Board2Dao.class);
	//이종간인 MyBatis연동에 필요한 공통 클래스 객체 주입 필요
	MyBatisCommonFactory mcf = new MyBatisCommonFactory();
	public List<Map<String, Object>> boardList() {
	logger.info("boardList 호출");
		List<Map<String, Object>> bList = null;
		SqlSessionFactory sqlSessionFactory = null;
		SqlSession sqlSession = null;
		try {
			sqlSessionFactory = mcf.getSqlSessionFactory();
			sqlSession = sqlSessionFactory.openSession();
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("mem_id", "tomato");
			pMap.put("mem_pw", "123");
			bList = sqlSession.selectList("boardList", pMap);
			logger.info(bList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bList;
	}
}

/*
 ActionServlet(페이지이동) - XXXController - XXXLogic - XXXDao - MyBatis Layer
*/

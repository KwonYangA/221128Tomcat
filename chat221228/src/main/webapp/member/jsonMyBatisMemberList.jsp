<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.util.*, java.util.*" %>    
<%@ page import="com.google.gson.Gson" %>    
<%@ page import="org.apache.ibatis.session.*" %>      
<%

	MyBatisCommonFactory mcf = new MyBatisCommonFactory();	
	List<Map<String, Object>> memList = null;
	SqlSessionFactory sqlSessionFactory = null;
	//SqlSession으로 commit과 rollback지원받음
	SqlSession sqlSession = null;
	Map<String, Object> pmap = new HashMap<>();
	pmap.put("mem_no",0);
	try {
		sqlSessionFactory = mcf.getSqlSessionFactory();
		sqlSession = sqlSessionFactory.openSession();
		//member.xml에서 id가 getMemberList를 찾아서 실행요처함
		memList = sqlSession.selectList("getMemberList", pmap);
		
	}catch(Exception e) {
		e.printStackTrace();
	}	
	Gson g = new Gson();
	String temp = null;
	temp = g.toJson(memList);
	out.print(temp);
%>

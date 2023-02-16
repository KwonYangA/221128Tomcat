package com.day1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

//서블릿은 java인데 브라우저에 출력할 수 있다 - 화면 그리는데 서블릿을 사용함 - 가능해
@WebServlet("/day1/html2.do") //웹에서 접근 가능한 맵핑 주소 설정
public class MimeHtmlServlet2 extends HttpServlet {
	Logger logger = Logger.getLogger(MimeHtmlServlet.class);

	@Override	
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
	 	throws ServletException, IOException
	 	{
			logger.info("doGet호출");
			HttpSession session = req.getSession();
			String myName = new String("이순신");
			int age = 30;
			session.setAttribute("myName", myName);
			session.setAttribute("age", age);
			res.sendRedirect("./mimeHtmlResult.jsp");
			Map<String, Object> rmap = new HashMap<>();
			rmap.put("mem_id", "ya");
			rmap.put("mem_pw", "111");
			rmap.put("mem_name", "양순");
			 List<Map<String, Object>> mList = new ArrayList<>();
			 if(rmap != null) {
				 rmap.clear();
			 }
			 rmap = new HashMap<>();
			 rmap.put("mem_id", "tomato");
			 rmap.put("mem_pw", "123");
			 rmap.put("mem_name", "토마토");
			 mList.add(rmap);
			 rmap = new HashMap<>();
			 rmap.put("mem_id", "kiwi");
			 rmap.put("mem_pw", "123");
			 rmap.put("mem_name", "키위");
			 mList.add(rmap);
			 rmap = new HashMap<>();
			 rmap.put("mem_id", "banana");
			 rmap.put("mem_pw", "123");
			 rmap.put("mem_name", "바나나");
			 mList.add(rmap);
			session.setAttribute("rmap", rmap);
			session.setAttribute("mList", mList);
			
			
		
	 	}
	 	
}

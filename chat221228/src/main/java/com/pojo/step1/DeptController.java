package com.pojo.step1;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

public class DeptController implements Action {
	Logger logger = Logger.getLogger(DeptController.class);

	//톰캣으로 부터 주입을 받는 것이 아니다.
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ActionForward af = new ActionForward();
		//FrontMVC1클래스에서 request 객체에 저장된 배열 꺼내기
		String upmu[] = (String[])req.getAttribute("upmu");
		DeptLogic deptLogic = new DeptLogic();
		String path = null; // 페이지 이름
		boolean isRedirect = false; // true : redirect, false :forward 
		// 너 부서목록 조회할거니?
		if ("getDeptList".equals(upmu[1])) {
			List<Map<String, Object>> deptList = deptLogic.getDeptList();
			req.setAttribute("deptList", deptList);
			path = "getDeptList.jsp"; // 응답페이지
			isRedirect = false; //false :forward, 요청이 유지- 주소창은 그대로인데 페이지는 바뀜
		}
		else if ("jsonDeptList".equals(upmu[1])) {
			String jsonDoc = deptLogic.jsonDeptList();
			req.setAttribute("jsonDoc", jsonDoc);
			path = "jsonDeptList.jsp";
			isRedirect = false; 
		}
		else if ("deptInsert".equals(upmu[1])) {
			// 너 부서등록하려구?			
			//insert into dept(deptno, dname, loc) values(?,?,?)			
			int result = deptLogic.deptInsert();
		}
		else if ("deptUpdate".equals(upmu[1])) {
			// 너 부서정보 수정해야돼?
			int result = deptLogic.deptUpdate();
		}
		else if ("deptDelete".equals(upmu[1])) {
			// 너 부서 없어졌다
			int result = deptLogic.deptDelete();
		}
		af.setPath(path);
		af.setRedirect(isRedirect);
		return af;
	}

	public ActionForward getDeptList() {
		// res.sendRedirect();
		return null;
	}

}

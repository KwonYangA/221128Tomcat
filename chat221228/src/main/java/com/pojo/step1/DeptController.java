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

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ActionForward af = new ActionForward();
		String upmu[] = (String[])req.getAttribute("upmu");
		DeptLogic deptLogic = new DeptLogic();
		String path = null;
		boolean isRedirect = false;
		// 너 부서목록 조회할거니?
		if ("getDeptList".equals(upmu[1])) {
			List<Map<String, Object>> deptList = deptLogic.getDeptList();
			req.setAttribute("deptList", deptList);
			path = "getDeptList.jsp";
			isRedirect = false; // false 이면 forward, 요청이 유지 된다. - 주소창은 그대로인데 페이지는 바뀜
		}
		else if ("jsonDeptList".equals(upmu[1])) {
			String jsonDoc = deptLogic.jsonDeptList();
			req.setAttribute("jsonDoc", jsonDoc);
			path = "jsonDeptList.jsp";
			isRedirect = false; // false 이면 forward, 요청이 유지 된다. - 주소창은 그대로인데 페이지는 바뀜
		}
		// 너 부서등록하려구?
		else if ("deptUpdate".equals(upmu[1])) {
			//insert into dept(deptno, dname, loc) values(?,?,?)
			int result = deptLogic.deptInsert();
		}
		// 너 부서정보 수정해야돼?
		else if ("deptDelete".equals(upmu[1])) {
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

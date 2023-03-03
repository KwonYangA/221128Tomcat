package com.pojo.step2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface Controller {

	public interface Action {
		public String execute(HttpServletRequest req, HttpServletResponse resp) 
				throws Exception;
	}

	String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}

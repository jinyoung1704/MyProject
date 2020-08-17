
 package com.my.controller;



import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

  @Controller 
  public class ListController
  {
	  
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	
	@RequestMapping(value = "/addList.action", method = RequestMethod.GET)
	public String cateList(Model model, String bid, HttpServletRequest request)
	{
		String view=null;
		
		view = "/index.jsp";
				
				
		return view;
	}
  
  
  }
 
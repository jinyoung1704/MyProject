
 package com.my.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.list.IListDAO;
import com.my.list.ListDTO;

  @Controller 
  public class ListController
  {
	  
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value = "/addList.action", method = RequestMethod.GET)
	public String addList(Model model, String bid, HttpServletRequest request)
	{
		String view=null;
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		System.out.println(name);
		System.out.println(url);
		
		try
		{
			IListDAO dao = SqlSession.getMapper(IListDAO.class);
			
			ListDTO dto = new ListDTO();
			
			dto.setName(name);
			dto.setUrl(url);
			
			dao.addList(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		view = "redirect:/main.action";
				
				
		return view;
	}
	
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String mainList(Model model, String bid, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String view=null;
		
		
		try
		{
			IListDAO dao = SqlSession.getMapper(IListDAO.class);
			
			model.addAttribute("lists", dao.lists());
			
			
			
		} catch (Exception e)
		{
		}
		
		
		view = "index.jsp";
				
				
		return view;
	}
	
	
	@RequestMapping(value = "/deletelist.action", method = RequestMethod.GET)
	public String deleteList(Model model, String bid, HttpServletRequest request)
	{
		String view=null;
		String name = null;
		HttpSession session = request.getSession();
		//System.out.println("1234");
		
		try
		{
			IListDAO dao = SqlSession.getMapper(IListDAO.class);
			name = request.getParameter("listname");
			System.out.println(name);
			
			dao.deleteList(name);
			
			
		} catch (Exception e)
		{
		}
		
		
		view = "redirect:/main.action";
				
				
		return view;
	}
  
  
  }
 
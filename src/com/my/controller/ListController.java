
 package com.my.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.util.IndexDTO;
import com.my.util.Paging;
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
	public String mainList(Model model, HttpServletRequest request)
	{
		String view=null;
		
		
		try
		{
			IListDAO dao = SqlSession.getMapper(IListDAO.class);
			
			
			int count = dao.getCount(); //count 함수 부르기
			
			// 두개 반드시 선언
			Paging paging = new Paging();
			String pageNum = request.getParameter("pageNum");		
			
			
			//테이블에서 가져올 리스트의 시작과 끝 위치
			int start = paging.getStart(pageNum,count );
			int end = paging.getEnd(pageNum, count);
			
			// 페이지번호를 받아온 
			String pageIndexList = paging.pageIndexList(pageNum, count);
			
			
			// 시작과 끝 dto에 담기( 여기선 IndexDTO로 했지만 매개변수로 DTO를 쓰고있는경우는 그 DTO안에 start,end만들어야함)
			IndexDTO dto = new IndexDTO();
			dto.setStart(start);
			dto.setEnd(end);
			
			// 리스트 불러올때 시작과 끝점 추가해야함 
			// 참고 com.banana.admin.IAdminPointDAO
			
			
			model.addAttribute("pageIndexList", pageIndexList);
			
			
			model.addAttribute("lists", dao.lists());
			
			
			
		} catch (Exception e)
		{
		}
		
		
		view = "main.jsp";
				
				
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
 
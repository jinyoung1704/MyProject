package com.my.list;

import java.util.ArrayList;

public interface IListDAO
{
	//리스트 추가
	public void addList(ListDTO dto);
	
	//리스트 불러오기
	public ArrayList<ListDTO> lists(ListDTO dto);
	
	//리스트 삭제
	public void deleteList(String name);
	
	//페이징
	public int getCount();
}

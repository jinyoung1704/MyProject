package com.my.list;

import java.util.ArrayList;

public interface IListDAO
{
	//리스트 추가
	public void addList(ListDTO dto);
	
	//리스트 불러오기
	public ArrayList<ListDTO> lists();
}

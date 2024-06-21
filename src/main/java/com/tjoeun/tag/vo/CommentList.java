package com.tjoeun.tag.vo;

import java.util.ArrayList;

public class CommentList {

	private ArrayList<CommentVO> list = new ArrayList<CommentVO>();

	public ArrayList<CommentVO> getList() {
		return list;
	}
	public void setList(ArrayList<CommentVO> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "CommentList [list=" + list + "]";
	}
	
}

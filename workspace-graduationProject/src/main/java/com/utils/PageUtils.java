package com.utils;

public class PageUtils {
	private int currPage;	
	private int pageSize;	
	private int totalSize;	
	private int totalPage;	
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalSize) {
		if(totalSize%this.pageSize==0){
			this.totalPage=totalSize/this.pageSize;
		}else{
			this.totalPage=totalSize/this.pageSize+1;
		}
	}
	
}

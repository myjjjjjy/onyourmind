package kr.smhrd.domain;

public class Board {
	
	private int idx; //글 번호
	private String title; 
	private String content; 
	private String writer; 
	private String joindate; 
	private String indate; //(2022-03-16) 형식으로! 
	private String count;
	
	public int getIdx() {
		return idx;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getWriter() {
		return writer;
	}
	public String getIndate() {
		return indate;
	}
	public String getCount() {
		return count;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setDate(String indate) {
		this.indate = indate;
	}
	public void setCount(String count) {
		this.count = count;
	} 
	
	
	

}

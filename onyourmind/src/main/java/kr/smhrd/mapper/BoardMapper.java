package kr.smhrd.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;

import kr.smhrd.domain.Board;

public interface BoardMapper {
	
	//전체 게시물 가지고오기 
	public ArrayList<Board> boardList();
	
	//게시물 작성
	public void boardInsert(Board vo); 
	
	//특정 게시물 번호를 가진 게시물정보 가져오기 
	public Board boardContent(int idx); 

	//특정 게시물 번호를 가진 게시물 삭제
	@Delete("delete from springboard where idx=#{idx}")
	public void boardDelete(int idx); 
	
	//특정 게시문 번호를 가진 게시물 수정
	public void boardUpdate(Board vo); 
	
	//특정 게시글 번호를 가진 게시글 내용만! 수정
	@Update("update springboard set content=#{content} where idx=#{idx}")
	public void boardContentUpdate(Board vo); 
	
	@Update("update springboard set title=#{title}, writer=#{writer} where idx=#{idx}")
	public void boardTWUpdate(Board vo); 
}

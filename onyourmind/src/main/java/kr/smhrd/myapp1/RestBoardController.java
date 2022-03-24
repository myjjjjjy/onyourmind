package kr.smhrd.myapp1;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.domain.Board;
import kr.smhrd.mapper.BoardMapper;

@RestController
public class RestBoardController {

	@Autowired
	private BoardMapper mapper;

	// @ResponseBody : 자바 객체를 HTTP 응답객체로 변환해주는데 사용
	@RequestMapping("/boardList.do")
	public ArrayList<Board> boardList() {
		ArrayList<Board> list = mapper.boardList();
		return list;
	}

	@RequestMapping("/boardContentUpdate.do")
	public void boardContentUpdate(Board vo) {
		mapper.boardContentUpdate(vo);
	}

	@RequestMapping("/boardInsert.do")
	public void boardInsert(Board vo) {
		mapper.boardInsert(vo);
	}

	@RequestMapping("/boardTWUpdate.do")
	public void boardTWUpdate(Board vo) {
		mapper.boardTWUpdate(vo);
	}

	// boardDelete
	@RequestMapping("/boardDelete.do")
	public void boardDelete(int idx) {
		mapper.boardDelete(idx);
	}

}

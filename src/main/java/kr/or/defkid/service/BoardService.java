package kr.or.defkid.service;

import java.util.List;

import kr.or.defkid.domain.BoardVO;
import kr.or.defkid.domain.PageCondDTO;

public interface BoardService {
	
	public int insertBoard(BoardVO boardVO);
	public int updateBoard(BoardVO boardVO);
	public int deleteBoard(int boardNum);
	public BoardVO selectBoard(int boardNum);
	public List<BoardVO> selectBoardList();
	public int getBoardCount();
	

	public List<BoardVO> selectBoardPage(PageCondDTO pageCondDTO);
}

package kr.or.defkid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.defkid.domain.BoardVO;
import kr.or.defkid.domain.PageCondDTO;

@Mapper
public interface BoardMapper {
	
	public int insertBoard(BoardVO boardVO);
	public int updateBoard(BoardVO boardVO);
	public int deleteBoard(int boardNum);
	public BoardVO selectBoard(int boardNum);
	public List<BoardVO> selectBoardList();
	public int getBoardCount();

	//지정된  pageSize만큼에 해당되는 page 가져오깅
	public List<BoardVO> selectBoardPage(PageCondDTO pageCondDTO);
}

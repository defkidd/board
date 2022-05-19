package kr.or.defkid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.defkid.domain.BoardVO;
import kr.or.defkid.domain.PageCondDTO;
import kr.or.defkid.mapper.BoardMapper;
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public int insertBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return boardMapper.insertBoard(boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return boardMapper.updateBoard(boardVO);
	}

	@Override
	public int deleteBoard(int boardNum) {
		// TODO Auto-generated method stub
		return boardMapper.deleteBoard(boardNum);
	}

	@Override
	public BoardVO selectBoard(int boardNum) {
		// TODO Auto-generated method stub
		return boardMapper.selectBoard(boardNum);
	}

	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardList();
	}

	@Override
	public List<BoardVO> selectBoardPage(PageCondDTO pageCondDTO) {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardPage(pageCondDTO);
	}

	@Override
	public int getBoardCount() {
		return boardMapper.getBoardCount();
	}

}

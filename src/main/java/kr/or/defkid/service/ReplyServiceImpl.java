package kr.or.defkid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.defkid.domain.ReplyVO;
import kr.or.defkid.mapper.ReplyMapper;
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
		
	@Override
	public int insertReply(ReplyVO replyVO) {
		return replyMapper.insertReply(replyVO);
	}

	@Override
	public int updateReply(ReplyVO replyVO) {
		return replyMapper.updateReply(replyVO);
	}

	@Override
	public int deleteReply(int replyNo) {
		return replyMapper.deleteReply(replyNo);
	}

	@Override
	public ReplyVO selectReply(int replyNo) {
		return replyMapper.selectReply(replyNo);
	}

	@Override
	public List<ReplyVO> selectReplyList() {
		return replyMapper.selectReplyList();
	}

	@Override
	public List<ReplyVO> selectReplyList2(int boardNo) {
		return replyMapper.selectReplyList2(boardNo);
	}

}

package kr.or.defkid.service;

import java.util.List;

import kr.or.defkid.domain.ReplyVO;

public interface ReplyService {
		
	public int insertReply(ReplyVO replyVO);
	public int updateReply(ReplyVO replyVO);
	public int deleteReply(int replyNo);
	public ReplyVO selectReply(int replyNo);
	public List<ReplyVO> selectReplyList();
	public List<ReplyVO> selectReplyList2(int boardNo);
	

}

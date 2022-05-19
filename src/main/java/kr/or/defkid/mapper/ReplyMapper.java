package kr.or.defkid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.defkid.domain.ReplyVO;

@Mapper
public interface ReplyMapper {

	public int insertReply(ReplyVO replyVO);
	public int updateReply(ReplyVO replyVO);
	public int deleteReply(int replyNo);
	public ReplyVO selectReply(int replyNo);
	public List<ReplyVO> selectReplyList();
	public List<ReplyVO> selectReplyList2(int boardNo);
	
}

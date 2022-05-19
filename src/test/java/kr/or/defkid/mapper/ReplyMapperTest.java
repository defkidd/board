package kr.or.defkid.mapper;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.or.defkid.domain.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("classpath:config/spring/root-context.xml")
@Slf4j
public class ReplyMapperTest {

	@Autowired
	private ReplyMapper replyMapper;
	
	@Test
	@Disabled
	public void insertTest() {
		ReplyVO replyVO;
		for (int i = 1; i <10; i++) {
			for (int j = 1; j < 5; j++) {
				replyVO = new ReplyVO();
				replyVO.setBoardNum(i);
				replyVO.setReplyTitle("댓글"+i);
				replyVO.setReplyWriter("댓글"+i);
				replyVO.setReplyContent("크크크크크"+i);
				Assertions.assertEquals(1, replyMapper.insertReply(replyVO));
			}
		}
	
	}
	
	@Test
	@Disabled
	public void updateTest() {
		ReplyVO replyVO = new ReplyVO();
		replyVO.setReplyNo(5);
		replyVO.setReplyTitle("수정");
		replyVO.setReplyWriter("수정");
		replyVO.setReplyContent("수정");
		Assertions.assertEquals(1, replyMapper.updateReply(replyVO));
		
	}
	
	@Test
	@Disabled
	public void delteTest() {
		Assertions.assertEquals(1, replyMapper.deleteReply(5));
		
	}
	
	@Test
//	@Disabled
	public void selectTest() {
		
		log.info(replyMapper.selectReply(33)+"");
	}
	
	@Test
	@Disabled
	public void selectListTest() {
//		replyMapper.selectReplyList().forEach(System.out::println);
		replyMapper.selectReplyList().stream().forEach(vo -> {
			log.info(""+vo);
		});
	}
	
	@Test
	@Disabled
	public void selectReplyListTest() {
//		replyMapper.selectReplyList().forEach(System.out::println);
		replyMapper.selectReplyList2(19).stream().forEach(vo -> {
			log.info(""+vo);
		});
	}

}
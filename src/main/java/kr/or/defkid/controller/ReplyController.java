package kr.or.defkid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.defkid.domain.ReplyVO;
import kr.or.defkid.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@GetMapping(value=("/list"),produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectReplyList(@RequestParam("boardNum") int boardNum) throws JsonProcessingException {
		System.out.println(boardNum);
		List<ReplyVO> selectReplyList2 = replyService.selectReplyList2(boardNum);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(selectReplyList2);
		return json;
				
	}
	
	@GetMapping(value=("/detail"),produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectReplydetail(@RequestParam("replyNo") int replyNo) throws JsonProcessingException {
		System.out.println(replyNo);
		ReplyVO selectReply = replyService.selectReply(replyNo);
		System.out.println(selectReply.boardNum);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(replyService.selectReply(replyNo));
		return json;
		
	}
}

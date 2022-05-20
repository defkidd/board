package kr.or.defkid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.defkid.domain.ReplyVO;
import kr.or.defkid.service.ReplyService;
import lombok.extern.slf4j.Slf4j;


//@RestController responsebody + controller
@Controller
@RequestMapping("/reply")
@Slf4j
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@GetMapping(value=("/list"),produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<ReplyVO> selectReplyList(@RequestParam("boardNum") int boardNum)  {
		List<ReplyVO> selectReplyList2 = replyService.selectReplyList2(boardNum);
		return selectReplyList2 ;
				
	}
	
	@PostMapping(value=("/list"),produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<ReplyVO> postReplyList(@RequestParam("boardNum") int boardNum)  {
		List<ReplyVO> selectReplyList2 = replyService.selectReplyList2(boardNum);
		return selectReplyList2 ;
		
	}
	
	@PostMapping(value=("/write"),produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String writeReply(@RequestBody ReplyVO replyVO) {
		String msg="";
		if (replyService.insertReply(replyVO)>0) {
			 msg="success";
		} else {
			 msg="fail";
		}
		return msg;
	};
	
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
	
	@PostMapping(value=("/update"),produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String updateReply(@RequestBody ReplyVO replyVO) throws JsonProcessingException {
		String msg="";
		if (replyService.updateReply(replyVO)>0) {
			 msg="success";
		} else {
			 msg="fail";
		}
		return msg;
		
	}
	
	@PostMapping(value=("/delete"),produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteReply(@RequestParam("replyNo")int replyNo) throws JsonProcessingException {
		String msg="";
		if (replyService.deleteReply(replyNo)>0) {
			msg="success";
		} else {
			msg="fail";
		}
		return msg;
		
	}
}

package kr.or.defkid.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.defkid.domain.BoardVO;
import kr.or.defkid.domain.PageCondDTO;
import kr.or.defkid.domain.PageDTO;
import kr.or.defkid.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board") //  항상 URL을 설계한다는 개념으로.
@Slf4j
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("/write") // 사용자에게 보여줄 화면은 get방식으로
	public String getWrite(Model model) {
		
		return "write";
	}

	@PostMapping("/write") // 실질적인처리는 post방식으로
	public String postWrite(Model model,@ModelAttribute("vo") BoardVO boardVO) {
		System.out.println(boardVO);
		int insertBoard = boardService.insertBoard(boardVO);
		if (insertBoard !=1) {
			model.addAttribute("error","안들감");
		}
		return "redirect:list";
	}
	
	@GetMapping("/list") //사용자에게 보여줄 화면은 get방식으로
	public String getList(PageCondDTO pageCondDTO,Model model) {
		log.info("ck: " + pageCondDTO.getPageNum());
		log.info("ck: " + pageCondDTO.getPageSize());
		//List<BoardVO> boardList = boardService.selectBoardList();
		
		PageDTO pageDTO = new PageDTO(pageCondDTO, boardService.getBoardCount());
		List<BoardVO> boardList = boardService.selectBoardPage(pageCondDTO);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO",pageDTO); 
		return "umm/list";
	}
	@GetMapping("/read")
	public String getRead(@RequestParam("boardNum") int boardNum,Model model) {	
		BoardVO selectBoard = boardService.selectBoard(boardNum);
		model.addAttribute("detail",selectBoard);
		return "read";
	}
	
	@PostMapping("/modify")
	public String getModify(BoardVO boardVO,Model model,RedirectAttributes rattr) {
		// 일회성 메세지를 담는 객체
		rattr.addFlashAttribute("onetimemsg","수정성공");
		int updateBoard = boardService.updateBoard(boardVO);
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/del")
	public String getDel(BoardVO boardVO,Model model,RedirectAttributes rattr) {
		rattr.addFlashAttribute("onetimemsg","삭제성공");
		boardService.deleteBoard(boardVO.getBoardNum());
		return "redirect:/board/list";
	}
}

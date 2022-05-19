package kr.or.defkid.service;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.or.defkid.domain.BoardVO;
import kr.or.defkid.domain.PageCondDTO;
import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("classpath:config/spring/root-context.xml")
@Slf4j
public class BoardServiceTest {	

	@Autowired
	private BoardService boardService;
	
	@Test
	@Disabled
	public void serviceTest() {
		
		List<BoardVO> selectBoardList = boardService.selectBoardList();
		
		
		// ::을 메소드 참조라고 부름 람다.식
		selectBoardList.forEach(System.out::println);
	}
	
	@Test
	public void selectPage() {
		PageCondDTO pageCondDTO = new PageCondDTO(2,7,5);
		//pageCondDTO.setPageNum(2);
		//pageCondDTO.setPageSize(3);
		
		List<BoardVO> boardList = boardService.selectBoardPage(pageCondDTO);
		
		boardList.forEach(System.out::println);
		Assertions.assertEquals(5, boardList.size());
	}

}

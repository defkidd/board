package kr.or.defkid.mapper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.or.defkid.domain.BoardVO;
import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("classpath:config/spring/root-context.xml")
@Slf4j
public class BoardMapperTest {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	@Disabled
	public void connTest() throws SQLException { // 먼저 커넥션 테스트
		SqlSession openSession = sqlSessionFactory.openSession();
		Connection connection = openSession.getConnection();
		Assertions.assertNotNull(connection);
//		Statement createStatement = connection.createStatement();
//		ResultSet executeQuery = createStatement.executeQuery("select * from BOARDTEST");
//		while (executeQuery.next()) {
//			log.info(executeQuery.getString(1));
//			log.info(executeQuery.getString(2));
//		}
	}
	@Test
	//
	@DisplayName("insertTest")
	@Disabled
	public void insertTest() {
		BoardVO boardVO ;
		for (int i = 301; i <=313; i++) {
			boardVO = new BoardVO();
			boardVO.setBoardTitle("제목"+i);
			boardVO.setBoardWriter("멋진작가"+i);
			boardVO.setBoardContent("내용"+i);
			
			Assertions.assertEquals(1,boardMapper.insertBoard(boardVO));
		}
	}
	
	@Test
	@Disabled
	public void udateTest() {
		BoardVO boardVO ;
		boardVO = new BoardVO();
		boardVO.setBoardTitle("제목수정");
		boardVO.setBoardWriter("작가수정");
		boardVO.setBoardContent("내용수정");
		boardVO.setBoardNum(3);
		Assertions.assertEquals(1,boardMapper.updateBoard(boardVO));
	}
	
	@Test
	@Disabled
	public void deleteTest() {
		Assertions.assertEquals(1,boardMapper.deleteBoard(3));
	}
	
	@Test
//	@Disabled
	public void selectTest() {
		
		log.info( boardMapper.selectBoard(55)+"ddddddddddddd");
	}
	
	@Test
	@Disabled
	public void selectListTest() {
		List<BoardVO> boardList = boardMapper.selectBoardList();
		boardList.stream().forEach(vo->System.out.println(vo));
	}

}



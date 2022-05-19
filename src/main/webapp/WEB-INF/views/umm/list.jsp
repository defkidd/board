<%@page import="java.util.Iterator"%>
<%@page import="kr.or.defkid.domain.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
  <!-- jsp사용시 trimDirectiveWhitespaces="true" 공백없애줌 -->  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!-- <!DOCTYPE html>  -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->

<!-- <title>Insert title here</title> -->
<!-- <style type="text/css"> 
/* /* 	td:hover { */ */
/* /* 		background-color: red; */ */

/* /* 	} */ */
/* 	.active { */
/* 		font-size: 2rem; */
/* 	} */
-->
<!-- </style> -->
<!-- </head> -->
<!-- <body> -->
<h1>list</h1>
<h1>${pageDTO }</h1>
<h1>${vo}</h1>
<h1>${error }</h1>
<%-- <h1>${boardList }</h1> --%>
<%-- 예전방식..!
<%
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
// 	for(BoardVO boardVO: boardList){
// 		out.println(boardVO);		
// 	}
	Iterator<BoardVO> iterBV = boardList.iterator();
	BoardVO vo;
	while(iterBV.hasNext()){
		vo = iterBV.next();
	

%>
<hr>
	<p><%=vo.getBoardNum() %></p>
	<p><%=vo.getBoardTitle() %></p>
	<p><%=vo.getBoardWriter() %></p>
	<p><%=vo.getBoardContent() %></p>
	}
%>
 --%>
 <table border=1>
 	<tr><th>순번</th><th>넘버</th><th>제목</th><th>글쓴이</th><th>내용</th><th>작성일</th><th>수정일</th></tr>
 <c:forEach var="boardVO" items="${boardList}" varStatus="status">
 	<tr onmouseover="f_over(this)" onmouseout="f_out(this)">
 		<td>${status.index }</td>
 		<td>${boardVO.boardNum}</td>
 		<td><a href="${pageContext.request.contextPath }/board/read?boardNum=${boardVO.boardNum}">${boardVO.boardTitle}</a></td>
 		<td>${boardVO.boardWriter}</td>
 		<td>${boardVO.boardContent}</td>
 		<td><fmt:formatDate value="\${boardVO.boardRegdate}" pattern="yyyy-MM-dd"/></td>
<%--  		<td>${boardVO.boardRegdate}</td> --%>
 	</tr>
 </c:forEach>
 </table>
 <c:set var="curPage" value="${pageDTO.pageCondDTO.pageNum }"/>
 <c:set var="pageSize" value="${pageDTO.pageCondDTO.pageSize }"/>
 <c:set var="contextPath" value="${pageContext.request.contextPath }/board"/>
 <p>현재페이지넘버 : ${curPage }</p>
 
 <c:if test="${pageDTO.isPrevious() == true }">
 	<input type="button" value="이전" id="btn_prev">
 </c:if>
 <c:if test="${pageDTO.isPrevious() == false }">
 	<input type="button" value="이전1" disabled="disabled">
 </c:if>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 <c:forEach var="pageNum" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
 	<c:if test="${pageNum == curPage}">
<%-- 	 	<a href="${contextPath}/list?pageNum=${pageNum}&pageSize=${pageSize} " class="active">${pageNum}</a> --%>
	 	<a href="#" onclick="f_sendPage('${pageNum}','${pageSize}')" class="active">${pageNum}</a>
 	</c:if>
 	<c:if test="${pageNum != curPage}">
<%-- 	 	<a href="${contextPath}/list?pageNum=${pageNum}&pageSize=${pageSize} ">${pageNum}</a> --%>
	 	<a href="#"  onclick="f_sendPage('${pageNum}','${pageSize}')">${pageNum}</a>
 	</c:if>
 </c:forEach>
 <c:if test="${pageDTO.isNext() == true }">
 	<input type="button" value="다음" id="btn_next">
 </c:if>
 <c:if test="${pageDTO.isNext() == false }">
 	<input type="button" value="다음" disabled="disabled">
 </c:if>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 <a href="/defkid/board/write">새글</a>
 
 <form id="id_form" action="${contextPath }/list">
 	<input type="hidden" name="pageNum" value="">
 	<input type="hidden" name="pageSize" value="">
 </form>
 
 <script type="text/javascript">
 	const c_form = document.querySelector("#id_form");
 	const c_nextBtn = document.querySelector("#btn_next");
 	const c_prevBtn = document.querySelector("#btn_prev");
 	if (c_prevBtn!=null) {
	 	const f_prevBtn = ()=>{
	 		c_form.elements[0].value = ${pageDTO.startPage }-1;
	 		c_form.elements[1].value =${pageDTO.pageCondDTO.pageSize };
	 		c_form.submit();
	 		
	 	};
	 	c_prevBtn.addEventListener("click",f_prevBtn);
		
	}
 	if(c_nextBtn!=null){
	 	const f_nextBtn = ()=>{
	 		c_form.elements[0].value = ${pageDTO.endPage }+1;
	 		c_form.elements[1].value =${pageDTO.pageCondDTO.pageSize };
	 		c_form.submit();
	 		
	 	};
	 	c_nextBtn.addEventListener("click",f_nextBtn);
 		
 	}
 	let resultMsg = "${onetimemsg}";
 	if (resultMsg) {
		alert(resultMsg);
	}
 	let f_over = (p_this)=>{
 		p_this.style.backgroundColor = "red";
 		p_this.style.color="yellow";
 	};
 	let f_out = (p_this)=>{
 		p_this.style.backgroundColor = "white";
 		p_this.style.color="black";
 	};
 	const f_sendPage = (p_pageNum,p_pageSize)=>{
 		event.preventDefault();
 		console.log(c_form.elements[0])
 		console.log(c_form.elements[1])
//  		document.querySelector("input[name=pageNum]").value = p_pageNum;
 		c_form.elements[0].value = p_pageNum;
 		c_form.elements[1].value = p_pageSize;
 		c_form.submit();
 	};
 </script>
<!-- </body> -->
<!-- </html> -->




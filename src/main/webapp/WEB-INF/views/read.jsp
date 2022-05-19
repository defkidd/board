<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${detail.boardNum }</h1>
<form action="${pageContext.request.contextPath}/board/modify" method="post">
	제목 <input type="text" name="boardTitle" value="${detail.boardTitle }" readonly="readonly"><br>
	작성자 <input type="text" name="boardWriter" value="${detail.boardWriter }" readonly="readonly"><br>
	내용<br>
	<textarea rows="10" cols="60" name="boardContent"readonly="readonly">${detail.boardContent }</textarea>
	<input type="hidden" name = "boardNum" value="${detail.boardNum }">
	<input type="button" value="수정??" id="id_mod">
	<input type="button" value="수정내용전송" disabled="disabled" id="id_transfer">
	<input type="submit" value="삭제" id="id_del">
</form>

	<script type="text/javascript">
	
		const c_mod = document.querySelector("#id_mod");
		const c_tansfer = document.querySelector("#id_transfer");
		const f_modifyClick = ()=>{
			document.forms[0].submit();
		};
		c_tansfer.onclick = f_modifyClick;
		const c_del = document.querySelector("#id_del");
		
		const f_click = ()=>{
			let l_elements = document.forms[0].elements;
			for (var i = 0; i < 3; i++) {
				l_elements[i].readOnly = false;
			}
			l_elements[5].disabled= false;
		};
		
		c_mod.addEventListener("click",f_click);
		
		const f_del = ()=>{
			event.preventDefault();
			document.forms[0].action ="${pageContext.request.contextPath}/board/del";
			document.forms[0].submit();
		};
		
		document.forms[0].addEventListener("submit",f_del);
	
	</script>

</body>
</html>
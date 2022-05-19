<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시판</h1>
	<form action="${pageContext.request.contextPath}/board/write" method="post">
		제목 <input type="text" name="boardTitle" value="" required="required"><br>
		작성자 <input type="text" name="boardWriter" value="" required="required"><br> 
		내용 <textarea name="boardContent"></textarea><br>
		<!-- type="button"올 서브밋을해주면, required가 안먹음  -->
		<input type="button" value="글등록" id="id_submit">
	</form>
	<script type="text/javascript">
		const c_submit = document.querySelector("#id_submit");
		const c_form =document.forms[0];
		const f_submitCheck = ()=>{
			console.log(c_form);
			// form객체.input이름으로접근
			if (!c_form.boardTitle.value.trim()) {
				alert("ddd");
				c_form.boardTitle.focus();
				return;
			}
			if (!c_form.boardWriter.value.trim()) {
				alert("ddd");
				c_form.boardWriter.focus();
				return;
			}
			if (!c_form.boardContent.value.trim()) {
				alert("ddd");
				c_form.boardContent.focus();
				return;
			}
			document.forms[0].submit();
			
		}
		
		c_submit.onclick = f_submitCheck;
	</script>
</body>
</html>
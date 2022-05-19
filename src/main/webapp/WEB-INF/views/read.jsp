<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				.modal {
					position: absolute;
					top: 0;
					left: 0;

					width: 100%;
					height: 100%;

					display: none;

					background-color: rgba(0, 0, 0, 0.4);
				}

				.modal.show {
					display: block;
				}

				.modal_body {
					position: absolute;
					top: 50%;
					left: 50%;

					width: 400px;
					height: 600px;

					padding: 40px;

					text-align: center;

					background-color: rgb(255, 255, 255);
					border-radius: 10px;
					box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

					transform: translateX(-50%) translateY(-50%);
				}
			</style>


		</head>

		<body>
			<h1>${detail.boardNum }</h1>
			<form action="${pageContext.request.contextPath}/board/modify" method="post">
				제목 <input type="text" name="boardTitle" value="${detail.boardTitle }" readonly="readonly"><br>
				작성자 <input type="text" name="boardWriter" value="${detail.boardWriter }" readonly="readonly"><br>
				내용<br>
				<textarea rows="10" cols="60" name="boardContent" readonly="readonly">${detail.boardContent }</textarea>
				<input type="hidden" name="boardNum" value="${detail.boardNum }">
				<input type="button" value="수정??" id="id_mod">
				<input type="button" value="수정내용전송" disabled="disabled" id="id_transfer">
				<input type="submit" value="삭제" id="id_del">
			</form>
			<hr>
			<div id="id_disp">

			</div>
			<div class="modal">
				<div class="modal_body">
					제목<input type="text" name="replyTitle" id="id_title"><br>
					작가<input type="text" name="replyWriter" id="id_writer"><br>
					내용<input type="text" name="replyContent" id="id_content"><br>
					<input type="button" value="수정">
					<input type="button" value="삭제">

				</div>
			</div>
			<!-- <button class="btn-open-popup">Modal 띄우기</button> -->

			<script type="text/javascript">

				const c_mod = document.querySelector("#id_mod");
				const c_tansfer = document.querySelector("#id_transfer");
				const body = document.querySelector('body');
				const modal = document.querySelector('.modal');
				const modal_body = document.querySelector('.modal_body');
				const c_writer = document.querySelector("#id_writer");
				const c_title = document.querySelector("#id_title");
				const c_content = document.querySelector("#id_content");
				const f_modifyClick = () => {
					document.forms[0].submit();
				};
				c_tansfer.onclick = f_modifyClick;
				const c_del = document.querySelector("#id_del");

				const f_click = () => {
					let l_elements = document.forms[0].elements;
					for (var i = 0; i < 3; i++) {
						l_elements[i].readOnly = false;
					}
					l_elements[5].disabled = false;
				};

				c_mod.addEventListener("click", f_click);

				const f_del = () => {
					event.preventDefault();
					document.forms[0].action = "${pageContext.request.contextPath}/board/del";
					document.forms[0].submit();
				};

				document.forms[0].addEventListener("submit", f_del);
				let f_replyDetail = (p_num) => {
					event.preventDefault();

					// modal_body.innerHTML = (c_disp.innerHTML);
					const xhr = new XMLHttpRequest();
					xhr.open("GET", "/defkid/reply/detail?replyNo=" + p_num, true);
					xhr.onreadystatechange = () => {
						if (xhr.readyState == 4 && xhr.status == 200) {
							console.log(xhr.responseText);
							console.log(JSON.parse(xhr.responseText));
							let jsonData = JSON.parse(xhr.response);
							c_writer.value = jsonData.replyWriter;
							c_title.value = jsonData.replyTitle;
							c_content.value = jsonData.replyContent;
							// let input1 = document.createElement("input");
							// input1.type = "text";
							// input1.value = jsonData.replyTitle;
							// let input2 = document.createElement("input");
							// input2.type = "text";
							// input2.value = jsonData.replyWriter;
							// let input3 = document.createElement("input");
							// input3.type = "text";
							// input3.value = jsonData.replyContent;
							// modal_body.appendChild(input1);
							// modal_body.appendChild(input2);
							// modal_body.appendChild(input3);
						}
					}
					xhr.send();
					console.log(c_disp);
					modal.classList.toggle('show');

					if (modal.classList.contains('show')) {
						body.style.overflow = 'hidden';
					}

					modal.addEventListener('click', (event) => {
						if (event.target === modal) {
							modal.classList.toggle('show');

							if (!modal.classList.contains('show')) {
								body.style.overflow = 'auto';
							}
						}
					});

				};
				const c_disp = document.querySelector("#id_disp");

				const xhr = new XMLHttpRequest();
				xhr.open("GET", "/defkid/reply/list?boardNum=${detail.boardNum }", true);
				xhr.onreadystatechange = () => {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log(xhr.responseText);
						console.log(JSON.parse(xhr.responseText));
						let jsonData = JSON.parse(xhr.response);
						let tblStr = "<table>";
						tblStr += "<tr><th>작성자</th><th>제목</th></tr>"
						for (let index = 0; index < jsonData.length; index++) {
							tblStr += `<tr>
									    	<td>\${jsonData[index].replyWriter}</td>	
									    	<td><a href="#" onclick="f_replyDetail(\${jsonData[index].replyNo})">\${jsonData[index].replyTitle}</a></td>	
									   </tr>`;
						}
						tblStr += "</table>";
						c_disp.innerHTML = tblStr;
					}
				}
				xhr.send();

			</script>

		</body>

		</html>
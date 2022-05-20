<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				.reply {
					border: 2px solid pink;
					background-color: black;
					color: yellow;
					cursor: pointer;

				}

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
			<c:set var="replyPath" value="${pageContext.request.contextPath }/reply"></c:set>
			<h1>${detail.boardNum }</h1>
			<form action="${pageContext.request.contextPath}/board/modify" method="post">
				제목 <input type="text" name="boardTitle" value="${detail.boardTitle }" readonly="readonly"><br> 작성자
				<input type="text" name="boardWriter" value="${detail.boardWriter }" readonly="readonly"><br>
				내용<br>
				<textarea rows="10" cols="60" name="boardContent" readonly="readonly">${detail.boardContent }</textarea>
				<br>
				<input type="hidden" name="boardNum" value="${detail.boardNum }">
				<input type="button" value="수정??" id="id_mod"> <input type="button" value="수정내용전송" disabled="disabled"
					id="id_transfer">
				<input type="submit" value="삭제" id="id_del">
			</form>
			<form action="#">
				제목<input type="text" name="replyTitle" id="id_title" required><br>
				글쓴이<input type="text" name="replyWriter" id="id_writer" required><br>
				내용<br>
				<textarea name="replyContent" id="id_content" cols="30" rows="10" required></textarea>
				<br>
				<input type="submit" value="댓글쓰기" id="btn_writeReply">

			</form>
			<hr>
			<div id="replyList">

			</div>
			<div class="modal">
				<div class="modal_body">
					제목<input type="text" name="replyTitle" id="detailTitle"><br>
					작가<input type="text" name="replyWriter" id="detailWriter"><br>
					내용<br>
					<textarea name="replyContent" id="detailContent" cols="30" rows="10"></textarea>
					<br>
					<input type="hidden" name="boardNum" value="${detail.boardNum }">
					<input type="button" value="수정" id="detailMod">
					<input type="button" value="삭제" id="detailDel">
				</div>
			</div>


			<script type="text/javascript">
				const c_replyList = document.querySelector("#replyList");
				const btn_writeReply = document.querySelector("#btn_writeReply");
				const c_writer = document.querySelector("#id_writer");
				const c_title = document.querySelector("#id_title");
				const c_content = document.querySelector("#id_content");
				const detailMod = document.querySelector("#detailMod");
				const detailDel = document.querySelector("#detailDel");
				const detailTitle = document.querySelector("#detailTitle");
				const detailWriter = document.querySelector("#detailWriter");
				const detailContent = document.querySelector("#detailContent");
				const body = document.querySelector('body');
				const modal = document.querySelector('.modal');
				const modal_body = document.querySelector('.modal_body');
				const f_replyList = () => {
					// alert("체킁");
					const xhr = new XMLHttpRequest();
					xhr.open("get", "${replyPath}/list?boardNum=${detail.boardNum }", true);
					// xhr.open("post", "${replyPath}", true);
					xhr.onreadystatechange = () => {
						if (xhr.readyState === 4 && xhr.status === 200) {
							let jsonData = JSON.parse(xhr.responseText);
							if (!jsonData.length) {
								let replyDiv = document.createElement("div");
								// replyDiv.className = "reply"; 두가지방식
								replyDiv.setAttribute("class", "reply");
								replyDiv.innerHTML = "댓글없음";

								c_replyList.appendChild(replyDiv);
							}
							for (let i = 0; i < jsonData.length; i++) {
								// alert("ppp");
								let replyDiv = document.createElement("div");
								// replyDiv.className = "reply"; 두가지방식
								replyDiv.setAttribute("class", "reply");
								replyDiv.innerHTML = jsonData[i].replyTitle + "=>" +
									jsonData[i].replyWriter + "=>" +
									jsonData[i].replyContent;
								let hiddenNum = document.createElement("input");
								hiddenNum.type = "hidden";
								hiddenNum.value = jsonData[i].replyNo;
								replyDiv.appendChild(hiddenNum);
								c_replyList.appendChild(replyDiv);


							}
							const replys = document.querySelectorAll(".reply");
							f_detail(replys);
						}
					};
					// post방식으로 보낼땐,붙여주기
					// jQUert ajax는 위의 값이 defauly로 세팅됨
					//그래서 파일업로드시 muitipary/form-data로 되어야해서
					// contentTpye:false,process-data:false로 함.
					// xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					xhr.send();
				}
				f_replyList();

				const f_detailMod = (p_replyNo) => {
					let l_data = {
						replyTitle: detailTitle.value,
						replyWriter: detailWriter.value,
						replyContent: detailContent.value,
						boardNum: "${ detail.boardNum }",
						replyNo: p_replyNo
					}
					const xhr = new XMLHttpRequest();
					xhr.open("post", "${replyPath}/update", true);
					xhr.onreadystatechange = () => {
						if (xhr.readyState === 4 && xhr.status === 200) {
							alert(xhr.responseText);
							if (xhr.responseText === "success") {
								c_replyList.innerHTML = "";
								f_replyList();
								modal.classList.toggle('show');
							}
						}
					}

					xhr.setRequestHeader("Content-Type", "application/json");
					xhr.send(JSON.stringify(l_data));
				}

				const f_detailDel = (replyNo) => {
					console.log("dddd");
					console.log(replyNo);
					const xhr = new XMLHttpRequest();
					xhr.open("post", "${replyPath}/delete", true);
					xhr.onreadystatechange = () => {
						if (xhr.readyState === 4 && xhr.status === 200) {
							alert(xhr.responseText);
							if (xhr.responseText === "success") {
								c_replyList.innerHTML = "";
								f_replyList();
								modal.classList.toggle('show');
							}
						}
					}
					xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					xhr.send("replyNo=" + replyNo);
				}

				const f_detail = (p_list) => {
					for (let i = 0; i < p_list.length; i++) {
						const f_listDetail = () => {

							let values = event.target.innerText.split("=>");
							detailTitle.value = values[0];
							detailWriter.value = values[1];
							detailContent.value = values[2];

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
							detailMod.addEventListener("click", f_detailMod.bind(this, event.target.lastChild.value));
							console.log(this);
							detailDel.addEventListener("click", f_detailDel.bind(this, event.target.lastChild.value));

						};

						p_list[i].addEventListener("click", f_listDetail);


					}
				}



				const f_writeReply = () => {
					event.preventDefault();
					// const body = document.querySelector('body');
					// const modal = document.querySelector('.modal');
					// const modal_body = document.querySelector('.modal_body');
					// modal.classList.toggle('show');

					// if (modal.classList.contains('show')) {
					// 	body.style.overflow = 'hidden';
					// }

					// modal.addEventListener('click', (event) => {
					// 	if (event.target === modal) {
					// 		modal.classList.toggle('show');

					// 		if (!modal.classList.contains('show')) {
					// 			body.style.overflow = 'auto';
					// 		}
					// 	}
					// });

					// let formData = new FormData(document.forms[1]);
					// let formData = new FormData();
					// formData.append("boardNum", "${ detail.boardNum }");
					// formData.append("replyTitle", c_title.value);
					// formData.append("replyWriter", c_writer.value);
					// formData.append("replyContent", c_content.value);
					// console.log(document.forms[1]);
					// console.log(formData);
					let l_data = {
						replyTitle: c_title.value,
						replyWriter: c_writer.value,
						replyContent: c_content.value,
						boardNum: "${ detail.boardNum }"
					}
					const xhr = new XMLHttpRequest();
					xhr.open("post", "${replyPath}/write", true);
					// xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					xhr.setRequestHeader("Content-Type", "application/json");
					xhr.onreadystatechange = () => {
						if (xhr.readyState === 4 && xhr.status === 200) {
							if (xhr.responseText === "success") {
								alert("댓글을 달았음");
								c_replyList.innerHTML = "";
								f_replyList();

							}
						}
					};
					xhr.send(JSON.stringify(l_data));
				};
				document.forms[1].addEventListener("submit", f_writeReply);


				const c_mod = document.querySelector("#id_mod");
				const c_tansfer = document.querySelector("#id_transfer");
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








			</script>

		</body>

		</html>
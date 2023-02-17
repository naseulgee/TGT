<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf" %>

<style>
	/* 회원 이미지 */
	.img_wrap{ margin: 50px 0; }
	.img_wrap i{ font-size: 20em; }
	.img_wrap img{ width: 300px; height: 300px; object-fit: cover; border-radius: 100%; }

	/* 회원 정보 테이블 */
	.mem_info tr:nth-child(odd){ background-color: #e9e9e9; }
	.mem_info tr th{ width: 30%; background-color: transparent; text-align: left; }
	.mem_info tr th,
	.mem_info tr td{ padding: 20px; }
</style>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<!-- 회원 - 반려견사진변경, 회원정보 출력 페이지 -->
<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	<div class="main_wrap">
		<h3>나의 회원정보</h3>
		<p>투개더 ${MEM_DOG_NAME} 견주님의 회원정보 입니다.</p>
		<div class="img_wrap txt_center">
			<c:if test="${empty PH_STORED_FILE_NAME}"><label for="changePhoto"> <i class="color fa-solid fa-circle-user"></i></label>
				<input type="file" style="display: none"  id="changePhoto" onchange="uploadFile(this)" accept="image/*"/>
			</c:if>
			<c:if test="${!empty PH_STORED_FILE_NAME}">
				<div class="flexCenter" style="flex-direction: column">
					<label for="changePhoto"><img alt="${MEM_DOG_NAME}님의 이미지" src="/resources/upload/${PH_STORED_FILE_NAME}"></label>
					<input type="file" style="display: none" id="changePhoto" onchange="uploadFile(this)" accept="image/*"/>
					<input type="button"  onclick="changeDefaultImg()" value="기본이미지로 변경" class="btn submit" style="width: 150px; margin: 20px"/>
				</div>
			</c:if>

		</div>

		<table class="mem_info">
			<tr>
				<th>ID</th>
				<td>${MEM_ID}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${MEM_CALL}</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>${MEM_EMAIL}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${MEM_ADDR}</td>
			</tr>
			<tr>
				<th>강아지 이름</th>
				<td>${MEM_DOG_NAME}</td>
			</tr>
			<tr>
				<th>견종명</th>
				<td>${BR_NAME}</td>
			</tr>
			<tr>
				<th>동물등록번호</th>
				<td>${MEM_DOG_NUM}</td>
			</tr>
			<tr>
				<th>강아지 몸무게</th>
				<td>${MEM_DOG_WEIGHT}kg</td>
			</tr>
			<tr>
				<th>강아지 특이사항</th>
				<td>${MEM_DOG_ETC}</td>
			</tr>
			<tr style="border: none">
				<th></th>
				<td>
					<a class="btn submit" href="/mypage/modifyMyInfo.paw" style="float: right; margin-left: 8px">회원정보수정</a>
					<a class="btn submit" href="javascript:void(0)" onclick="goDelete()" style="float: right;">회원탈퇴</a>
				</td>
			</tr>
		</table>
	</div>
</main><!-- //main 종료 -->

<script>
	function uploadFile(event) {
		const MEM_ID = '<%=(String)session.getAttribute("mem_id")%>'
		const formData = new FormData();
		formData.append("uploadFile", event.files[0])
		formData.append("ph_board_type", "members")
		formData.append("MEM_ID", MEM_ID)
		fetch("/mypage/changePhoto", {
			method : "POST",
			body: formData
		}).then((response) => {
			window.location.reload()
		})
	}

	function changeDefaultImg() {
		const MEM_ID = '<%=(String)session.getAttribute("mem_id")%>'
		const formData = new FormData();
		formData.append("ph_board_type", "members")
		formData.append("MEM_ID", MEM_ID)
		fetch("/mypage/deletePhoto", {
			method: "DELETE",
			body : formData
		}).then(() => {
			window.location.reload()
		})
	}

	function goDelete() {
		if(confirm("회원탈퇴시 탈퇴한 아이디로는 재가입이 불가합니다. 정말 탈퇴하시겠습니까?") == true) {
			const MEM_ID = '<%=(String)session.getAttribute("mem_id")%>'
			const formData = new FormData();
			formData.append("MEM_ID", MEM_ID)
			fetch("/mypage/deleteMyInfo", {
				method : "DELETE",
				body : formData
			}).then((response) => {
				if(response.ok){
					window.location.assign("/member/login");
				}

			})
		}
	}



	// function goPost() {
	// 	if(confirm("회원탈퇴시 탈퇴한 아이디로는 재가입이 불가합니다. 정말 탈퇴하시겠습니까?") == true) {
	// 		const goPost = document.createElement('form'); //html form element를 생성 후 전송
	// 		goPost.setAttribute('method', 'post');
	// 		goPost.setAttribute('action', '/mypage/deleteMyInfo');
	// 		document.body.appendChild(goPost);
	// 		goPost.submit();
	// 	}
	// }

</script>

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>

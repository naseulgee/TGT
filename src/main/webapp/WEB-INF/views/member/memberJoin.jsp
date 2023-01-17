<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<!DOCTYPE>
<head>
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
	<script>
		tailwind.config = {
			important: true,
		}
	</script>
<title>회원가입</title>
</head>
<body>
<div class="container mx-auto mt-24 sm:px-6 lg:px-8">
<form class="space-y-8 divide-y divide-gray-200 max-w-screen-lg" action="/member/joinMember.paw" method="POST" onsubmit="return validate()">
	<div class="space-y-8 divide-y divide-gray-200 sm:space-y-5">
		<div class="space-y-6 sm:space-y-5">
			<div>
				<h3 class="text-lg font-medium leading-6 text-gray-900">회원가입</h3>
				<p class="mt-1 max-w-2xl text-sm text-gray-500">투개더 회원가입을 위한 내용을 작성해주세요.</p>
			</div>
				</div>

		<div class="space-y-6 pt-8 sm:space-y-5 sm:pt-10">

			<div class="space-y-6 sm:space-y-5">
				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="MEM_ID" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">아이디</label>
					<div class="mt-1 sm:mt-0">
						<input type="text" name="MEM_ID" id="MEM_ID" maxlength="36" autocomplete="username"  class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
					</div>
					<input type="button" onclick="" value="중복확인" class="inline-flex justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 mr-auto"  >
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="MEM_PW" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">비밀번호</label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<input type="password" name="MEM_PW" id="MEM_PW" autocomplete="current-password" maxlength="15" class="block w-full max-w-md rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
						<p class="mt-2 text-sm text-red-600" id="pw-error"></p>
					</div>
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="MEM_NEWPW" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">비밀번호확인</label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<input type="password" name="MEM_NEWPW" id="MEM_NEWPW" maxlength="15" autocomplete="new-password" class="block w-full max-w-md rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
						<p class="mt-2 text-sm text-red-600" id="new-pw-error"></p>
					</div>
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="MEM_CALL" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">전화번호</label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<input type="text" name="MEM_CALL" id="MEM_CALL"  placeholder="010-1234-5678"  maxlength="55"  class="block w-full max-w-md rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
					</div>
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="MEM_EMAIL" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">이메일</label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<input id="MEM_EMAIL" name="MEM_EMAIL" type="email" maxlength="100" placeholder="example@naver.com" autocomplete="email" class="block w-full max-w-lg rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
						<p class="mt-2 text-sm text-red-600" id="email-error"></p>
					</div>
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5 max-w-screen-lg">
					<label class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">주소</label>
					<input type="text" id="postcode" placeholder="우편번호"  class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
					<input type="button" onclick="findPostcode()" value="우편번호 찾기" class="inline-flex justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 mr-auto"  ><br>
					<input type="text" id="address" placeholder="주소"  class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm col-span-2"><br>
					<input type="text" id="detailAdress" placeholder="상세주소"  class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
					<input type="hidden" id="extra" placeholder="참고항목">

				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="MEM_DOG_NAME" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">강아지 이름</label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<input type="text" name="MEM_DOG_NAME" id="MEM_DOG_NAME" maxlength="16" class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
					</div>
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="KINDOFDOG" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">견종명</label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<select id="KINDOFDOG" name="KINDOFDOG"  class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
							<option value="1" selected>푸들</option>
						</select>
					</div>
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5" id="brname" name="brname">
					<label for="MEM_BR_NAME" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2"></label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<input type="text" name="MEM_BR_NAME" id="MEM_BR_NAME" maxlength="15" placeholder="견종명을 입력하세요." class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
					</div>
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="MEM_DOG_NUM" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">동물등록번호</label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<input type="text" name="MEM_DOG_NUM" id="MEM_DOG_NUM" maxlength="15" placeholder="동물등록번호를 입력하세요. (생략 가능)" class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
					</div>
				</div>



				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5" name="">
					<label for="MEM_DOG_NUM" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">강아지 몸무게</label>
					<div class="mt-1 sm:mt-0">
						<input type="text" name="MEM_DOG_WEIGHT" id="MEM_DOG_WEIGHT" maxlength="10"  class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:max-w-xs sm:text-sm">
					</div>
					<span class="self-center">kg</span>
				</div>

				<div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
					<label for="MEM_DOG_ETC" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">강아지 특이사항</label>
					<div class="mt-1 sm:col-span-2 sm:mt-0">
						<textarea id="MEM_DOG_ETC" name="MEM_DOG_ETC" rows="3" class="block w-full max-w-lg rounded-md shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"></textarea>
					</div>
			</div>
		</div>

	<div class="pt-5">
		<div class="flex justify-end">
			<button type="button" class="rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2" onclick="location.href='/sample.paw'">취소</button>
			<button type="submit" class="ml-3 inline-flex justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">회원가입</button>
		</div>
	</div>

	</div>
	</div>
</form>
</div>
</body>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
/** 폼 검증하는 함수 */
	function validate() {
		const pass = document.querySelector('#MEM_PW');
		const passErrMsg = document.querySelector('#pw-error');
		const newPass = document.querySelector('#MEM_NEWPW');
		const newPassErrMsg = document.querySelector('#new-pw-error');
		const email = document.querySelector('#MEM_EMAIL');
		const emailErrMsg = document.querySelector('#email-error');

		let result = true;
		// password 검증
		if(pass.value === ""){
			passErrMsg.textContent = "비밀번호를 입력해주세요."
			result = false;
		}else if (pass.value.length < 8) {
			passErrMsg.textContent = "8글자 이상 입력해주세요."
			result = false;
		}else {
			passErrMsg.textContent = ""
		}

		//비밀번호 확인 일치여부
		if(pass.value !== newPass.value) {
			newPassErrMsg.textContent = "비밀번호가 일치하지 않습니다."
			result = false;
		} else {
			newPassErrMsg.textContent = ""
		}

		// email 검증
		if(email.value === ""){
			emailErrMsg.textContent = "이메일을 입력해주세요."
			result = false;
		}else{
			emailErrMsg.textContent = ""
		}
		return result


	}


function findPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extra").value = extraAddr;

			} else {
				document.getElementById("extra").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAdress").focus();
		}
	}).open();
}
</script>

</html>

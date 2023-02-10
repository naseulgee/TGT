<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<script>
  tailwind.config = {
    important: true,
  }
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<!-- 비밀번호 찾기에서 입력한 인증번호가 일치할 때 새로운 비밀번호로 변경하는 페이지 -->
<main class="layoutCenter">
  <div class="flex min-h-full items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <div class="w-full max-w-md space-y-8">
      <div>
        <img class="mx-auto h-12 w-auto" src="/resources/image/logo.png" alt="투개더">
        <h2 class="mt-6 text-center text-3xl font-bold tracking-tight text-[#f0b1aa]">비밀번호 재설정</h2>

      </div>
      <form class="mt-8 space-y-6" action="/member/postsetNewPassword" method="POST" onsubmit="return checkForm()">
        <div class="-space-y-px rounded-md shadow-sm">
          <div>
            <label for="MEM_PW" class="sr-only">ID</label>
            <input id="MEM_PW" name="MEM_PW" type="password" autocomplete="current-password" maxlength="15" class="relative block w-full appearance-none rounded-none rounded-t-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-[#f08080] focus:outline-none focus:ring-[#f08080] sm:text-sm" placeholder="새로운 비밀번호를 입력해주세요.">
          </div>
          <div>
            <label for="MEM_NEWPW" class="sr-only">Password</label>
            <input id="MEM_NEWPW" name="MEM_NEWPW" type="password" maxlength="15" autocomplete="new-password"class="relative block w-full appearance-none rounded-none rounded-b-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-[#f08080] focus:outline-none focus:ring-[#f08080] sm:text-sm" placeholder="비밀번호 확인">
          </div>
        </div>
        <p class="mt-2 text-sm text-red-600" id="pw-error"></p>
        <p class="mt-2 text-sm text-red-600" id="new-pw-error"></p>
        <div>
          <button type="submit" class="group relative flex w-full justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2">
            확인
          </button>
        </div>
      </form>
    </div>
  </div>

  <script type="text/javascript">

  /** 폼체크 함수 */
  function checkForm() {
    const pass = document.querySelector('#MEM_PW');
    const passErrMsg = document.querySelector('#pw-error');
    const newPass = document.querySelector('#MEM_NEWPW');
    const newPassErrMsg = document.querySelector('#new-pw-error');

    let result = true;

    // password 검증
    if (pass.value === "") {
      passErrMsg.textContent = "비밀번호를 입력해주세요."
      result = false;
    } else if (pass.value.length < 8) {
      passErrMsg.textContent = "8글자 이상 입력해주세요."
      result = false;
    } else {
      passErrMsg.textContent = ""
    }

    //비밀번호 확인 일치여부
    if (pass.value !== newPass.value) {
      newPassErrMsg.textContent = "비밀번호가 일치하지 않습니다."
      result = false;
    } else {
      newPassErrMsg.textContent = ""
    }
    return result
  }


  </script>



</main><!-- //main 종료 -->

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
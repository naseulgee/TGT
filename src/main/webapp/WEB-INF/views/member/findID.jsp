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
<main class="layoutCenter">
  <div class="flex min-h-full items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <div class="w-full max-w-md space-y-8">
      <div>
        <img class="mx-auto h-12 w-auto" src="/resources/image/logo.png" alt="투개더">
        <h2 class="mt-6 text-center text-3xl font-bold tracking-tight text-[#f0b1aa]">아이디를 잊으셨나요?</h2>

      </div>
      <form class="mt-8 space-y-6" action="/member/findID" method="POST">
        <div class="-space-y-px rounded-md shadow-sm">
          <div>
            <label for="MEM_EMAIL" class="sr-only">이메일</label>
            <input id="MEM_EMAIL" name="MEM_EMAIL" type="text" required class="relative block w-full appearance-none rounded-none rounded-t-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-[#f08080] focus:outline-none focus:ring-[#f08080] sm:text-sm" placeholder="회원가입시 입력했던 이메일주소를 적어주세요. ex)example@naver.com">
          </div>
        </div>

        <div>
          <button type="submit" class="group relative flex w-full justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2">
            아이디 찾기
          </button>
        </div>
      </form>
    </div>
  </div>
</main><!-- //main 종료 -->

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
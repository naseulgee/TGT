<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf" %>

<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
        integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>


<script>
    tailwind.config = {
        important: true,
    }
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<!--로그인 페이지. 로그인에 성공했을 시 메인페이지로 이동한다. 실패시 에러메세지를 담은 페이지가 호출된다.-->
<main class="layoutCenter">
    <div class="flex min-h-full items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="w-full max-w-md space-y-8">
            <div>
                <img class="mx-auto h-12 w-auto" src="/resources/image/logo.png" alt="투개더">
                <h2 class="mt-6 text-center text-3xl font-bold tracking-tight text-[#f0b1aa]">당신의 반려견을 소개해보세요.</h2>
            </div>
            <form class="mt-8 space-y-6" action="/member/login" method="POST">
                <div class="-space-y-px rounded-md shadow-sm">
                    <div>
                        <label for="MEM_ID" class="sr-only">ID</label>
                        <input id="MEM_ID" name="MEM_ID" autocomplete="username" class="relative block w-full appearance-none rounded-none rounded-t-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-[#f08080] focus:outline-none focus:ring-[#f08080] sm:text-sm" placeholder="ID">
                    </div>
                    <div>
                        <label for="MEM_PW" class="sr-only">Password</label>
                        <input id="MEM_PW" name="MEM_PW" type="password" autocomplete="current-password" class="relative block w-full appearance-none rounded-none rounded-b-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-[#f08080] focus:outline-none focus:ring-[#f08080] sm:text-sm" placeholder="Password">
                    </div>
                </div>

                <div class="flex items-center justify-between">
                    <div class="text-sm">
                        <p class="text-[#f0b1aa]"><a href="/member/findID.paw" class="font-medium text-[#f0b1aa]">아이디찾기</a>&nbsp&nbsp|&nbsp&nbsp<a href="/member/findPassword.paw" class="font-medium text-[#f0b1aa]">비밀번호 찾기</a></p>
                    </div>
                    <div class="text-sm">
                    <a href="/member/openMemberJoin.paw" class="font-medium text-[#f0b1aa] text-align:right;">회원가입</a>
                    </div>
                </div>

                <div>
                    <button type="submit" class="group relative flex w-full justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2">
          <span class="absolute inset-y-0 left-0 flex items-center pl-3">

            <svg class="h-5 w-5 text-white group-hover:text-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z" clip-rule="evenodd" />
            </svg>
          </span>
                        Login
                    </button>
                </div>
                <div>
                <a id="kakao-login-btn" href="javascript:loginWithKakao()">
                    <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
                         alt="카카오 로그인 버튼" />
                </a>
                <p id="token-result"></p>
                </div>

            </form>
        </div>
    </div>

    <script type='text/javascript'>
        Kakao.init('54fbb296360ef518e73c7b5f2275c239');

        function loginWithKakao() {
            Kakao.Auth.authorize({
                redirectUri: 'http://localhost:8000/member/socialLogin',
            });
        }

        // 아래는 데모를 위한 UI 코드입니다.
        displayToken()
        function displayToken() {
            var token = getCookie('authorize-access-token');

            if(token) {
                Kakao.Auth.setAccessToken(token);
                Kakao.Auth.getStatusInfo()
                    .then(function(res) {
                        if (res.status === 'connected') {
                            document.getElementById('token-result').innerText
                                = 'login success, token: ' + Kakao.Auth.getAccessToken();
                        }
                    })
                    .catch(function(err) {
                        Kakao.Auth.setAccessToken(null);
                    });
            }
        }

        function getCookie(name) {
            var parts = document.cookie.split(name + '=');
            if (parts.length === 2) { return parts[1].split(';')[0]; }
        }

    </script>
</main><!-- //main 종료 -->

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
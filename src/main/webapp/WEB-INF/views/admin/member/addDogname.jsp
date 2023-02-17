<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<script src="/resources/js/common/daum_address.js"></script>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<script>
    tailwind.config = {
        important: true,
    }
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<!-- 회원정보 수정페이지 -->
<main class="layoutCenter">
    <div class="contaㅁiner mx-auto mt-24 sm:px-6 lg:px-8">
        <div class="space-y-8 divide-y divide-gray-200 max-w-screen-lg">
            <div class="space-y-6 sm:space-y-5">
                <div>
                    <h3 class="text-lg font-medium leading-6 text-gray-900">견종이름 추가</h3>
                </div>
            </div>

            <form class="space-y-8 divide-y divide-gray-200 max-w-screen-lg" action="/admin/dogname" method="POST">
                <div class="space-y-8 divide-y divide-gray-200 sm:space-y-5">
                    <div class="space-y-6 pt-8 sm:space-y-5 sm:pt-10">
                        <div class="space-y-6 sm:space-y-5">
                            <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                                <label for="BR_NAME"
                                       class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">견종이름</label>
                                <div class="mt-1 sm:mt-0">
                                    <input type="text" name="BR_NAME" id="BR_NAME" maxlength="36" autocomplete=""
                                           class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                    <p class="mt-2 text-sm text-red-600" id="dogname-error"></p>
                                </div>
                            </div>
                        </div>

                        <div class="pt-5">
                            <div class="flex justify-end">
                                <button type="button"
                                        class="rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2"
                                        onclick="location.href='/admin/adminMember.paw'">취소
                                </button>
                                <button type="submit"
                                        class="ml-3 inline-flex justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2">
                                    견종이름추가
                                </button>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>
    </body>


    <script type="text/javascript">

        /** 폼 검증하는 함수 */
        function checkForm() {
            const nameofdog = document.querySelector('#BR_NAME');
            const nameofdogErrMsg = document.querySelector('#dogname-error');

            let result = true;

            // 강아지이름 검증
            if (nameofdog.value === "") {
                nameofdogErrMsg.textContent = "견종 이름을 입력해주세요."
                result = false;
            } else {
                nameofdogErrMsg.textContent = ""
            }


        }



    </script>
</main>
<!-- //main 종료 -->

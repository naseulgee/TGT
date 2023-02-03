<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/common/daum_address.js"></script>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<script src="/resources/js/common/photo.js" defer></script> <!--사진등록처리-->
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css" ></link><!--사진등록시 디자인처리-->
<script>
    tailwind.config = {
        important: true,
    }
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
    <div class="container mx-auto mt-24 sm:px-6 lg:px-8">
<%--        <form class="space-y-8 divide-y divide-gray-200 max-w-screen-lg" action="/member/joinMember.paw" method="POST"--%>
<%--              onsubmit="return checkForm()">--%>
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
                            <label for="MEM_ID"
                                   class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">아이디</label>
                            <div class="mt-1 sm:mt-0">
                                <input type="text" name="MEM_ID" id="MEM_ID" maxlength="36" autocomplete="username"
                                       class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                <p class="mt-2 text-sm text-red-600" id="verification"></p>
                            </div>
                            <input type="button" id="btnCheck" onclick="idValidate()" value="중복확인"
                                   class="inline-flex justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2 mr-auto">

                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                            <label for="MEM_PW"
                                   class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">비밀번호</label>
                            <div class="mt-1 sm:col-span-2 sm:mt-0">
                                <input type="password" name="MEM_PW" id="MEM_PW" autocomplete="current-password"
                                       maxlength="15"
                                       class="block w-full max-w-md rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                <p class="mt-2 text-sm text-red-600" id="pw-error"></p>
                            </div>
                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                            <label for="MEM_NEWPW" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">비밀번호확인</label>
                            <div class="mt-1 sm:col-span-2 sm:mt-0">
                                <input type="password" name="MEM_NEWPW" id="MEM_NEWPW" maxlength="15"
                                       autocomplete="new-password"
                                       class="block w-full max-w-md rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                <p class="mt-2 text-sm text-red-600" id="new-pw-error"></p>
                            </div>
                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                            <label for="MEM_CALL"
                                   class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">전화번호</label>
                            <div class="mt-1 sm:col-span-2 sm:mt-0">
                                <input type="text" name="MEM_CALL" id="MEM_CALL" placeholder="010-1234-5678"
                                       maxlength="55"
                                       class="block w-full max-w-md rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                <p class="mt-2 text-sm text-red-600" id="mem-call-error"></p>
                            </div>

                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                            <label for="MEM_EMAIL"
                                   class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">이메일</label>
                            <div class="mt-1 sm:mt-0">
                                <input type="email" name="MEM_EMAIL" id="MEM_EMAIL" maxlength="100" autocomplete="email" placeholder="example@naver.com"
                                       class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                <p class="mt-2 text-sm text-red-600" id="email-error"></p>
                            </div>
                            <input type="button" id="checkEmail" onclick="emailValidate()" value="중복확인"
                                   class="inline-flex justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2 mr-auto">

                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5 max-w-screen-lg">
                            <label class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">주소</label>
                            <input type="text" id="postcode" placeholder="우편번호"
                                   class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                            <input type="button" onclick="findPostcode()" value="우편번호 찾기"
                                   class="inline-flex justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2 mr-auto"><br>
                            <input type="text" id="address" name="address" placeholder="주소"
                                   class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm col-span-2"><br>
                            <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"
                                   class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                            <input type="hidden" id="extra" placeholder="참고항목">

                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                            <label for="MEM_DOG_NAME" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">강아지
                                이름</label>
                            <div class="mt-1 sm:col-span-2 sm:mt-0">
                                <input type="text" name="MEM_DOG_NAME" id="MEM_DOG_NAME" maxlength="16"
                                       class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                <p class="mt-2 text-sm text-red-600" id="dogname-error"></p>
                            </div>
                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                            <label for="KINDOFDOG"
                                   class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">견종명</label>
                            <div class="mt-1 sm:col-span-2 sm:mt-0">
                                <c:if test="${!empty dogList}">
                                    <select name="KINDOFDOG" id="KINDOFDOG" style="width:80px;"
                                            onchange="showOrNot(this)"
                                            class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                        <c:forEach var="row" items="${dogList}" varStatus="i">
                                            <option value="${row.BR_IDX}">${row.BR_NAME}</option>
                                        </c:forEach>
                                    </select>
                                </c:if>
                            </div>
                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5" id="brname" name="brname">
                            <label for="MEM_BR_NAME"
                                   class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2"></label>
                            <div class="mt-1 sm:col-span-2 sm:mt-0">
                                <input type="text" name="MEM_BR_NAME" id="MEM_BR_NAME" maxlength="15"
                                       placeholder="견종명을 입력하세요."
                                       class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                            </div>
                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                            <label for="MEM_DOG_NUM" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">동물등록번호</label>
                            <div class="mt-1 sm:col-span-2 sm:mt-0">
                                <input type="text" name="MEM_DOG_NUM" id="MEM_DOG_NUM" maxlength="15"
                                       placeholder="동물등록번호를 입력하세요. (생략 가능)"
                                       class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                            </div>
                        </div>


                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5" name="">
                            <label for="MEM_DOG_NUM" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">강아지
                                몸무게</label>
                            <div class="mt-1 sm:mt-0">
                                <input type="text" name="MEM_DOG_WEIGHT" id="MEM_DOG_WEIGHT" maxlength="10"
                                       class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:max-w-xs sm:text-sm">
                                <p class="mt-2 text-sm text-red-600" id="weightofdog-error"></p>
                            </div>
                            <span class="self-center">kg</span>
                        </div>

                        <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                            <label for="MEM_DOG_ETC" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">강아지
                                특이사항</label>
                            <div class="mt-1 sm:col-span-2 sm:mt-0">
                                <textarea id="MEM_DOG_ETC" name="MEM_DOG_ETC" maxlength="85" rows="3"
                                          class="block w-full max-w-lg rounded-md shadow-sm focus:border-[#f08080] focus:ring-[#f08080] sm:text-sm"></textarea>
                            </div>
                        </div>
                    </div>

                    <input type="hidden" value="members" name="ph_board_type">

                    <div class="sm:grid sm:grid-cols-3 sm:items-start sm:gap-4 sm:pt-5">
                        <label for="photo1" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">강아지 사진</label>
                    <div id="img_upload" class="flexCenter flexWrap">
                        <!-- 아이콘을 누르면 file 선택이 되도록 설정 -->
                        <label>
                            <i class="fa-thin fa-image no-image"></i>
                            <input type="file" accept="image/*" id="photo1" name="photo1" >
                        </label>
                    </div>
                    </div>



                    <div class="pt-5">
                        <div class="flex justify-end">
                            <button type="button"
                                    class="rounded-md border border-gray-300 bg-white py-2 px-4 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2"
                                    onclick="location.href='/sample'">취소
                            </button>
                            <button type="button" id="uploadBtn" name="uploadBtn"
                                    class="ml-3 inline-flex justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2">
                                회원가입
                            </button>
                        </div>
                    </div>

                </div>
            </div>
<%--        </form>--%>
    </div>
    </body>


    <script type="text/javascript">
        /** 아이디 검증 */
        function idValidate() {
            const id = document.querySelector('#MEM_ID');
            const idErrMsg = document.querySelector('#verification');
            if (id.value == "") {
                idErrMsg.textContent = "아이디를 입력하세요.";
            } else {
                idErrMsg.textContent = "";
                fetch("/idCheck?id=" + id.value)
                    .then((response) => {
						if(response.ok) {
							idErrMsg.textContent = "사용가능한 아이디 입니다.";
						} else {
							idErrMsg.textContent = "중복된 아이디 입니다.";
						}
                    })
            }


            // if ($('#MEM_ID').val() != '') {
            //
            // 	// 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
            // 	$.ajax({
            //
            // 		type: 'GET',
            // 		url: '/idCheck',
            // 		data: 'id=' + $('#MEM_ID').val(),
            // 		dataType: 'json',
            // 		success: function(response) {
            // 			if (response == '0') {
            // 				$('#verification').text('사용 가능한 아이디입니다.');
            // 				$('#verification').css('color', 'green');
            // 			} else {
            // 				$('#verification').text('이미 사용중인 아이디입니다.');
            // 				$('#verification').css('color', 'red');
            // 			}
            // 		},
            // 		error: function(a, b, c) {
            // 			console.log(a, b, c);
            // 		}
            //
            // 	});
            //
            // } else {
            // 	$('#verification').text('아이디를 입력해주세요.');
            // 	$('#verification').css('color', 'red');
            // 	$('#MEM_ID').focus();
            // }
        }
        /**이메일 검증 */
        function emailValidate() {
            const email = document.querySelector('#MEM_EMAIL');
            const emailErrMsg = document.querySelector('#email-error');
            if (email.value == "") {
                emailErrMsg.textContent = "이메일을 입력하세요.";
            } else {
                emailErrMsg.textContent = "";
                fetch("/emailCheck?email=" + email.value)
                    .then((response) => {
                        if (response.ok) {
                            emailErrMsg.textContent = "사용가능한 이메일 주소입니다.";
                        } else {
                            emailErrMsg.textContent = "중복된 이메일 주소입니다.";
                        }
                    })
            }
        }

            /** 셀렉트박스 선택에 따라 견종명 입력창 보여주기 여부 */
            function showOrNot(element) {
                if (element.value == 1) {
                    document.getElementById("MEM_BR_NAME").style.visibility = "";
                } else {
                    document.getElementById("MEM_BR_NAME").style.visibility = "hidden";
                    document.getElementById("MEM_BR_NAME").value = "";
                }
            }


            /** 폼 검증하는 함수 */
            function checkForm() {
                const idErrMsg = document.querySelector('#verification');
                const call = document.querySelector('#MEM_CALL');
                const callErrMsg = document.querySelector('#mem-call-error');
                const pass = document.querySelector('#MEM_PW');
                const passErrMsg = document.querySelector('#pw-error');
                const newPass = document.querySelector('#MEM_NEWPW');
                const newPassErrMsg = document.querySelector('#new-pw-error');
                const emailErrMsg = document.querySelector('#email-error');
                const nameofdog = document.querySelector('#MEM_DOG_NAME');
                const nameofdogErrMsg = document.querySelector('#dogname-error');
                const weightofdog = document.querySelector('#MEM_DOG_WEIGHT');
                const weightofdogErrMsg = document.querySelector('#weightofdog-error');


                let result = true;

                // 아이디 검증
                if (idErrMsg.textContent == "") {
                    result = false;
                    idErrMsg.textContent = "아이디 중복확인을 눌러주세요."
                } else if (idErrMsg.textContent == "이메일 중복확인을 눌러주세요.") {
                    result = false;
                } else if (idErrMsg.textContent == "중복된 아이디 입니다.") {
                    result = false;
                }

                // 이메일 검증
                if (emailErrMsg.textContent == "") {
                    result = false;
                    emailErrMsg.textContent = "이메일 중복확인을 눌러주세요."
                } else if (emailErrMsg.textContent == "이메일 중복확인을 눌러주세요.") {
                    result = false;
                } else if (emailErrMsg.textContent == "중복된 이메일 주소입니다.") {
                    result = false;
                }

                // 강아지몸무게 검증
                if (weightofdog.value === "") {
                    weightofdogErrMsg.textContent = "강아지 몸무게를 입력해주세요."
                    result = false;
                } else {
                    weightofdogErrMsg.textContent = ""
                }

                // 강아지이름 검증
                if (nameofdog.value === "") {
                    nameofdogErrMsg.textContent = "강아지이름을 입력해주세요."
                    result = false;
                } else {
                    nameofdogErrMsg.textContent = ""
                }

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

                // 전화번호 검증
                if (call.value === "") {
                    callErrMsg.textContent = "전화번호를 입력해주세요."
                    result = false;
                } else {
                    callErrMsg.textContent = ""
                }
                return result


            }

            $(document).ready(function () {
                //등록작업을 해주는 url을 파라미터로 집어넣기!!
                form_submit("/member/joinMember");
            });


    </script>
</main>
<!-- //main 종료 -->

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<head>
<title>회원가입</title>

</head>
<body>
    <div class="user_view wdp_30" >
        <div class="con_center under_line"><h5>회원 가입</h5></div>
        <form id="frm" class="padding_5" onSubmit="JavaScript:fn_joinMember()">
             <fieldset>
                            	<div class="form-group" id="divInputId">
                            		<label>아이디</label>
                            		<input class="form-control" style="margin-bottom: 5px;" placeholder="아이디" name="MEM_ID" id="MEM_ID" type="text" />
                            		<input type="button" class="btn btn-default" style="width: 30%;" value="중복확인" onclick="duplicationId();" />
                            	</div>
                            	<div class="form-group">
                            		<label>비밀번호</label>
                            		<input class="form-control" placeholder="비밀번호" name="MEM_PW" id="MEM_PW" type="password" />
                            	</div>
                            	<div class="form-group">
                            		<label>비밀번호 확인</label>
                            		<input class="form-control" placeholder="비밀번호 확인" name="MEM_PW2" id="MEM_PW2" type="password" />
                            	</div>
                            	<div class="form-group">
                            		<label>전화번호</label>
                            		<input class="form-control" placeholder="전화번호를 입력해주세요. ex)010-1234-5678" name="MEM_CALL" id="MEM_CALL" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>이메일</label>
                            		<input class="form-control" placeholder="이메일" name="MEM_EMAIL" id="MEM_EMAIL" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label style="display: block;" >주소</label>
                            		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="MEM_ADDR" id="MEM_ADDR" type="text" readonly="readonly" >
                            		<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                            		<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                                <div class="modal-dialog">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                                            <h4 class="modal-title" id="myModalLabel">우편번호 서비스</h4>
	                                        </div>
	                                        <div class="modal-body">
	                                        	<label>주소 입력</label>
	                                        	<div class="form-group input-group">
		                                           <input type="text" class="form-control" name="dlgSearchAddress" onclick="execPostCode();">
			                                           <span class="input-group-btn">
			                                               <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
			                                               </button>
			                                           </span>
		                                       </div>
	                                            <p class="help-block">아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
	                                            <p class="help-block">도로명 + 건물번호</p>
	                                            <p class="text-primary">예) 판교역로 235, 제주 첨단로 242</p>
	                                            <p class="help-block">지역명(동/리) + 번지</p>
	                                            <p class="text-primary">예) 삼평동 681, 제주 영평동 2181</p>
	                                            <p class="help-block">지역명(동/리) + 건물명(아파트명)</p>
	                                            <p class="text-primary">예) 분당 주공, 연수동 주공3차</p>
	                                            <p class="help-block">사서함명 + 번호</p>
	                                            <p class="text-primary">예) 분당우체국사서함 1~100</p>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                                            <button type="button" class="btn btn-primary">저장</button>
	                                        </div>
	                                    </div>
	                                    /.modal-content
	                                </div>
	                                /.modal-dialog
	                            </div> -->
                            	</div>
                            	<div class="form-group">
                            		<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="signUpUserCompanyAddress" id="signUpUserCompanyAddress" type="text" readonly="readonly" />
                            	</div>
                            	<div class="form-group">
                            		<input class="form-control" placeholder="상세주소" name="signUpUserCompanyAddressDetail" id="signUpUserCompanyAddressDetail" type="text"  />
                            	</div>
                            	<input type="hidden" id="MEM_TYPE" value="1">
                            	<div class="form-group">
                            		<label>강아지 이름</label>
                            		<input class="form-control" placeholder="강아지 이름" name="MEM_DOG_NAME" id="MEM_DOG_NAME" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>동물등록번호</label>
                            		<input class="form-control" placeholder="동물등록번호" name="MEM_DOG_NUM" id="MEM_DOG_NUM" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>견종명</label>
                            		<input class="form-control" placeholder="견종명" name="KINDOFDOG" id="KINDOFDOG" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>몸무게</label>
                            		<input class="form-control" placeholder="몸무게" name="MEM_DOG_WEIGHT" id="MEM_DOG_WEIGHT" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>강아지 특이사항</label>
                            		<textarea rows="5" style="width: 80%; height: auto;" title="강아지 특이사항" id="MEM_DOG_ETC" name="MEM_DOG_ETC"></textarea>
                            	</div>
                            	
                            </fieldset>    
             <button type="submit" class="btn con_center">회원 가입</button>
        </form>
    </div>
</body>
    <script type="text/javascript">
         
        function fn_joinMember(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/joinUser.do'/>");
            comSubmit.submit();
        }
         
    </script>
</html>

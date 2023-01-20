<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/form.css"/>
<script src="/resources/js/place/form.js"></script>
<script src="/resources/js/common/daum_address.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1 class="txt_center">우리동네 시설 등록</h1>
<form id="placeWrite" action="write.paw" method="post">
	<ul>
		<li class="name req">
			<label for="pl_name"><strong>시설명</strong></label>
			<div class="input_wrap">
				<input type="text" id="pl_name" name="pl_name" value="${!empty PL_NAME?PL_NAME:''}" maxlength="25" placeholder="시설 이름을 적어주세요">
				<p class="info_warn">유효성 검증 결과</p>
			</div>
		</li>
		<li class="addr req">
			<label for="pl_loc_btn"><strong>시설 주소</strong></label>
			<div class="input_wrap flex flexWrap">
				<input id="pl_loc_btn" class="btn submit" type="button" value="주소 검색" onclick="findPostcode(); remove_addr();">
				<c:choose>
					<c:when test="${!empty PL_LOC}">
						<input type="text" id="address" value="${fn:split(PL_LOC,',')[0]}" readonly>
						<input type="text" id="detailAddress" value="${fn:split(PL_LOC,',')[1]}" placeholder="상세주소">
						<input type="hidden" id="postcode">
						<input type="hidden" id="extra">
						<input type="hidden" id="pl_loc" name="pl_loc" value="${PL_LOC}">
					</c:when>
					<c:otherwise>
						<input type="text" id="address" name="address" readonly>
						<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소를 입력해주세요">
						<input type="hidden" id="postcode">
						<input type="hidden" id="extra" name="pl_loc">
					</c:otherwise>
				</c:choose>
			</div>
		</li>
		<li class="cate req">
			<strong>시설 분류</strong>
			<div class="input_wrap slim_scroll">
				<div class="scroll_wrap flex">
					<c:if test="${!empty cate_list}">
						<c:forEach var="c" items="${cate_list}">
							<input id="ca${c.PC_IDX}" type="radio" name="pl_cate" value="${c.PC_NAME}">
							<label class="btn" for="ca${c.PC_IDX}">${c.PC_NAME}</label>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</li>
		<li class="call">
			<label for="pl_call1"><strong>전화번호</strong></label>
			<div class="input_wrap">
				<c:if test="${!empty PL_CALL}">
					<input id="tel1" type="tel" name="tel1" value="${fn:split(PL_CALL,'-')[0]}"> - 
					<input id="tel2" type="tel" name="tel2" value="${fn:split(PL_CALL,'-')[1]}"> - 
					<input id="tel3" type="tel" name="tel3" value="${fn:split(PL_CALL,'-')[2]}">
					<input id="pl_call" type="hidden" name="pl_call" value="${PL_CALL}">
				</c:if>
				<c:if test="${empty PL_CALL}">
					<input id="tel1" type="tel" name="tel1"> - 
					<input id="tel2" type="tel" name="tel2"> - 
					<input id="tel3" type="tel" name="tel3">
					<input id="pl_call" type="hidden" name="pl_call">
				</c:if>
			</div>
		</li>
		<li class="offday">
			<strong>휴무일</strong>
			<c:set var="PL_OFFDAY" value="월,화,금"/>
			<div class="input_wrap flexWrap">
				<c:forEach var="day" items="${fn:split('월,화,수,목,금,토,일',',')}" varStatus="status">
					<c:set var="i" value="${(status.index + 1)>=7?(status.index + 1)-7:(status.index + 1)}"/>
					<input id="d${i}" type="checkbox" name="pl_offday" value="${i}" ${(!empty PL_OFFDAY&&1==1)?"checked":""}>
					<label class="btn round" for="d${i}">${day}</label>
				</c:forEach>
			</div>
		</li>
		<li class="open">
			<label for="pl_open"><strong>시작시간</strong></label>
			<div class="input_wrap">
				<input type="time" id="pl_open" name="pl_open" value="${!empty PL_NAME?PL_NAME:''}">
			</div>
		</li>
		<li class="close">
			<label for="pl_close"><strong>종료시간</strong></label>
			<div class="input_wrap"><input type="time" id="pl_close" name="pl_close" value="${!empty PL_NAME?PL_NAME:''}"></div>
		</li>
		<li>
			<label for=""><strong>이미지 정보</strong></label>
			<div class="input_wrap">현지가 오열하면서 작성중..또륵..</div>
		</li>
		<li class="sub_btn"><input class="btn submit" type="submit" value="등록하기"></li>
	</ul>
</form>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
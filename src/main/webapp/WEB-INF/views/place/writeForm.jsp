<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/form.css"/>
<script src="/resources/js/place/form.js"></script>

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
			<div class="input_wrap">
				<input id="pl_loc_btn" class="btn submit" type="button" value="주소 검색" onclick="search_addr()">
				<p>${!empty PL_LOC?PL_LOC:''}</p>
				<input type="hidden" name="pl_loc" value="${!empty PL_LOC?PL_LOC:''}">
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
					<c:set var="call" value="${fn:split(PL_CALL,'-')}" />
					<input type="tel" name="pl_call1" value="${call[0]}"> - 
					<input type="tel" name="pl_call2" value="${call[1]}"> - 
					<input type="tel" name="pl_call3" value="${call[2]}">
					<input type="hidden" name="pl_call" value="${PL_CALL}">
				</c:if>
				<c:if test="${empty PL_CALL}">
					<input type="tel" name="pl_call1"> - 
					<input type="tel" name="pl_call2"> - 
					<input type="tel" name="pl_call3">
					<input type="hidden" name="pl_call">
				</c:if>
			</div>
		</li>
		<li class="offday">
			<strong>휴무일</strong>
			<div class="input_wrap flexWrap">
				<c:forTokens var="day" items="월,화,수,목,금,토,일" delims="," varStatus="status">
					${day}${index}<br>
				</c:forTokens>
				<input id="d1" type="checkbox" name="pl_offday" value="1">
				<label class="btn round" for="d1">월</label>
				<input id="d2" type="checkbox" name="pl_offday" value="2">
				<label class="btn round" for="d2">화</label>
				<input id="d3" type="checkbox" name="pl_offday" value="3">
				<label class="btn round" for="d3">수</label>
				<input id="d4" type="checkbox" name="pl_offday" value="4">
				<label class="btn round" for="d4">목</label>
				<input id="d5" type="checkbox" name="pl_offday" value="5">
				<label class="btn round" for="d5">금</label>
				<input id="d6" type="checkbox" name="pl_offday" value="6">
				<label class="btn round" for="d6">토</label>
				<input id="d0" type="checkbox" name="pl_offday" value="0">
				<label class="btn round" for="d0">일</label>
			</div>
		</li>
		<li class="open">
			<label for="pl_open"><strong>시작시간</strong></label>
			<div class="input_wrap"><input type="time" id="pl_open" name="pl_open" value="${!empty PL_NAME?PL_NAME:''}"></div>
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
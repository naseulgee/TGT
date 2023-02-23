<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css"/>
<link rel="stylesheet" type="text/css" href="/resources/css/place/form.css"/>
<script src="/resources/js/place/form.js"></script>
<script src="/resources/js/common/daum_address.js"></script>
<script src="/resources/js/common/photo.js" defer></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<div class="txt_center"><img src="/resources/image/place.jpg"></div><br>
<h1 class="txt_center">우리동네 시설 등록</h1>
<form id="placeWrite" method="post">
<input type="hidden" name="ph_board_type" value="place">
<c:if test="${!empty detail.place.PL_IDX}">
<input type="hidden" id="pl_idx" name="pl_idx" value="${detail.place.PL_IDX}"></c:if>
	<ul>
		<li class="name req">
			<label for="pl_name"><strong>시설명</strong></label>
			<div class="input_wrap" data-check-type="one" data-check-id="pl_name">
				<input type="text" id="pl_name" name="pl_name" value="${!empty detail.place.PL_NAME?detail.place.PL_NAME:''}" maxlength="25" placeholder="시설 이름을 적어주세요">
			</div>
		</li>
		<li class="addr req">
			<label for="pl_loc_btn"><strong>시설 주소</strong></label>
			<div class="input_wrap flex flexWrap" data-check-type="one" data-check-id="pl_loc">
				<input id="pl_loc_btn" class="btn submit" type="button" value="주소 검색" onclick="findPostcode(); remove_addr();">
				<c:choose>
					<c:when test="${!empty detail.place.PL_LOC}">
						<input type="text" id="address" value="${fn:split(detail.place.PL_LOC,',')[0]}" readonly>
						<input type="text" id="detailAddress" value="${fn:split(detail.place.PL_LOC,',')[1]}" placeholder="상세주소를 입력해주세요">
						<input type="hidden" id="postcode">
						<input type="hidden" id="extra">
						<input type="hidden" id="pl_loc" name="pl_loc" value="${detail.place.PL_LOC}">
					</c:when>
					<c:otherwise>
						<input type="text" id="address" readonly>
						<input type="text" id="detailAddress" placeholder="상세주소를 입력해주세요">
						<input type="hidden" id="postcode">
						<input type="hidden" id="extra">
						<input type="hidden" id="pl_loc" name="pl_loc">
					</c:otherwise>
				</c:choose>
			</div>
		</li>
		<li class="cate req">
			<strong>시설 분류</strong>
			<div class="input_wrap slim_scroll" data-check-type="more" data-check-id="ca">
				<div class="scroll_wrap flex">
					<c:if test="${!empty cate_list}">
						<c:forEach var="c" items="${cate_list}">
							<input id="ca${c.PC_IDX}" type="radio" name="pl_pc_idx" value="${c.PC_IDX}" ${(!empty detail.place.PL_PC_IDX and (detail.place.PL_PC_IDX eq c.PC_IDX))?"checked":""}>
							<label class="btn" for="ca${c.PC_IDX}">${c.PC_NAME}</label>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</li>
		<li class="call">
			<label for="pl_call1"><strong>전화번호</strong></label>
			<div class="input_wrap">
				<c:choose>
					<c:when test="${!empty detail.place.PL_CALL}">
						<input id="tel1" type="tel" value="${fn:split(detail.place.PL_CALL,'-')[0]}"> - 
						<input id="tel2" type="tel" value="${fn:split(detail.place.PL_CALL,'-')[1]}"> - 
						<input id="tel3" type="tel" value="${fn:split(detail.place.PL_CALL,'-')[2]}">
						<input id="pl_call" type="hidden" name="pl_call" value="${detail.place.PL_CALL}">
					</c:when>
					<c:otherwise>
						<input id="tel1" type="tel"> - 
						<input id="tel2" type="tel"> - 
						<input id="tel3" type="tel">
						<input id="pl_call" type="hidden" name="pl_call">
					</c:otherwise>
				</c:choose>
			</div>
		</li>
		<li class="offday">
			<strong>휴무일</strong>
			<div class="input_wrap flexWrap">
				<c:forEach var="day" items="${fn:split('월,화,수,목,금,토,일',',')}" varStatus="status">
					<c:set var="i" value="${(status.index + 1)>=7?(status.index + 1)-7:(status.index + 1)}"/>
					<c:choose>
						<c:when test="${!empty detail.place.PL_CALL}">
							<c:set var="PL_OFFDAY" value="${fn:contains(detail.place.PL_OFFDAY,i)}"/>
							<input id="d${i}" type="checkbox" name="pl_offday" value="${i}" ${PL_OFFDAY?"checked":""}>
						</c:when>
						<c:otherwise>
							<input id="d${i}" type="checkbox" name="pl_offday" value="${i}">
						</c:otherwise>
					</c:choose>
					<label class="btn round" for="d${i}">${day}</label>
				</c:forEach>
			</div>
		</li>
		<li class="open time">
			<label for="pl_open_hour"><strong>시작시간</strong></label>
			<div class="input_wrap flexCenter">
				<c:choose>
					<c:when test="${!empty detail.place.PL_OPEN}">
						<c:set var="hour" value="${fn:substring(detail.place.PL_OPEN,0,2)}"/>
						<c:set var="min" value="${fn:substring(detail.place.PL_OPEN,2,4)}"/>
						<input type="number" id="pl_open_hour" value="${hour>12?hour-12:hour}" min="0" max="12"> : 
						<input type="number" id="pl_open_min" value="${min}" min="0" max="12">
						<div class="ampm_wrap tab_radio">
							<input type="radio" id="open_AM" name="open_ampm" value="AM" ${hour>12?"":"checked"}>
							<label for="open_AM">AM</label>
							<input type="radio" id="open_PM" name="open_ampm" value="PM" ${hour>12?"checked":""}>
							<label for="open_PM">PM</label>
						</div>
						<input type="hidden" id="pl_open" name="pl_open" value="${detail.place.PL_OPEN}" readonly>
					</c:when>
					<c:otherwise>
						<input type="number" id="pl_open_hour" min="0" max="12"> : 
						<input type="number" id="pl_open_min" min="0" max="12">
						<div class="ampm_wrap tab_radio">
							<input type="radio" id="open_AM" name="open_ampm" value="AM" checked>
							<label for="open_AM">AM</label>
							<input type="radio" id="open_PM" name="open_ampm" value="PM">
							<label for="open_PM">PM</label>
						</div>
						<input type="hidden" id="pl_open" name="pl_open" readonly>
					</c:otherwise>
				</c:choose>
			</div>
		</li>
		<li class="close time">
			<label for="pl_close_hour"><strong>종료시간</strong></label>
			<div class="input_wrap flexCenter">
				<c:choose>
					<c:when test="${!empty detail.place.PL_CLOSE}">
						<c:set var="hour" value="${fn:substring(detail.place.PL_CLOSE,0,2)}"/>
						<c:set var="min" value="${fn:substring(detail.place.PL_CLOSE,2,4)}"/>
						<input type="number" id="pl_close_hour" value="${hour>12?hour-12:hour}" min="0" max="12"> : 
						<input type="number" id="pl_close_min" value="${min}" min="0" max="12">
						<div class="ampm_wrap tab_radio">
							<input type="radio" id="close_AM" name="close_ampm" value="AM" ${hour>12?"":"checked"}>
							<label for="close_AM">AM</label>
							<input type="radio" id="close_PM" name="close_ampm" value="PM" ${hour>12?"checked":""}>
							<label for="close_PM">PM</label>
						</div>
						<input type="hidden" id="pl_close" name="pl_close" value="${detail.place.PL_CLOSE}" readonly>
					</c:when>
					<c:otherwise>
						<input type="number" id="pl_close_hour" min="0" max="12"> : 
						<input type="number" id="pl_close_min" min="0" max="12">
						<div class="ampm_wrap tab_radio">
							<input type="radio" id="close_AM" name="close_ampm" value="AM">
							<label for="close_AM">AM</label>
							<input type="radio" id="close_PM" name="close_ampm" value="PM" checked>
							<label for="close_PM">PM</label>
						</div>
						<input type="hidden" id="pl_close" name="pl_close" readonly>
					</c:otherwise>
				</c:choose>
			</div>
		</li>
		<li>
			<label for=""><strong>이미지 정보</strong></label>
			<div class="input_wrap">
				<div id="img_upload" class="flex flexWrap">
					<!-- 아이콘을 누르면 file 선택이 되도록 설정 -->
					<!-- 등록한 이미지가 있다면 썸넬 표시 / 사진이 수정이 되었으면 <input name="idx_${var.index+1}"> 없어진다 -->
					<c:forEach items="${detail.photos}" var="i" varStatus="var">   
						<label id="previousImg">
							<input type="file" accept="image/*" id="photo_${var.index+1}" name="photo_${var.index+1}" >
							<input type="hidden" name="idx_${var.index+1}" value="${i.PH_IDX}">
							<img width="200px" src="/resources/upload/${i.PH_STORED_FILE_NAME}" >
							<span id="deleteBtn" onclick="reset(event,this)">❌</span>
						</label>   
					</c:forEach>
					<!-- 이미지 등록안한 <input type="file">태그 -->
					<c:forEach var="i" begin="${fn:length(detail.photos)+1}" end="3" step="1" varStatus="var">   
						<label>
							<i class="fa-thin fa-image no-image"></i>
							<input type="file" accept="image/*" id="photo_${var.index}" name="photo_${var.index}" >
						</label>
					</c:forEach>
				</div>
				<br>
				<p class="info_warn">본인이 직접 촬영한 사진만 올려주세요.</p>
				<p class="info_warn">저작권에 대한 책임은 업로드한 회원에게 있습니다.</p>
			</div>
		</li>
		<li class="sub_btn"><input class="btn submit" id="uploadBtn" type="button" value="등록하기"></li>
	</ul>
</form>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
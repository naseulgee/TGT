<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/detail.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d678157a5b078cbbbb9fe15e8811eb2b"></script>
<script src="/resources/js/place/detail.js"></script>
<script src="/resources/js/place/kakao_map.js" defer></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<section class="img_wrap">
	<c:if test="${empty detail.photos}"><i class="fa-thin fa-image no-image"></i></c:if>
	<c:if test="${!empty detail.photos}">
		<div class="imgs">
			<c:forEach var="i" items="${detail.photos}" varStatus="status">
				<img class="${status.index==0?'on':''}" src="/resources/upload/${i.PH_STORED_FILE_NAME}" alt="${i.PH_ORIGINAL_FILE_NAME}">
			</c:forEach>
		</div>
		<c:if test="${fn:length(detail.photos) > 1}">
			<button class="arrow prev" onclick="move_img('prev');" type="button"><i class="fa-solid fa-chevron-left"></i><span class="displaynone">다음 이미지</span></button>
			<button class="arrow next" onclick="move_img('next');" type="button"><i class="fa-solid fa-chevron-right"></i><span class="displaynone">이전 이미지</span></button>
		</c:if>
	</c:if>
</section>
<section class="detail_wrap">
	<span class="btn slim">${detail.place.PC_NAME}</span> <span class="btn slim">${fn:split(detail.place.PL_LOC," ")[1]}</span>
	<h1 class="pl_name">${detail.place.PL_NAME}</h1>
	<ul>
		<li><a href="#info_wrap">시설 정보</a></li>
		<li><a href="#menu_wrap">메뉴</a></li>
		<li><a href="#review_wrap">리뷰</a></li>
	</ul>
	<article id="info_wrap">
		<p class="call">
			<strong>전화번호</strong>
			<span>
				<c:if test="${!empty detail.place.PL_CALL}">
					<a href="tel:${detail.place.PL_CALL}">${detail.place.PL_CALL}</a>
				</c:if>
			</span>
		</p>
		<p class="time">
			<strong>영업 시간</strong>
			<c:if test="${!empty detail.place.PL_OFFDAY}">
				<span>
					매주
					<c:forEach var="day" items="${fn:split('월,화,수,목,금,토,일',',')}" varStatus="status">
						<c:set var="i" value="${(status.index + 1)>=7?(status.index + 1)-7:(status.index + 1)}"/>
						<c:if test="${fn:contains(detail.place.PL_OFFDAY,i)}">${day}요일 </c:if>
					</c:forEach>
					휴무
				</span>
			</c:if>
			<c:if test="${!empty detail.place.PL_OPEN || !empty detail.place.PL_CLOSE}">
				<span>
					매일
					${fn:substring(detail.place.PL_OPEN,0,2)}:${fn:substring(detail.place.PL_OPEN,2,-1)} ~
					${fn:substring(detail.place.PL_CLOSE,0,2)}:${fn:substring(detail.place.PL_CLOSE,2,-1)}
				</span>
			</c:if>
		</p>
		<p class="addr">
			<strong>주소</strong>
			<span>${detail.place.PL_LOC}</span>
			<button type="button" class="btn slim" onclick="copy_addr();"><span class="displaynone">복사하기</span><i class="fa-solid fa-copy"></i></button>
		</p>
		<div id="map" style="width:100%;height:350px;"></div>
	</article>
	<article id="menu_wrap">
		${menu}
	</article>
	<article id="review_wrap">
		리뷰 평균, 총 리뷰수, 더보기 버튼, 등록 버튼
	</article>
</section>
<button class="use_move btn" data-href="/place/modifyForm.paw" onclick="move(this, 'pl_idx:${detail.place.PL_IDX}', 'ph_board_type:place')">수정</button>
<button class="use_move btn" data-href="/review/write.paw" onclick="move(this, 'pl_idx:${detail.place.PL_IDX}')">리뷰 작성하기</button>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
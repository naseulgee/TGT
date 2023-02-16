<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<c:if test="${empty detail.place}">
	<script>
		alert("잘못된 접근입니다!");
		location.href = history.go(-1);
	</script>
</c:if>
<script type="text/javascript">
	function recheck() { return confirm("정말 삭제하시겠어요?");};		
</script>
<link rel="stylesheet" type="text/css" href="/resources/css/place/detail.css"/>
<script src="/resources/js/place/detail.js"></script>
<script src="/resources/js/place/admin_del_place.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/common/img_pop_slide.css"/>
<script src="/resources/js/common/img_pop_slide.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/place/kakao_map.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d678157a5b078cbbbb9fe15e8811eb2b&libraries=services"></script>
<script src="/resources/js/place/kakao_map.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<c:if test="${detail.place.PL_DEL_GB == 'Y'}">
	<section class="del txt_center">
		<span>삭제 요청이 들어온 시설입니다. 삭제하시겠습니까?</span>
		<button class="btn slim" onclick="req_del('N')">반려</button>
		<button class="btn slim warn" onclick="del('Y', ${detail.place.PL_IDX})">수락</button>
	</section>
</c:if>
<!-- 이미지 슬라이드 -->
<section class="img_slide">
	<c:if test="${empty detail.photos}"><i class="fa-thin fa-image no-image"></i></c:if>
	<c:if test="${!empty detail.photos}">
		<div class="img_wrap pop_img_wrap">
			<c:forEach var="i" items="${detail.photos}" varStatus="status">
				<img class="pop_img" src="/resources/upload/${i.PH_STORED_FILE_NAME}" alt="${i.PH_ORIGINAL_FILE_NAME}">
			</c:forEach>
		</div>
	</c:if>
</section>

<!-- 시설정보 -->
<section class="detail_wrap">
	<div class="title_wrap flex flexWrap">
		<!-- 시설명 -->
		<h1 class="pl_name">${detail.place.PL_NAME}<input type="hidden" name="pl_idx" value="${detail.place.PL_IDX}"></h1>
		<!-- 시설 수정 및 삭제 요청/취소 버튼 -->
		<div class="btn_wrap">
			<button class="use_move btn" data-href="/admin/place/modifyForm.paw" onclick="move(this, 'pl_idx:${detail.place.PL_IDX}', 'ph_board_type:place')">시설 수정</button>
			<c:if test="${detail.place.PL_DEL_GB == 'N'}">
				<button class="btn warn" onclick="del('Y', ${detail.place.PL_IDX})">시설 삭제</button>
			</c:if>
		</div>
	</div>
	
	<!-- 카테고리 및 주소 버튼 -->
	<span class="btn slim">${detail.place.PC_NAME}</span> <span class="btn slim">${fn:split(detail.place.PL_LOC," ")[1]}</span>
	
	<!-- 리뷰 평균 평점개수 -->
	<p class="reveiw_avg">
		<c:forEach var="i" begin="1" end="5">
			<c:choose>
				<c:when test="${review_avg.RAVG+(1-(review_avg.RAVG%1))%1 >= i}">
					<c:choose>
						<c:when test="${review_avg.RAVG/1 >= i}"><i class="fa-solid fa-star"></i></c:when>
						<c:otherwise><i class="fa-solid fa-star-half-stroke"></i></c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<i class="fa-regular fa-star"></i>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<strong> ${review_avg.RAVG} </strong>
		| 리뷰 ${review_avg.RCOUNT}
	</p>
	
	<!-- 탭. 클릭 시 해당하는 article로 이동 -->
	<ul class="tab_wrap tab_radio">
		<li><input type="radio" id="tab_info" name="tab" value="info" checked><label onclick="move_tab('info')" for="tab_info">시설 정보</label></li>
		<li><input type="radio" id="tab_menu" name="tab" value="menu"><label onclick="move_tab('menu')" for="tab_menu">메뉴</label></li>
		<li><input type="radio" id="tab_review" name="tab" value="review"><label onclick="move_tab('review')" for="tab_review">리뷰 모아보기</label></li>
	</ul>
	
	<!-- 시설 정보 -->
	<article id="info_wrap">
		<ul>
			<li><h2>시설 정보</h2></li>
			<li class="call">
				<strong>전화번호</strong>
				<span>
					<c:if test="${!empty detail.place.PL_CALL}">
						<a href="tel:${detail.place.PL_CALL}">${detail.place.PL_CALL}</a>
					</c:if>
				</span>
			</li>
			<li class="time">
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
			</li>
			<li class="addr flex flexWrap">
				<strong>주소</strong>
				<span>
					<span class="loc">${detail.place.PL_LOC}</span> 
					<button type="button" class="btn" onclick="copy_addr();"><span class="displaynone">복사하기</span><i class="fa-solid fa-copy"></i></button>
				</span>
			</li>
			<li id="map" style="width:100%;height:350px;"></li>
		</ul>
	</article>
	
	<!-- 메뉴 -->
	<article id="menu_wrap">
		<ul>
			<li><h2>메뉴</h2></li>
			<li class="flex flexWrap">
				<strong class="title">가격 정보</strong>
				<input class="btn submit" type="button" onclick="menu('add')" value="메뉴 추가하기">
				<div class="menu_list">
					<c:if test="${empty menu}">
						<p class="empty">등록된 메뉴가 없습니다</p>
					</c:if>
					<ul class="flex flexWrap">
						<c:forEach var="i" items="${menu}">
							<li>
								<input type="hidden" name="pm_idx" value="${i.PM_IDX}">
								<p class="print">
									<span class="menu_name">${i.PM_NAME}</span><span class="menu_price">${i.PM_PRICE}</span> 원
								</p>
								<div class="btn_wrap">
									<input class="btn" type="button" onclick="menu('modi', this)" value="수정">
									<input class="btn warn" type="button" onclick="menu('del', this)" value="삭제">
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</li>
		</ul>
	</article>
	
	<!-- 리뷰 리스트 -->
	<article id="review_wrap">
		<ul>
			<li><h2>리뷰 모아보기</h2></li>
			<li class="btn_wrap flex">
				<a class="btn" href="/admin/place/detail/${detail.place.PL_IDX}/review/list.paw">리뷰 더보기</a>
			</li>
			<c:if test="${empty review_list}">
				<li class="empty">등록된 리뷰가 없습니다</li>
			</c:if>
			<c:forEach var="i" items="${review_list}">
				<li class="flex">
					<div class="content_wrap flex">
						<c:if test="${!empty i.photoList}">
							<img class="pop_img" alt="${i.RE_WRITER_NAME}님의 리뷰 이미지" src="/resources/upload/s_${i.photoList[0].PH_STORED_FILE_NAME}">
						</c:if>
						<div class="re_wrap">
							<p class="summary flex">
								<span class="writer">${i.RE_WRITER_NAME}</span>
								<span class="star flexCenter">
									<c:forEach var="star" begin="1" end="5">
										<c:choose>
											<c:when test="${i.RE_STAR >= star}"><i class="fa-solid fa-star"></i></c:when>
											<c:otherwise><i class="fa-regular fa-star"></i></c:otherwise>
										</c:choose>
									</c:forEach>
								</span>
								<span class="reg">${fn:split(i.RE_REG_DATE, " ")[0]}</span>
							</p>
							<p>${i.RE_CONTENTS}</p>
						</div>
					</div>
					<div class="flex txt_right">
						<c:if test="${mem_id eq i.RE_WRITER_ID}" >
							<div><form action='/review/updateForm.paw' method='POST'>
							<input type='submit' class='btn' value='수정'> 
							<input type='hidden' name='re_idx' value="${i.RE_IDX}">
							<input type='hidden' name='ph_board_type' value='review'>
							<input type='hidden' name='page' value='admin'><!--관리자페이지에서 수정했음을 표기 -->
							</form></div>&nbsp;
						</c:if>
						
						<form action="/admin/review/delete.paw" method="post">
							<input type="submit" class="btn warn" value="삭제" onClick="return recheck();">
							<input type="hidden" id="re_idx" name="re_idx" value="${i.RE_IDX}">
							<input type="hidden" id="ph_board_type" name="ph_board_type" value="review">
							<input type="hidden" id="pl_idx" name="pl_idx" value="${i.RE_PL_IDX}">
						</form>
					</div>
				</li>
			</c:forEach>
		</ul>
	</article>
</section>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/detail.css"/>
<script src="/resources/js/place/detail.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<section class="summary_wrap flex">
	<div class="img_wrap">
		<c:if test="${empty detail.photos}"><i class="fa-thin fa-image no-image"></i></c:if>
		<c:if test="${!empty detail.photos}">
			<div class="imgs">
				<c:forEach var="i" items="${detail.photos}" varStatus="status">
					<img class="${status.index==0?'on':''}" src="/resources/upload/${i.PH_STORED_FILE_NAME}" alt="${i.PH_ORIGINAL_FILE_NAME}">
				</c:forEach>
			</div>
			<button class="arrow prev" onclick="move_img('prev');" type="button"><i class="fa-solid fa-chevron-left"></i><span class="displaynone">다음 이미지</span></button>
			<button class="arrow next" onclick="move_img('next');" type="button"><i class="fa-solid fa-chevron-right"></i><span class="displaynone">이전 이미지</span></button>
		</c:if>
	</div>
	<article>
		<span class="btn">${detail.place.PC_NAME}</span> <span class="btn">${fn:split(detail.place.PL_LOC," ")[1]}</span>
		<h1>${detail.place.PL_NAME}</h1>
	</article>
</section>
<section class="detail_wrap">
</section>
<button class="use_move btn" data-href="/place/modifyForm.paw" onclick="move(this, 'pl_idx:${detail.place.PL_IDX}', 'ph_board_type:place')">수정</button>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
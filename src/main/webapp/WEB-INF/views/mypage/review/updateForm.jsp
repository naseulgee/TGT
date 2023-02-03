<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/common/photo.js" defer></script>
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css" ></link>
<link type="text/css" rel="stylesheet" href="/resources/css/review/review.css" ></link>


<script>
	$(document).ready( function() {	
		//페이지 로딩 시 바로 글자수 파악		
		var contents = $("textarea").val().length;
		$('#reCount').text(contents +' / 950');

		//글자수 실시간 반영 메서드
		$("textarea").on("propertychange change keyup paste input", function() {
			contents = $(this).val(); //textarea의 내용
			if (contents.length == 0 || contents == '') {
				$('#reCount').text('0 / 950'); //내용이 아무것도 없다면 0으로 설정
			} else {
				$('#reCount').text(contents.length +' / 950'); //내용이 있다면 글자수 세기
			}
		});
		
		//기본별점 표시하기
		var previousRate = $("#previousRate").val();
		$("#rate"+(6-previousRate)).attr('checked', true);

	});

	//유효성 검사 메서드
	function checkForm() {
	var re_star = $('input[name=re_star]:checked').val(); //별점
	var re_contents = $("#re_contents").val(); //리뷰내용

	if (re_star == "" || re_star == null) {
		alert("별점을 평가해주세요.");
		return false;
	}
	if (re_contents == "" || re_contents == null) {
		alert("리뷰 내용을 작성해주세요.");
		return false;
	} return true;
	}
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<div id="wrap">
	
	<h1 class="txt_center">솔직한 리뷰를 남겨주세요:)</h1>
	<br><br><br><br>
	<div name="reviewStars" id="reviewStars" class="txt_center">
		
		<!-- 평점 -->
		<div><h3>시설의 평점</h3></div>
		<div><span class="color">시설의 만족도는 어느 정도인가요?</span></div><br>
		<div><input type="hidden" id="previousRate" value="${review.RE_STAR}"></div>
		<div>
			<fieldset>
				<legend>이모지 별점</legend>
				<div class="pp flexCenter" id="stars">
				<input type="radio" name="re_star" value="5" id="rate1">
				<label for="rate1"><i class="fa-solid fa-paw"></i></label>&nbsp;
				<input type="radio" name="re_star" value="4" id="rate2">
				<label for="rate2"><i class="fa-solid fa-paw"></i></label>&nbsp;
				<input type="radio" name="re_star" value="3" id="rate3">
				<label for="rate3"><i class="fa-solid fa-paw"></i></label>&nbsp;
				<input type="radio" name="re_star" value="2" id="rate4">
				<label for="rate4"><i class="fa-solid fa-paw"></i></label>&nbsp;
				<input type="radio" name="re_star" value="1" id="rate5">
				<label for="rate5"><i class="fa-solid fa-paw"></i></label>
				<div id="starRating"></div>
				</div> 
			</fieldset>
		</div>
		
		<br><br><br><br>
		
		<!-- 후기 -->
		<div><h3>시설의 후기</h3></div>
		<div><span class="color">시설은 어떠셨나요?</span></div>
		<div>
			<textarea class="slim_scroll" id="re_contents" name="re_contents" 
			placeholder="후기 내용을 작성해주세요." maxlength="950">${review.RE_CONTENTS}</textarea>
		</div>	
		<div class="txt_right"><span id="reCount">0 / 950</span></div>	
		
		<br><br><br><br>
		
		<!-- 사진 -->
		<div><h3>시설의 사진</h3></div>
		<div><span class="color">시설 사진을 올려주세요:)</span></div><br>
		<div id="img_upload" class="flexCenter flexWrap">
		
			<!-- 등록한 이미지가 있다면 썸넬 표시 / 사진이 수정이 되었으면 <input name="idx_${var.index+1}"> 없애기 -->
			<c:forEach items="${photos}" var="i" varStatus="var">	
				<label id="previousImg">
					<input type="hidden" name="idx_${var.index+1}" value="${i.PH_IDX}">
					<input type="file" accept="image/*" id="photo_${var.index+1}" name="photo_${var.index+1}" >
					<img width="200px" src="/resources/upload/${i.PH_STORED_FILE_NAME}" >
				</label>	
			</c:forEach>
			
			<!-- 이미지 등록안한 <input type="file">태그 -->
			<c:forEach var="i" begin="${fn:length(photos)+1}" end="3" step="1" varStatus="var">	
				<label>
					<i class="fa-thin fa-image no-image"></i>
					<input type="file" accept="image/*" id="photo_${var.index}" name="photo_${var.index}" >
				</label>
			</c:forEach>
		</div>
		<br>
		<p class="info_warn">본인이 직접 촬영한 사진만 올려주세요.</p>
		<p class="info_warn">저작권에 대한 책임은 업로드한 회원에게 있습니다.</p>
		<br><br><br>
		
		<input type="hidden" id="re_idx" name="re_idx" value="${review.RE_IDX}" >
		<input type="hidden" id="idx" name="idx" value="${review.RE_IDX}" >
		<input type="hidden" value="review" name="ph_board_type">
		
		<button type="button" class="btn submit" id="uploadBtn" >리뷰등록</button> 
		<a href="/mypage/review/list.paw" class="btn">목록으로</a>
	</div> 
	</div>
</main><!-- //main 종료 -->

<script>
$(document).ready(function(){
	//등록작업을 해주는 url을 파라미터로 집어넣기!!
	form_submit("/review/update.paw");
});
</script>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
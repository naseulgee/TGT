<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/common/photo.js" defer></script>
<link type="text/css" rel="stylesheet" href="/resources/css/review/review.css" ></link>
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css" ></link>

<script>
	$(document).ready( function() {	
		//글자수 실시간 반영 메서드
		$("textarea").on("propertychange change keyup paste input", function() {
			var contents = $(this).val();
			console.log(contents.length);
			if (contents.length == 0 || contents == '') {
				$('#reCount').text('0 / 950');
			} else {
				$('#reCount').text(contents.length +' / 950');
			}
		});	  
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
			placeholder="후기 내용을 작성해주세요." maxlength="950"></textarea>
		</div>	
		<div class="txt_right"><span id="reCount">0 / 950</span></div>	
		
		<br><br><br><br>
		
		<!-- 사진 -->
		<div><h3>시설의 사진</h3></div>
		<div><span class="color">시설 사진을 올려주세요:)</span></div><br>
		<div id="img_upload" class="flexCenter flexWrap">
			<!-- 아이콘을 누르면 file 선택이 되도록 설정 -->
			<label><!-- 사진1 : 파일태그는 숨기고 -->
				<i class="fa-thin fa-image no-image"></i>
				<input type="file" accept="image/*" id="photo1" name="photo1" >
			</label>
			<label><!-- 사진2 -->
				<i class="fa-thin fa-image no-image"></i>
				<input type="file" accept="image/*" id="photo2" name="photo2" >
			</label>
			<label><!-- 사진3 -->
				<i class="fa-thin fa-image no-image"></i>
				<input type="file" accept="image/*" id="photo3" name="photo3" >
			</label>
		</div>
		<br>
		<p class="info_warn">본인이 직접 촬영한 사진만 올려주세요.</p>
		<p class="info_warn">저작권에 대한 책임은 업로드한 회원에게 있습니다.</p>
		<br><br><br>
		
		<input type="hidden" value="review" name="ph_board_type"><!-- 테이블명/ 시설과 회원에 각각 추가 필수 -->
		<input type="hidden" id="re_pl_idx" name="re_pl_idx" value="${re_pl_idx}"><!-- 시설번호 -->
		<!-- 세션이 구현되면 삭제 -->
		<input type="hidden" id="re_writer_id" name="re_writer_id" value="aaa123"><!-- 작성자 아이디 -->
		<input type="hidden" id="re_writer_name" name="re_writer_name" value="브라더"><!-- 강아지 이름 -->

		<%-- 세션이 전부 구현되면 사용
		<input type="hidden" id="re_writer_id" name="re_writer_id" value="${mem_id}"><!-- 작성자 아이디 -->
		<input type="hidden" id="re_writer_name" name="re_writer_name" value="${mem_dog_name}"><!-- 강아지 이름 -->
		--%>
		<button class="btn submit" id="uploadBtn" >리뷰등록</button> 
		
		<a href="/user/mypage/review/reviewList" class="btn">목록으로</a>
	</div> 
	</div>
</main><!-- //main 종료 -->

<script>
$(document).ready(function(){
	//등록작업을 해주는 url을 파라미터로 집어넣기!!
	form_submit("/review/insert.paw");
});
</script>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
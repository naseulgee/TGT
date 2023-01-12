<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>

<style>
main article{ max-width: 600px; margin: 40px auto; }

textarea { padding: 5px 7px; resize: none; width:100%; height:130pt;}
input #star { width:100%; }

#reviewStars fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 0; /* 필드셋 테두리 제거 */
}
#reviewStars input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#reviewStars label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#reviewStars label:hover{
    text-shadow: 0 0 0 #f0b1aa; /* 마우스 호버 */
}
#reviewStars label:hover ~ label{
    text-shadow: 0 0 0 #f0b1aa; /* 마우스 호버 뒤에오는 이모지들 */
}
#reviewStars fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#reviewStars fieldset legend{
    text-align: left;
}
#reviewStars input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #f0b1aa; /* 마우스 클릭 체크 */
}
span {
	font-size: 1em;
}

#wrap {
	width:70%;
	margin: 40px auto;
}
</style>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<div id="wrap">
	<h1 class="txt_center">솔직한 리뷰를 남겨주세요:)</h1>
	<br><br>
	<form action="./insertReview" method="post" onsubmit="return check()" name="reviewStars" id="reviewStars" class="txt_center">
		
		<!-- 평점 -->
		<div><h3>시설의 평점</h3></div>
		<div><span class="color">시설의 만족도는 어느 정도인가요?</span></div><br>
		<div>
			<fieldset>
		        <legend>이모지 별점</legend>
		        <div class="pp flexCenter">
		        <input type="radio" name="v_star" value="5" id="rate1">
		        <label for="rate1"><i class="fa-solid fa-paw"></i></label>&nbsp;
		        <input type="radio" name="v_star" value="4" id="rate2">
		        <label for="rate2"><i class="fa-solid fa-paw"></i></label>&nbsp;
		        <input type="radio" name="v_star" value="3" id="rate3">
		        <label for="rate3"><i class="fa-solid fa-paw"></i></label>&nbsp;
		        <input type="radio" name="v_star" value="2" id="rate4">
		        <label for="rate4"><i class="fa-solid fa-paw"></i></label>&nbsp;
		        <input type="radio" name="v_star" value="1" id="rate5">
		        <label for="rate5"><i class="fa-solid fa-paw"></i></label>
		        <div id="starRating"></div>
		        </div> 
			</fieldset>
		</div>
		
		<br><br><br>
		
		<div><h3>시설의 후기</h3></div>
		<div><span class="color">시설은 어떠셨나요?</span></div>
		<div class="txt_right"><span>(950자 이내 작성)</span></div>
		<div>
			<textarea class="slim_scroll" id="v_contents" name="v_contents" placeholder="후기 내용을 작성해주세요." maxlength="950"></textarea>
		</div>		
		
		<br><br><br>
		
		<div><h3>시설의 사진</h3></div>
		<div><span class="color">시설을 이용하면서 찍은 사진을 올려주세요:)</span></div><br>
		<span><input type="file" class="btn submit" value="업로드" multiple></span>

		<div><span class="info_warn">본인이 직접 촬영한 사진만 올려주세요.</span></div>
		<div><span class="info_warn">저작권에 대한 책임은 업로드한 회원에게 있습니다.</span></div>
		<br><br><br>
		<input type="hidden" name="re_pl_idx" value="${v_r_idx}"><!-- 시설번호 -->
        <input type="hidden" name="re_writer_id" value="${mem_id}"><!-- 작성자 아이디 -->
        <input type="hidden" name="v_c_idx" value="${v_c_idx}"><!-- 카페번호 -->
		<button class="btn submit">리뷰등록</button>
		<a href="/user/mypage/review/reviewList" class="btn">목록으로</a>
	</form>
	</div>
</main><!-- //main 종료 -->

<c:if test="${page != 'admin'}">
	<!-- 풋터. 모든 페이지에 삽입! -->
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</c:if>
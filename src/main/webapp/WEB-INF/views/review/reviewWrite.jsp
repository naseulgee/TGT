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
#reviewStars fieldset label:hover ~ label{
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

label {
	display: inline-block;
}

#noImage1, #noImage2, #noImage3 {
	font-size : 300%;
	height : 50%;
}

input[type=file]{
    display: none; /* 파일태그 감춤 */
}
</style>


<script>
$(document).ready( function() {
	//글자수 세기
    $( '#re_contents' ).keyup(function() {
    	if ($('#re_contents').val().length >= 950 ) {
    		alert('글자수를 초과했습니다.');
    	}
    });
  });
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<div id="wrap">	
	
	<h1 class="txt_center">솔직한 리뷰를 남겨주세요:)</h1>
	<br><br>
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
		
		<br><br><br>
		
		<!-- 후기 -->
		<div><h3>시설의 후기</h3></div>
		<div><span class="color">시설은 어떠셨나요?</span></div>
		<div>
			<textarea class="slim_scroll" id="re_contents" name="re_contents" 
			 placeholder="후기 내용을 작성해주세요." maxlength="950"></textarea>
		</div>	
		<div class="txt_right"><span id="reCount">0 / 950</span></div>	
		
		<br><br><br>
		
		
		<!-- 사진 -->
		<div><h3>시설의 사진</h3></div>
		<div><span class="color">시설을 이용하면서 찍은 사진을 올려주세요:)</span></div><br>
		<span>
			<!-- 사진1 : 파일태그는 숨기고 -->
			<input type="file" accept="image/*" id="photo1" name="photo1" >
			<!-- 아이콘을 누르면 file 선택이 되도록 설정 -->
			<label for="photo1"><i class="fa-thin fa-image" id="noImage1"></i></label>
			<!-- 사진2 -->
			<input type="file" accept="image/*" id="photo2" name="photo2" >
			<label for="photo2"><i class="fa-thin fa-image" id="noImage2"></i></label>
			<!-- 사진3 -->
			<input type="file" accept="image/*" id="photo3" name="photo3" >
			<label for="photo3"><i class="fa-thin fa-image" id="noImage3"></i></label>
		</span>
		
		<div><span class="info_warn">본인이 직접 촬영한 사진만 올려주세요.</span></div>
		<div><span class="info_warn">저작권에 대한 책임은 업로드한 회원에게 있습니다.</span></div>
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
		<button class="btn submit" id="uploadBtn">리뷰등록</button> 
		
		<a href="/user/mypage/review/reviewList" class="btn">목록으로</a>
	</div> 
	</div>
</main><!-- //main 종료 -->

<script>
	//사이즈와 확장자 설정
	var regex = new RegExp("(.*?)\.(jpeg|jpg|gif|png|bmp)$"); //이미지 파일 확장자
	var maxSize = 5242880; //5MB
	
	//사이즈와 확장자가 잘못되었을 경우 제한하는 함수
	function checkExtension(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if (!regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	} 
	
	//클릭시 
	$("#uploadBtn").on("click", function(e) {
		var formData = new FormData();
		var inputFile1 = $("input[name='photo1']")[0].files;
		var inputFile2 = $("input[name='photo2']")[0].files;
		var inputFile3 = $("input[name='photo3']")[0].files;

		console.log(inputFile1.length);
		console.log(inputFile2.length);
		console.log(inputFile3.length);
		//★확장자 알맞지 않거나 파일용량이 크면 FormData객체에 삽입X★
		if (inputFile1.length > 0) { //첫번째 파일을 formData에 삽입
			if (checkExtension(inputFile1[0].name, inputFile1[0].size)) {
				formData.append("uploadFile", inputFile1[0]);
				console.log(formData.get("uploadFile"));
			} else {
				return false; 
			}	
		}	
		if (inputFile2.length > 0) {//두번째 파일을 formData에 삽입
			if (!checkExtension(inputFile2[0].name, inputFile2[0].size)) {
				return false; 
			} else {
				formData.append("uploadFile", inputFile2[0]);
			}	
		}	
		if (inputFile3.length > 0) {//세번째 파일을 formData에 삽입
			if (!checkExtension(inputFile3[0].name, inputFile3[0].size)) {
				return false; 
			} else {
				formData.append("uploadFile", inputFile3[0]);
			}	
		}	
		
		let target = $("main input:not([name^='photo']), textarea");
		for(let i=0; i<target.length ; i++) {
			let in_name = target[i].name;
			let in_value = target[i].value;
			let in_type = target[i].type;
			if ((in_type == 'radio'||in_type =='checkbox')&& !target[i].checked) {
				continue;
			}
			formData.append(in_name, in_value);		
		}
		
		 $.ajax({
			url: '/review/insert.paw',
			processData: false, 
			contentType: false,
		 	data: formData,
		 	type: 'POST',
		 	success: function(result){ alert("Uploaded");}
		 }); //$.ajax

	}); 
</script>

<c:if test="${page != 'admin'}">
	<!-- 풋터. 모든 페이지에 삽입! -->
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</c:if>
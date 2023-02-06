<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css" ></link>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<style>
main img {
		border: 2px solid #f0b1aa;
	    box-sizing: border-box;
    	border-radius: 10px;
}

#img_upload label{
	width : 100px;
	height : 100px;
}

#stars { 
		display: inline-block; 
		font-size : 50px;
	}


#place, #contents, #phIcon,#regDate {
	color : #b8bfc4;
}

main img {
	border-radius : 15px;
	width : 55px;
	height : 55px;
}

#highlight {
	color : #db776c;
	background-color: var(--subColor);
}

#star1{
	color : #db776c;
	font-weight : bold;
}

#star2{
	color : #d1d5d9;
}

.flexCenter {
	justify-content: flex-start;
}
</style>

<script>
	function onSearch() {
		var formData = new FormData();
		
		let target = $("#searchReview input");
		for(let i=0; i<target.length ; i++) {//target 갯수만큼 반복
			//target의 name, value, type 변수에 담기
			let in_name = target[i].name;
			let in_value = target[i].value;
			let in_type = target[i].type;
			//타입이 만약 라디오나 체크박스라면 checked 아닐경우 건너뜀
			if ((in_type == 'radio'||in_type =='checkbox')&& !target[i].checked) {
				continue;
			}
			//formData객체에 name, value 속성 추가
			formData.append(in_name, in_value);
		}
		
		$.ajax({
			url: '',
			processData: false, 
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result){
				console.log(result);
				if (result == '/member/login') {
					alert("회원가입이 성공적으로 되었습니다!");
				} else {
					alert("글을 성공적으로 업로드했습니다!");
				}
				location.href=result;
			}
		}); //$.ajax
		
	}
</script>

<main class="layoutCenter">
	<h1 class="txt_center">리뷰관리</h1><br>
	
	<!-- 검색창 -->
	<div id="searchReview" class="search_wrap txt_center">
		시설명 <input type="radio" name="type" value="0" ${empty search.m_type || search.m_type == 99?"checked":""}>
		회원ID <input type="radio" name="type" value="1" ${search.m_type == 0?"checked":""}>
		내용 <input type="radio" name="type" value="2" ${search.m_type == 1?"checked":""}>
		&nbsp;&nbsp;
		<input type="text" name="keyword" placeholder="검색어를 입력하개 :)" autocomplete="off" value="">
		<button type="submit">
			<i class="fa-solid fa-magnifying-glass" onclick="onSearch()"></i>
			<span class="displaynone">검색</span>
		</button>
	</div>
	
	<br>

	<table class="">
		<tbody>
			<c:forEach items="${reviews}" var="i" varStatus="status">
			<tr>
				<td width="80%">
				
					<div class="pp flexBetween">
						
						<div class="txt_left">
						
							<!-- 누가, 언제, 어떤 시설에 대해 작성한 리뷰인지에 대한 설명 -->
							<span id="highlight">${i.RE_WRITER_NAME}(${i.RE_WRITER_ID})</span>님이
							<span id="highlight"><fmt:formatDate value="${i.RE_REG_DATE}" pattern="yy-MM-dd" /></span>에 작성하신 
							<span id="highlight">${i.PL_NAME}(${i.PL_LOC})</span>에 대한 리뷰입니다.
							
							<br>
			    			
			    			<div class="flexCenter">
			    				<!-- 별점 -->
								<div id="star1" class="bold txt_big">${i.RE_STAR}</div>
								<div id="star2">/5점</div>&nbsp;&nbsp;&nbsp;
								
								<!-- 후기내용 -->
								<div id="contents" class="flex">
									<div>
									<c:choose>
				       					 <c:when test="${fn:length(i.RE_CONTENTS) gt 51}">
				        					${fn:substring(i.RE_CONTENTS, 0, 50)}... 
				        				</c:when>
				        				<c:otherwise> ${i.RE_CONTENTS} </c:otherwise>
									</c:choose>&nbsp;
									</div>		
									<c:if test="${! empty i.photoList}">
											<div><i class="fa-solid fa-image txt_big"></i></div>
									</c:if>
								</div> &nbsp;&nbsp;
							</div>
						</div>
						
						<!-- 상세, 삭제버튼 -->
						<div class="txt_right">
							<!-- 리뷰상세보기로 이동하는 버튼 -->
							<a class="use_move btn" href="/admin/review/detail.paw" 
							onclick="move(this, 're_idx:${i.RE_IDX}','pl_idx:${i.RE_PL_IDX}', 'ph_board_type:review')">
							상세</a>
							
							<!-- 삭제버튼 -->
							<table>
								<form action="/review/delete.paw" method="post">
									<input type="submit" class="btn submit" value="삭제" onClick="return recheck();">
									<input type="hidden" id="re_idx" name="re_idx" value="${review.RE_IDX}">
									<input type="hidden" id="ph_board_type" name="ph_board_type" value="review">
								</form>
							</table>
						</div>
						
						<div></div>
					</div>					
				</td>	
			</tr>
			</c:forEach>
		</tbody>
	</table>

	
</main><!-- //main 종료 -->


<%@ include file="/WEB-INF/include/common-footer.jspf" %>
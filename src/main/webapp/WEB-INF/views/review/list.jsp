<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/paging/searchPaging_B.js" defer></script>
<style>
#phIcon,#stars { display: inline-block;}
#stars {font-size : 30px;}
#place, #contents, #phIcon,#regDate {color : #b8bfc4;}
#ppp { line-height : 1.2;}
img { border-radius : 15px; height : 100%;}
</style>

<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
		<div class="main_wrap txt_center">
		
		<h1>시설리뷰</h1>
		<!-- 시설번호 -->
		<input type="hidden" value="${pl_idx}" id="pl_idx" name="pl_idx">

			<table>
				<tbody class="r_list">
					<!-- 나의 리뷰리스트가 담기는 위치 -->
				</tbody>
			</table>
	
			<!-- 페이징 -->
			<ul id="paging"></ul>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			<form id="commonForm" name="commonForm"></form>
	
	
		</div>
</main><!-- //main 종료 -->

<script>
$(document).ready(function(){
	fn_selectBoardList(1); //1페이지 받기
});

function fn_selectBoardList(pageNo){
	var comAjax = new ComAjax();
	let pl_idx = $("#pl_idx").val();
	console.log(pl_idx);
	comAjax.setUrl("<c:url value='/place/detail/"+pl_idx+"/review/selectList.paw' />"); //페이징실행 컨트롤러url
	comAjax.setCallback("fn_selectBoardListCallback"); //setCallback은 Ajax 요청이 완료된 후 호출될 함수의 이름을 지정
	
	//페이징 세팅
	if(!isNull(pageNo)){//함수 호출 시 매개변수를 주었다면
		comAjax.addParam("PAGE_INDEX", pageNo);
	}else if(!isNull($('#PAGE_INDEX').val())){//매개변수가 없지만 페이징 값을 저장하는 input에 값이 있다면
		comAjax.addParam("PAGE_INDEX", $('#PAGE_INDEX').val());
	}else{ comAjax.addParam("PAGE_INDEX", 1); }//그 외: 모두 1페이지
	comAjax.addParam("PAGE_ROW", 10);//한 페이지에 보여줄 행(데이터)의 수
	comAjax.ajax();
}


//Ajax 요청이 완료된 후 호출될 함수
function fn_selectBoardListCallback(data){
	let total = data.TOTAL;
	let body = $(".r_list");
	body.empty();
	console.log("글 총개수 : "+ total);
	if(total == 0){
		let str = "<div class='center'><br><br>🤔<br>작성하신 리뷰가 없어요</div>";
		body.html(str);
	}
	else{
		var params = {
			divId : "paging",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_selectBoardList"
		};
		gfn_renderPaging_B(params); //페이징 실행
		let str = "";
		
		$.each(data.reviewList, function(key, i){
			var rDate = new Intl.DateTimeFormat('kr').format(new Date(i.RE_REG_DATE));
			console.log(rDate);
			str+= "<tr><td><div id='regDate' class='txt_right'>"+ rDate+"</div>" 
					+"<div class='pp flexBetween'>"
					+"<div class='txt_left'><p id='ppp'>"
					+"<span id='place' class='txt_big'>" + i.RE_WRITER_NAME+(i.RE_WRITER_ID)+ "&nbsp;|&nbsp;</span>";
					
					for(let j =1 ; j<=i.RE_STAR;j++) {
						str+= "<i class='fa-solid fa-star color' id='stars'></i>";
					}
					for(let j =1 ; j<=(5-i.RE_STAR);j++) {
						str+= "<i class='fa-regular fa-star color' id='stars'></i>";
					}
					console.log(i.photoList.length);
					if(i.photoList.length>0) {
						str+= "<span id='place' class='txt_big'>&nbsp;|&nbsp;</span><i class='fa-solid fa-image color' id='stars'></i>";
					}
			str+="&nbsp;</p><br>";
			str+="<div class='flex'><div><span id='contents'>";
			
			if(i.RE_CONTENTS.length > 51){
				str+= i.RE_CONTENTS.substring(0, 50)+ "...";
			} else {
				str+= i.RE_CONTENTS;
			}
			
			
			/* str+="<li class="flex">
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
	</li> */
		});
		console.log(str);
		body.append(str);

	}
}
</script>
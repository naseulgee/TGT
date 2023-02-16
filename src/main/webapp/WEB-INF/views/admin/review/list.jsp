<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css" ></link>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="/resources/js/paging/searchPaging_B.js" defer></script>
<script type="text/javascript">
	function recheck() { return confirm("정말 삭제하시겠어요?");};		
</script>

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

#star2{ color : #d1d5d9; }

.flexCenter { justify-content: flex-start; }
</style>

<script>

</script>

<main class="layoutCenter">
	<h1 class="txt_center">리뷰관리</h1><br><br>
	
	<!-- 검색창 -->
	<div id="searchReview" class="search_wrap txt_center">
		시설명/주소 <input type="checkBox" name="searchType" value="0" ${empty search.m_type || search.m_type == 0?"checked":""}>
		회원ID <input type="checkBox" name="searchType" value="1" ${search.m_type == 1?"checked":""}>
		내용 <input type="checkBox" name="searchType" value="2" ${search.m_type == 2?"checked":""}>
		&nbsp;&nbsp;
		<input type="text" placeholder="검색어를 입력하개 :)" autocomplete="off" value="">
		<button type="button">
			<i class="fa-solid fa-magnifying-glass" onclick="onSearch()"></i>
			<span class="displaynone">검색</span>
		</button>
	</div>
	
	<br><br>
	
	<!-- 리뷰리스트 -->
	<table>
		<tbody class="r_list">
			<!-- 모든 페이지가 뜰 목록 -->
		</tbody>
	</table>

	<!-- 페이징 -->
	<ul id="paging"></ul>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	<form id="commonForm" name="commonForm"></form>
		
</main><!-- //main 종료 -->

<script>
let searchType;
let checkBox;
let keyword;
function onSearch() {
	//초기화
	searchType = "";  checkBox = "";  keyword = "";
	
	//check된 searchType항목의 값을 담는다
	checkBox = $("#searchReview input[type='checkBox']:checked");
	if (checkBox.length == 0) { alert('항목을 선택하세요'); return; }
	for (let i=0 ; i<checkBox.length ; i++) {
		searchType+= (checkBox[i].value+" ");
	}
	
	//검색 keyword를 담는다
	keyword =  $("#searchReview input[type='text']")[0].value;
	if (keyword.length == 0) { alert('검색어를 입력하세요'); return; }
	
	fn_selectBoardList(1);	
}

$(document).ready(function(){
	fn_selectBoardList(1); //1페이지 받기
});

function fn_selectBoardList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/review/selectSearch.paw' />"); 
	comAjax.setCallback("fn_selectBoardListCallback"); 
	comAjax.addParam("keyword",keyword);
	comAjax.addParam("searchType",searchType); 
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
	let body = $(".r_list"); 	body.empty();
	
	if(total == 0){
		let str = "<div class='txt_center'><br><br>🤔<br>시설에 대한 리뷰가 없어요</div><br><br>";
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
		
		let str = ""; //리스트를 담는 변수
		$.each(data.reviewList, function(key, i){
			var rDate = new Date(i.RE_REG_DATE);
			rDate = rDate.getFullYear()+"-"+rDate.getMonth()+"-"+rDate.getDate();
			
			str+="<tr><td width='80%'><div class='pp flexBetween'>"
			
			
				str+="<div class='txt_left'>";
				//누가, 언제, 어떤 시설에 대해 작성한 리뷰인지에 대한 설명
				str+="[리뷰번호&nbsp;"+i.RE_IDX+"]<br><span id='highlight'>" + i.RE_WRITER_NAME + "("+i.RE_WRITER_ID+")</span>님이 ";
				str+="<span id='highlight'>" + rDate +"</span>에 작성하신 "; 
				str+="<span id='highlight'>" + i.PL_NAME + "(" + i.PL_LOC + ")</span>에 대한 리뷰입니다.<br>";
								
			if (i.RE_DEL_GB == 'N') {					
				str+="<div class='flexCenter'>";
				//별점
				str+="<div id='star1' class='bold txt_big'>"+i.RE_STAR+"</div>";
				str+="<div id='star2'>/5점</div>&nbsp;&nbsp;&nbsp";
				//내용
				str+="<div id='contents' class='flex'><div>";
				if (i.RE_CONTENTS.length > 51) {
					str+=i.RE_CONTENTS.substring(0, 50)+"...";
				} else {
					str+=i.RE_CONTENTS;
				}
				str+="&nbsp;</div>";
				
				//사진유무
				if (i.photoList.length != 0) {
					str+="<div><i class='fa-solid fa-image txt_big'></i></div>";
				}			
				str+="</div> &nbsp;&nbsp;</div></div>";
				
				//상세, 삭제버튼
				str+="<div class='txt_right'>";
					//리뷰상세보기로 이동하는 버튼 
					str+="<div class='txt_right flex'><div><form action='/admin/review/detail.paw' method='POST'>";
					str+="<input type='submit' class='btn' value='상세'>"; 
					str+="<input type='hidden' name='re_idx' value='"+i.RE_IDX+"'>";
					str+="<input type='hidden' name='pl_idx' value='"+i.RE_PL_IDX+"'>";
					str+="<input type='hidden' name='ph_board_type' value='review'>";
					str+="</form></div>&nbsp;&nbsp;";
					
					//삭제버튼 
					str+="<div><form action='/admin/review/delete.paw' method='post'>";
					str+="<input type='submit' class='btn submit' value='삭제' onClick='return recheck();'>";
					str+="<input type='hidden' id='re_idx' name='re_idx' value='"+ i.RE_IDX+"'>";
					str+="<input type='hidden' name='pl_idx' value='"+i.RE_PL_IDX+"'>";
					str+="<input type='hidden' id='ph_board_type' name='ph_board_type' value='review'>";
					str+="</form></div>";
					str+="</div>";  
							
				str+="<div>"; //flexCenter끝
				
			} else {
				str+="<span id='contents' class='txt_big'>※사용자의 요청으로 삭제된 리뷰입니다.※</span>";
			}
			
			str+="</div></div></td></tr>";

		});
		
		body.html(str);
	}
}
</script>



<%@ include file="/WEB-INF/include/common-footer.jspf" %>
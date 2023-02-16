<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/paging/searchPaging_B.js" defer></script>

<style>
#stars { display: inline-block; color: #ffb100; }
#star1{ color : #db776c; font-size : 60px; }	
#star2{ color : #d1d5d9; }
main img { width: 50px; height: 50px; object-fit: cover; border-radius: 10px; }
#wrap { width:70%;}
#place, #stars, #regDate { font-size: 1.2em; }
table tbody tr td { white-space : inherit;}
#contents { width: 80%; }
.pp { justify-content: space-between;}
main .pop_img_wrap {gap: 20px; }
</style>

<script type="text/javascript">
	function recheck() { return confirm("정말 삭제하시겠어요?");};		
</script>

<main class="layoutCenter">
	<div class="wrap txt_center">
		
		<div class="place_info"></div><br>
		
		<!-- 시설번호 -->
		<input type="hidden" value="${pl_idx}" id="pl_idx" name="pl_idx">
		<!-- 정렬옵션 -->
		<input type="hidden" value="${option}" id="option" name="option">
		<!-- 현재 로그인한 회원의 아이디 -->
		<input type='hidden' id="mem_id" value="${mem_id}">

		<div class="info">
			<!-- 평균과 개수가 들어오는 곳 -->
		</div>
		
		<div class="order txt_right">
			<!-- 정렬버튼이 들어오는 곳 -->
		</div>	
		
		<hr>
		
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
let option = 0;
function checkOption(target) {
	option = target.value;//option값 불러오기
	fn_selectBoardList(1);
}

$(document).ready(function(){
	fn_selectBoardList(1); //1페이지 받기
});

function fn_selectBoardList(pageNo){
	var comAjax = new ComAjax();
	let pl_idx = $("#pl_idx").val();
	console.log(option);
	comAjax.setUrl("<c:url value='/place/detail/"+pl_idx+"/review/selectList.paw' />"); //페이징실행 컨트롤러url
	comAjax.setCallback("fn_selectBoardListCallback"); //setCallback은 Ajax 요청이 완료된 후 호출될 함수의 이름을 지정
	comAjax.addParam("option",option);
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
	let info = $(".info"); 	info.empty();
	let order = $(".order"); 	order.empty();
	let place = $(".place_info"); place.empty();
	if(total == 0){
		let str = "<div class='center'><br><br>🤔<br>시설에 대한 리뷰가 없어요</div>";
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
		let str2 = ""; //리뷰개수, 평균의 정보를 담는 변수
		let str3 = "";
		let str4 = "";
		str4 += "<h1>"+ data.reviewList[0].PL_NAME + "</h1>"+"(" +data.reviewList[0].PL_LOC+")" ;
		place.html(str4);
		
		str2 += "<div class='txt_center txt_big'><span id='star1' class='bold'>"+data.info.RAVG+"</span>";
		str2 += "<span id='star2'>/5점</span></div><br><br><h3 class='txt_left'>리뷰 <span style='color : #db776c;'>"+data.info.RCOUNT+"</span></h3>";
		
		str3 += "<button type='button' class='option "; 
		if (data.option == 1) { str3 += " bold color "; } 
		str3 += "' name='option' value='1' onClick='checkOption(this)'>평점높은순</button> | ";
		
		str3 += "<button type='button' class='option "; 
		if (data.option == 2) {str3 += " bold color "; } 
		str3 += "' name='option' value='2' onClick='checkOption(this)'>평점낮은순</button> | ";
		
		str3 += "<button type='button' class='option "; 
		if (data.option == 0) {str3 += " bold color "; } 
		str3 += "' name='option' value='0' onClick='checkOption(this)'>최신순</button>";

		info.html(str2);
		order.html(str3);
		
		$.each(data.reviewList, function(key, i){
			var rDate = new Date(i.RE_REG_DATE);
			rDate = rDate.getFullYear()+"-"+rDate.getMonth()+"-"+rDate.getDate();
			
			str+= "<tr><td><div class='pp flex'>";
			
			//이미지 썸네일
			str+= "<div class='flex'><div class='pop_img_wrap'>";
			if(i.photoList.length>0) {
				for (let j =0 ; j<i.photoList.length ; j++) {		
					str+= "<img class='pop_img' alt='"+i.RE_WRITER_NAME+"님의 리뷰 이미지' src='/resources/upload/s_"+i.photoList[j].PH_STORED_FILE_NAME+"'>&nbsp;";
				}	
			}
			str +='</div>';
			
			//리뷰내용
			str+= "<div class='txt_left'>";
					str+="<span id='place'> " + i.RE_WRITER_NAME+" ("+(i.RE_WRITER_ID)+ ") &nbsp;|&nbsp;</span>";
					
					for(let j =1 ; j<=i.RE_STAR;j++) {
						str+= "<i class='fa-solid fa-star' id='stars'></i>";
					}
					for(let j =1 ; j<=(5-i.RE_STAR);j++) {
						str+= "<i class='fa-regular fa-star' id='stars'></i>";
					}
					str+="<span id='regDate'> |&nbsp;"+ rDate+"</span>";
					
			str+="&nbsp;";
			str+="<p id='contents'>"+i.RE_CONTENTS+"</p></div></div>";

			
			//수정 삭제버튼
			 if ($("#mem_id").val() == i.RE_WRITER_ID ) {
				str+="<div class='txt_right flex'><div><form action='/review/updateForm.paw' method='POST'>";
				str+="<input type='submit' class='btn' value='수정'>"; 
				str+="<input type='hidden' name='re_idx' value='"+i.RE_IDX+"'>";
				str+="<input type='hidden' name='ph_board_type' value='review'>";
				str+="</form></div>&nbsp;<div><form action='/review/delete.paw' method='POST'>";
				str+="<input type='submit' class='btn warn' value='삭제' onClick='return recheck();'>"; 
				str+="<input type='hidden' name='re_idx' value='"+i.RE_IDX+"'>";
				str+="<input type='hidden' name='ph_board_type' value='review'>";
				str+="</form></div></div>";
			} 
			
			
			str+="</td></tr>";

		});
		body.append(str);

	}
}
</script>
<link rel="stylesheet" type="text/css" href="/resources/css/common/img_pop_slide.css"/>
<script src="/resources/js/common/img_pop_slide.js"></script>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
$(document).ready(function() {
	fn_selectBoardList(1);
	
	//검색 감지
	$("#subKeyword").on("input", function(){fn_selectBoardList(1);});
	
	//선택 감지
	$("#order").on("change", function(){fn_selectBoardList(1);});
});

//리스트 세팅 함수
function fn_selectBoardList(pageNo) {
	let comAjax = new ComAjax();

	comAjax.setUrl("/place/list.paw");
	comAjax.setCallback("fn_selectBoardListCallback");

	//페이징 세팅
	if(!isNull(pageNo)){//함수 호출 시 매개변수를 주었다면
		comAjax.addParam("PAGE_INDEX", pageNo);
	}else if(!isNull($('#PAGE_INDEX').val())){//매개변수가 없지만 페이징 값을 저장하는 input에 값이 있다면
		comAjax.addParam("PAGE_INDEX", $('#PAGE_INDEX').val());
	}else{ comAjax.addParam("PAGE_INDEX", 1); }//그 외: 모두 1페이지
	comAjax.addParam("PAGE_ROW", 5);
	
	//검색 값 추가
	if(!isNull($('#subKeyword').val())) comAjax.addParam("subKeyword", $('#subKeyword').val());
	
	//카테고리 선택 값 추가
	if(!isNull($('input[name="pl_pc_idx"]:checked').val())) comAjax.addParam("pl_pc_idx", $('input[name="pl_pc_idx"]:checked').val());

	//정렬값 추가
	comAjax.addParam("order", $('#order option:selected').val());
	
	comAjax.ajax();
}

//ajax 통신 후 세팅 함수
function fn_selectBoardListCallback(data) {
	let total = data.TOTAL;
	let pl_list_body = $(".pl_list");
	let pl_cate_body = $(".cate_wrap");
	let str;

	//카테고리 세팅 로직
	if(data.cate_list.length > 0){
		str = "<input id='caAll' type='radio' name='pl_pc_idx' value='caAll'>"
		str += "<label for='caAll'>전체</label>";
		let chk;
		$.each(data.cate_list, function(key, value) {
			chk = value.PC_IDX == data.select_cate ? "checked" : "";
			str += "<input id='ca"+value.PC_IDX+"' type='radio' name='pl_pc_idx' value='"+value.PC_IDX+"' "+chk+">";
			str += "<label for='ca"+value.PC_IDX+"'>"+value.PC_NAME+"</label>";
		});
		if(!str.includes("checked")){
			str = str.replace("id='caAll'","id='caAll' checked");
		}
		pl_cate_body.html(str);
		select_cate();
	}
	
	//시설 리스트 세팅 로직
	if (total == 0) {
		pl_list_body.html("<tr><td class='empty'>조회된 결과가 없습니다.</td></tr>");
	} else {
		str = "";
		let params = {
			divId : "paging",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_selectBoardList",
			recordCount : 5,
		};
		gfn_renderPaging_B(params);

		$.each(data.list, function(key, value) {
			//이미지
			let image = (isNull(value.PH_NAME))?"<i class='fa-thin fa-image no-image'></i>":"<img src='/resources/upload/"+value.PH_NAME+"' alt='"+value.PL_NAME+" 이미지' onerror='javascript:no_image(this)'>";
			//리뷰(총리뷰)
			let review = (isNull(value.R_AVG))?"0(0)":value.R_AVG+"("+value.R_COUNT+")";
			//시설메뉴  +총개수
			let menu = (isNull(value.PM_NAME))?"":value.PM_NAME;
			let menu_count = (isNull(value.PM_COUNT) || value.PM_COUNT-1 > 0)?"":" +"+value.PM_COUNT;
			str += "<tr class='use_move' data-href='/place/detail/"+value.PL_IDX+".paw' onclick='move(this)'>";
			str += "<th class='img'>이미지</th><td>" + image + "</td>"
				+ "<th class='cate'>카테고리</th><td>" + value.PC_NAME + "</td>"
				+ "<th class='name'>시설명</th><td>" + value.PL_NAME + "</td>"
				+ "<th class='review'>평점</th><td> " + review + "</td>"
				+ "<th class='loc'>주소</th><td>" + value.PL_LOC + "</td>"
				+ "<th class='menu'>메뉴</th><td>" + menu + menu_count + "</td>"
			str += "</tr>";
		});
		pl_list_body.html(str);
	}
}
//이미지가 없을 때
function no_image(target){
	target.outerHTML = "<i class='fa-thin fa-image no-image'></i>";
}

//카테고리 클릭 감지 함수
function select_cate(){
	$(".cate_wrap label").on("click", function(){
		$(".cate_wrap input").attr("checked", false);
		$("#"+$(this).attr("for")).attr("checked", true);
		fn_selectBoardList(1);
	});
}
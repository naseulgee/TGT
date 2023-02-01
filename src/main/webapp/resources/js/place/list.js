$(document).ready(function() {
	fn_selectBoardList(1);
	
	//검색 감지
	$("#subKeyword").on("input", function(){fn_selectBoardList(1);});
});

//리스트 세팅 함수
function fn_selectBoardList(pageNo) {
	let comAjax = new ComAjax();

	comAjax.setUrl("/place/list.paw");
	comAjax.setCallback("fn_selectBoardListCallback");

	//페이징 세팅
	if(!isNull(pageNo)) comAjax.addParam("PAGE_INDEX", pageNo);
	else comAjax.addParam("PAGE_INDEX", $('#PAGE_INDEX').val());
	comAjax.addParam("PAGE_ROW", 10);
	
	//검색 값 추가
	if(!isNull($('#subKeyword').val())) comAjax.addParam("subKeyword", $('#subKeyword').val());
	
	//카테고리 선택 값 추가
	if(!isNull($('input[name="pl_pc_idx"]:checked').val())) comAjax.addParam("pl_pc_idx", $('input[name="pl_pc_idx"]:checked').val());

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
		str += "<label class='btn' for='caAll'>전체</label>";
		let chk;
		$.each(data.cate_list, function(key, value) {
			chk = value.PC_IDX == data.select_cate ? "checked" : "";
			str += "<input id='ca"+value.PC_IDX+"' type='radio' name='pl_pc_idx' value='"+value.PC_IDX+"' "+chk+">";
			str += "<label class='btn' for='ca"+value.PC_IDX+"'>"+value.PC_NAME+"</label>";
		});
		if(!str.includes("checked")){
			str = str.replace("id='caAll'","id='caAll' checked");
		}
		pl_cate_body.html(str);
		select_cate();
	}
	
	//시설 리스트 세팅 로직
	if (total == 0) {
		pl_list_body.html("<tr align='center'><td class='empty'>조회된 결과가 없습니다.</td></tr>");
	} else {
		str = "";
		let params = {
			divId : "paging",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_selectBoardList",
		};
		gfn_renderPaging_B(params);

		$.each(data.list, function(key, value) {
			//리뷰(총리뷰)
			let review = (isNull(value.R_AVG))?"0(0)":value.R_AVG+"("+value.R_COUNT+")";
			//시설메뉴  +총개수
			let menu = (isNull(value.PM_NAME))?"":value.PM_NAME;
			let menu_count = (isNull(value.PM_COUNT) || value.PM_COUNT-1 > 0)?"":" +"+value.PM_COUNT;
			str += "<tr class='use_move' data-href='/place/detail/"+value.PL_IDX+".paw' onclick='move(this)'>";
			str += "<th>카테고리</th><td>" + value.PC_NAME + "</td>"
				+ "<th>시설명</th><td>" + value.PL_NAME + "</td>"
				+ "<th>평점</th><td>" + review + "</td>"
				+ "<th>주소</th><td>" + value.PL_LOC + "</td>"
				+ "<th>메뉴</th><td>" + menu + menu_count + "</td>"
			str += "</tr>";
		});
		pl_list_body.html(str);
	}
}

//카테고리 클릭 감지 함수
function select_cate(){
	$(".cate_wrap label").on("click", function(){
		$(".cate_wrap input").attr("checked", false);
		$("#"+$(this).attr("for")).attr("checked", true);
		fn_selectBoardList(1);
	});
}
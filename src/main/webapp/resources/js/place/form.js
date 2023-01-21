$(document).ready(function(){
	//주소 변경 감지
	observe("#address, #detailAddress", $("#pl_loc")[0], '$("#address").val()+", "+$("#detailAddress").val()');
	//전화번호 변경 감지
	observe("#tel1, #tel2, #tel3", $("#pl_call")[0], '$("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val()');
	//오픈 시간 변경 감지
	observe("#pl_open_hour, #pl_open_min, #open_AM, #open_PM", $("#pl_open")[0], 'time_set($("li.open"))');
	//종료 시간 변경 감지
	observe("#pl_close_hour, #pl_close_min, #close_AM, #close_PM", $("#pl_close")[0], 'time_set($("li.close"))');
});

//값이 바뀌는 것을 감지하여 특정 input의 값을 수정하는 함수
function observe(what, where, result){
	$(what).on("propertychange change keyup paste input", function() {
		where.value = eval(result);
	});
}

//주소 검색 버튼 클릭 시 상세 주소의 기존 데이터 제거하는 함수
function remove_addr(){
	$("#detailAddress").val("");
}

//시간을 네 자리 형식에 맞춰 리턴해주는 함수
function time_set(li){
	let hour = $(li).find('input[id$="hour"]').val();
	let min = $(li).find('input[id$="min"]').val();
	//둘 중 하나라도 값이 없을 경우 초기화
	if(isNull(hour) || isNull(min)) return "";
	//아래 로직들을 위한 형변환
	hour = parseInt(hour);
	min = parseInt(min);
	//오전 오후 감지
	if($(li).find(".ampm_wrap input:checked").val() == "PM") hour += 12;
	//한자리 수 감지
	if(hour < 10) hour = "0"+hour;
	if(min < 10) min = "0"+min;
	return ""+hour+min;
}
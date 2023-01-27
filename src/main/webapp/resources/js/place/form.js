$(document).ready(function(){
	//주소 변경 감지
	observe("#address, #detailAddress", $("#pl_loc")[0], '$("#address").val()+", "+$("#detailAddress").val()');
	//전화번호 변경 감지
	observe("#tel1, #tel2, #tel3", $("#pl_call")[0], 'tel_set()');
	//오픈 시간 변경 감지
	observe("#pl_open_hour, #pl_open_min, #open_AM, #open_PM", $("#pl_open")[0], 'time_set($("li.open"))');
	//종료 시간 변경 감지
	observe("#pl_close_hour, #pl_close_min, #close_AM, #close_PM", $("#pl_close")[0], 'time_set($("li.close"))');
	
	form_submit("/place/write.paw");
});

//값이 바뀌는 것을 감지하여 특정 input의 값을 수정하는 함수
function observe(what, where, result){
	$(what).on("input", function() {
		where.value = eval(result);
	});
}

//주소 검색 버튼 클릭 시 상세 주소의 기존 데이터 제거하는 함수
function remove_addr(){
	$("#detailAddress").val("");
}

//전화번호 형식에 맞춰 리턴해주는 함수
function tel_set(){
	let tel1 = $("#tel1").val();
	let tel2 = $("#tel2").val();
	let tel3 = $("#tel3").val();
	//셋 중 하나라도 값이 없을 경우 초기화
	if(isNull(tel1) || isNull(tel2) || isNull(tel3)) return "";
	//아닐경우 000-000-000 형식으로 리턴
	return tel1+"-"+tel2+"-"+tel3;
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

//유효성 검증
function checkForm(){
	let req = $("li.req");//필수 클래스를 가진 li 태그 변수에 담기
	let flag = true;
	
	//태그들 각각 검증 실행
	req.each(function(index, item){
		//자식 input_wrap 요소 변수에 담기
		let wrap = $(item).find(".input_wrap");
		let type = wrap.attr("data-check-type");
		let check_id = wrap.attr("data-check-id");
		let warn = wrap.find(".info_warn");
		
		//체크해야하는 자식 요소가 text/hidden 경우
		if(type == "one"){
			if(isNull($("#"+check_id).val())){//확인해야 하는 id를 가진 input의 값이 없을 경우
				if(warn.length > 0){//경고문구가 이미 있다면
					warn.text(info[check_id]);
				}else{
					wrap.append("<p class='info_warn'>"+info[check_id]+"</p>");
				}
				flag = false;
			}else{
				warn.remove();
			}
		}else{//자식 요소가 radio/checkbox 경우
			if($("input[id^='"+check_id+"']:checked").length == 0){
				if(warn.length > 0){//경고문구가 이미 있다면
					warn.text(info[check_id]);
				}else{
					wrap.append("<p class='info_warn'>"+info[check_id]+"</p>");
				}
				flag = false;
			}else{
				warn.remove();
			}
		}
	});
	
	//가장 첫번째로 검증을 통과하지 못한 input 위치로 이동
	let warn = $(".info_warn")[0];
	if(!isNull(warn)) window.scrollTo(0, $(warn).closest("li").offset().top - 70);
	
	return flag;
}
//검증 문구. data-check-id와 결과 문구를 쌍으로 가진다.
let info = {
	"pl_name": "시설명을 입력해 주세요. 최대 25글자까지 입력 가능합니다.",
	"pl_loc": "주소 검색 후 상세주소도 입력해 주세요.",
	"ca": "시설 분류를 선택해 주세요.",
}
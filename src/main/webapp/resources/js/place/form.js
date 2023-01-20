$(document).ready(function(){
	//주소 변경 감지
	observe("#address, #detailAddress", $("#pl_loc")[0], '$("#address").val()+", "+$("#detailAddress").val()');
	//전화번호 변경 감지
	observe("#tel1, #tel2, #tel3", $("#pl_call")[0], '$("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val()');
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
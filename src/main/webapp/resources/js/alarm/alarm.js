$(document).ready(function() {
	if(!isNull(document.getElementById("al_cnt"))) mem_al();
});

//미확인 알람 개수 세팅 함수
function mem_al(){
	$.ajax({
		url: "/alarm/non-check-count",
		type: "POST",
		contentType: "application/json",
		success: function(result){
			al_cnt.innerText = result.count;
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}

//알람 확인 메소드. 알람을 클릭 시 발동한다.
function al_check(target, number){
	$.ajax({
		url: "/mypage/alarm/check",
		type: "POST",
		data: JSON.stringify({target: number, al_check: "Y"}),
		contentType: "application/json",
		success: function(result){
			let tr = target.closest("tr");
			if(!isNull(tr) && !tr.classList.contains("check")) tr.classList.add("check");
			location.href = target.href;
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}

//알람 삭제 메소드
function al_del(target, number){
	if(confirm("정말 해당 알람을 삭제하시겠습니까?")) return move(target, "target:"+number);
}
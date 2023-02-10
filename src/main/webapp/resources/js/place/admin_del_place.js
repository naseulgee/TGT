//삭제요청 수락/취소 버튼 클릭 시 통신 함수
function del(param, idx){
	event.stopPropagation();//리스트페이지에서 상세페이지 이동 이벤트 버블링 중단
	let _url = "", del_gb = "";
	if(param == "Y"){//삭제
		if(!confirm("정말 삭제하시겠습니까?")) return false;
		_url = "/admin/place/delete";
	}else if(param == "N"){//삭제 요청 취소
		_url = "/place/delete";
		del_gb = param
	}
	$.ajax({
		url: _url,
		type: "POST",
		data: JSON.stringify({
			pl_idx: idx,
			pl_del_gb: del_gb
		}),
		contentType: "application/json",
		success: function(){
			alert("처리되었습니다!");
			return location.href = "/admin/place/list.paw";
		},
		error: function(result){
			console.log(result.status);
			console.log(result.error);
			console.log(result.responseText);
		}
	});
}
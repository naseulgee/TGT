	
	var withService = (function() {

	function add(togewith, error) {
		console.log("add togewith...............");

		$.ajax({
			type : 'POST',
			url : '/together/with.paw',
			data : JSON.stringify(togewith),
			dataType : 'json',//서버에서 보내는 데이터 타입
			contentType : 'application/json; charset=utf-8',//서버로 보내는 타입
			success : function(result, status, xhr) {
				if (result) {
					alert("참여완료!");
				}else{
					alert("값없음");
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
					alert("error입니다");
				}
			}
		})//ajax 끝
	}//add 함수 끝
	
	function remove(togewith, error) {
	
		$.ajax({
			type : 'delete',
			url : '/together/withdel.paw',
			data : JSON.stringify(togewith),
			dataType : 'json',//서버에서 보내는 데이터 타입
			contentType : 'application/json; charset=utf-8',//서버로 보내는 타입
			success : function(deleteResult, status, xhr) {
				if(deleteResult){
					alert("참여취소:(");
				}else{
					alert("값없음");
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
					alert("error입니다");
				}
			}
		})//ajax끝
	}//remove 함수 끝
return {
		add : add,
		remove : remove
		};
})();		
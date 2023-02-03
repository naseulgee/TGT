var listService = (function() {

	function add(tc_name, error) {
		console.log("add tc_name...............");

		$.ajax({
			type : 'post',
			url : '/together/catelist.paw',
			data : JSON.stringify(tc_name),
			dataType : 'json',//서버에서 보내는 데이터 타입
			contentType : 'application/json; charset=utf-8',//서버로 보내는 타입
			success : function(result, status, xhr) {
				if (result) {
					alert("이동하개!");
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
return {
		add : add,
		};
})();
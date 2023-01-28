	
	var withService = (function() {

	function add(togewith, callback, error) {
		console.log("add togewith...............");

		$.ajax({
			type : 'POST',
			url : '/together/with.paw',
			data : JSON.stringify(togewith),
			contentType : "application/json; charset=utf-8",
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
		})
	}
return {
		add : add
		};
})();		
$('#withmem').on("click", function(){
	
	var allData = $("#withreg").serialize();
	
	$.ajax({
		type : 'POST',
		data : JSON.stringify(allData),
		datatype : 'json',
		url : '/together/withreg.paw',
		contentType: "application/json; charset=utf-8",
		success : function(data){
			
			alert("참여완료");
		},
		error : function(xhr, status, error) {
			alert('에러야!!!!' + error);
		}
	});//ajax 끝
});//함수끝

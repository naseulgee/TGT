/* ===================== board write.jsp 게시글 유효성 검사 ===================== */
function checkConfirm() {
		if ($("#BC_TITLE").val()==""){
			toastr.error("제목을 입력하세요");
			$("#BC_TITLE").focus();
			return false;
		}
		else if($("#BC_CONTENTS").val()==""){
			toastr.error("내용을 입력하세요");
			$("#BC_CONTENTS").focus();
			return false;
		}
		return true;
	}


function returntoList(){
		if (confirm("목록으로 이동하시겠습니까?")){
			location.href='/board/list.paw';
		}
	}
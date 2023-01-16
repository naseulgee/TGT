/* ===================== board write.jsp 게시글 유효성 검사 ===================== */
function checkConfirm() {
		var frm = document.getElementById("frm");
		var BC_TITLE = document.getElementById("BC_TITLE");
		var BC_CONTENTS = document.getElementById("BC_CONTENTS");

		if (BC_TITLE.value.length == 0) {
			alert("제목을 입력하세요");
			frm.BC_TITLE.focus();
			return false;
		}
		else if (BC_CONTENTS.value.length == 0) {
			alert("내용 입력하세요.");
			return false;
		}
		return true;
	}
	
	
	

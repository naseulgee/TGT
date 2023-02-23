<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ include file="/WEB-INF/include/common-head.jspf" %>

<script src="/resources/js/paging/searchPaging_B.js"></script>

	<div>
		<table id="board_list">
			<thead>
				<tr>
					<th width="8%">글번호</th>
					<th width="15%">카테고리</th>
					<th width="*%">제목</th>
					<th width="12%">작성자</th>
					<th width="8%">조회수</th>
					<th width="10%">작성일</th>
				</tr>
			</thead>
			<tbody class="board">
	
			</tbody>
		</table>
		<div class="goBoard_div">
			<a class="goBoard" href="/board/list.paw">
				<i class="fa-solid fa-angles-right"></i>멍멍왈왈로 이동하기
			</a>
		</div>
	</div>
	
	
	<div id="PAGE_NAVI_B"></div>
	<input type="hidden" id="PAGE_INDEX_B" name="PAGE_INDEX_B" />
	<br />
	
	<form id="commonForm" name="commonForm"></form>

<!-- <script type="text/javascript" src="/resources/js/main/search_board.js"></script>-->
<script type="text/javascript">

	$(document).ready(function() {
		fn_selectBoardList(1);
		$("a[name='title']").on("click", function(e) { //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
	});

	function fn_selectBoardList(pageNo) {
		var comAjax = new ComAjax();

		comAjax.setUrl("<c:url value='/paging/board.paw' />");
		comAjax.setCallback("fn_selectBoardListCallback");

		comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_B").val());
		comAjax.addParam("PAGE_ROW", 10);

		comAjax.addParam("keyword", $('#keyword').val());
		comAjax.addParam("searchType", $('#searchType').val());

		comAjax.ajax();
	}

	
	function fn_selectBoardListCallback(data) {
		var total = data.TOTAL_B;
		var body = $(".board");
		body.empty();

		if (total == 0) {
			var str = "<tr align='center'>"
					+ "<td colspan='6'>조회된 결과가 없습니다.</td>" + "</tr>";
			body.append(str);

		} else {
			var params = {
				divId : "PAGE_NAVI_B",
				pageIndex : "PAGE_INDEX_B",
				totalCount : total,
				eventName : "fn_selectBoardList",
			};
			gfn_renderPaging_B(params);

			var str = "";
			$.each(data.boardSearchList, function(key, value) {
				str += "<tr class='use_move' data-href='/board/detail/" + value.BC_IDX + ".paw' onclick=\"move(this,\'BC_IDX:" + value.BC_IDX + "\')\"> " 
						+ "<td align='center'>" + value.BC_IDX+ "</td>" 
						+ "<td align='center'>" + value.BC_BCC_NAME + "</td>"
						+ "<td>" + value.BC_TITLE + "</td>" 
						+ "<td align='center'>" + value.BC_WRITER_NAME + "</td>" 
						+ "<td align='center'>" + value.BC_READHIT + "</td>" 
						+ "<td align='center'>" + value.BC_MOD_DATE + "</td>" + "</tr>";
			});
			body.append(str);
		}
	}
</script>
</html>

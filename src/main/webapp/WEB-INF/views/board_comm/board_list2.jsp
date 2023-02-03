<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

						<table id="board_list">
						<tbody class="board">
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list }" var="row">
										<tr align="center" class="use_move"
											data-href="/board/detail.paw"
											onclick="move(this,'BC_IDX:${row.BC_IDX}')">
											<td width="5%">${row.BC_IDX }</td>
											<td width="15%">${row.BC_BCC_NAME }</td>
											<td width="45%">${row.BC_TITLE }</td>
											<td width="5%">${row.BC_READHIT }</td>
											<td width="10%">${row.BC_WRITER_ID }</td>
											<td width="10%"><fmt:formatDate
													value="${row.BC_MOD_DATE}" pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						</table>
						
						<div id="PAGE_NAVI_B"></div>
	<input type="hidden" id="PAGE_INDEX_B" name="PAGE_INDEX_B" />
	<br />
	
	<form id="commonForm" name="commonForm"></form>
						
<!-- <script type="text/javascript">

$(document).ready(function() {
	fn_selectBoardList(1);
	$("a[name='title']").on("click", function(e) { //제목 
		e.preventDefault();
		fn_openBoardDetail($(this));
	});
});

function fn_selectBoardList(pageNo) {
	var comAjax = new ComAjax();

	comAjax.setUrl("<c:url value='/pagingBoard/list.paw' />");
	comAjax.setCallback("fn_selectBoardListCallback");

	comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_B").val());
	comAjax.addParam("PAGE_ROW", 10);

	comAjax.addParam("keyword", $('#keyword').val());

	comAjax.ajax();
}

function fn_selectBoardListCallback(data) {
	var total = data.TOTAL_B;
	var body = $(".board");
	body.empty(data.TOTAL_B);

	alert();
	if (total == 0) {
		var str = "<tr align='center'>"
				+ "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>";
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
		$.each(data.selectBoardList, function(key, value) {
			str += "<tr>"
						+ "<td align='center'>" + value.BC_IDX + "</td>"
						+ "<td align='center'>" + value.BC_BCC_NAME + "</td>"
						+ "<td class='title'>"
						+ "<a href='#this' name='title'>" + value.BC_TITLE + "</a>"
						+ "<input type='hidden' name='title' id='IDX' value=" + value.BC_IDX + ">"
						+ "</td>" 
						+ "<td align='center'>" + value.BC_WRITER_ID + "</td>"
						+ "<td align='center'>" + value.BC_READHIT + "</td>" 
						+ "<td align='center'>" + value.BC_MOD_DATE + "</td>" 
					+ "</tr>";
			});
		body.append(str);
	}

	$("a[name='title']").on("click", function(e) { //제목 
		e.preventDefault();
		fn_openBoardDetail($(this));
	});

	function fn_openBoardDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/detail.paw' />");
		comSubmit.addParam("BC_IDX", obj.parent().find("#IDX").val());
		comSubmit.submit();
	}

}
	
</script>  -->

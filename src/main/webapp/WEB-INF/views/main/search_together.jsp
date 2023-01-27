<html  lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/common-head.jspf" %>
<script src="/resources/js/paging/searchPaging_T.js"></script>

	<div>
			<table class="card_table" id="together_list">
				<thead>
					<tr>
						<th scope="col">제목 [지역]</th>
						<th scope="col">내용</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody class="together">

				</tbody>
			</table>
	</div>

	<div id="PAGE_NAVI_T"></div>
	<input type="hidden" id="PAGE_INDEX_T" name="PAGE_INDEX_T" /> <br />

		<form id="commonForm" name="commonForm"></form>
<!-- <script type="text/javascript" src="/resources/js/main/search_together.js"></script> -->
 
<script type="text/javascript">
	$(document).ready(function(){
		fn_selectBoardList2(1);
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail2($(this));
			});
		});

		function fn_selectBoardList2(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/paging/together.paw' />");
			comAjax.setCallback("fn_selectBoardListCallback2");
			
			comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_T").val());
			comAjax.addParam("PAGE_ROW", 6);

			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());

			comAjax.ajax();
		}
		

		function fn_selectBoardListCallback2(data) {
			var total2 = data.TOTAL_T;
			
			var body = $(".together");
			body.empty();
			
			if (total2 == 0) {
				var str = "<tr align='center'>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);

			} else {
				var params2 = {
					divId : "PAGE_NAVI_T",
					pageIndex : "PAGE_INDEX_T",
					totalCount : total2,
					eventName : "fn_selectBoardList2",
				};
				gfn_renderPaging_T(params2);

				var str = "";
				$.each(data.togetherSearchList,
					function(key, value) {
						str += "<tr>"+ // class='use_move' data-href='/board/detail.paw' onclick='move(this,'BC_IDX:"+value.BC_IDX+"')'
									"<td align='center'>"+ value.TO_IDX + "[ "+value.TO_LOC+"]</td>"+ 
									"<td class='title' align='center'>"+ 
										"<a href='#this' name='title'>"+ value.TO_TITLE+ "</a>"+ 
										"<input type='hidden' name='title' id='IDX' value=" + value.TO_IDX + ">"+ 
									"</td>" + 
									"<td align='center'>"+ value.TO_WRITER_ID + "</td>"+ 
									"<td align='center'>"+ value.TO_DATE + "</td>"+ 
								"</tr>";
					});
				body.append(str);
			}

				$("table[id='together_list']").on("click", function(e) { //제목 
					e.preventDefault();
					fn_openBoardDetail2($(this));
				});
				
				function fn_openBoardDetail2(obj) {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='together/detail.paw' />");
					comSubmit.addParam("TO_IDX", obj.parent().find("#IDX").val());
					comSubmit.submit();
				}
		}
	</script>
</html>
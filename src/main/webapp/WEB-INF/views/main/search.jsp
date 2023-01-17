<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/paging/paging.js"></script>

<main class="layoutCenter">
	<section class="notice">
		<div class="page-title">
			<div class="container">

				<form action="">
					<select style="width: 80px;" class="form-control" name="searchNum"
						id="searchNum">
						<option value="0">제목</option>
						<option value="1">내용</option>
					</select> <input class="form-control" type="text" name="isSearch"
						id="isSearch" style="width: 190px;" /> <span
						class="input-group-btn">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</form><br>

				<table class="board_list">
					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="15%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">조회수</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>

				<div id="PAGE_NAVI"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br /> <a
					href="#this" class="btn" id="write">글쓰기</a>

				<form id="commonForm" name="commonForm"></form>
			</div>
		</div>
	</section>
</main>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<script type="text/javascript">
	$(document).ready(function(){
		fn_selectBoardList(1);
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
	
	function fn_openBoardDetail(obj){			
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board_detail.paw' />");
		comSubmit.addParam("BC_IDX", obj.parent().find("#IDX").val());
		comSubmit.submit();
	}
	
		function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/search0.paw' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 10);
			//comAjax.addParam("IDX_FE", $("#IDX_FE").val());
			comAjax.ajax();
		}
		
		function fn_selectBoardListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				body.append(str);
			
			} else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectBoardList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.boardSearchList, function(key, value){
					str += "<tr>" + 								// class='use_move' data-href='/board_detail.paw' onclick='move(this,'BC_IDX:"+value.BC_IDX+"')'
								"<td align='center'>" + value.BC_IDX + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='title'>" + value.BC_TITLE + "</a>" +
									"<input type='hidden' name='title' id='IDX' value=" + value.BC_IDX + ">" + 
								"</td>" +
								"<td align='center'>" + value.BC_WRITER_ID + "</td>" + 
								"<td align='center'>" + value.BC_MOD_DATE + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				$("a[name='title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			
			}
		}
	</script>	
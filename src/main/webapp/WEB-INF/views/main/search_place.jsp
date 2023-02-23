<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/common-head.jspf" %>
<link href="resources/css/main/search.css" rel="stylesheet">

<script src="/resources/js/paging/searchPaging_P.js"></script>

	<div>
		<table class="card_table" id="place_list">
			<thead>
				<tr >
					<th></th>
					<th scope="col">이미지</th>
					<th scope="col">카테고리</th>
					<th scope="col">시설명</th>
					<th scope="col">평점</th>
					<th scope="col">주소</th>
				</tr>
			</thead>
			<tbody class="place">

			</tbody>
		</table>
		<div class="goBoard_div">
			<a class="goBoard" href="/place/list.paw">
				<i class="fa-solid fa-angles-right"></i>우리동네로 이동하기
			</a>
		</div>
	</div>

		<div id="PAGE_NAVI_P"></div>
		<input type="hidden" id="PAGE_INDEX_P" name="PAGE_INDEX_P" /> <br />

	<form id="commonForm" name="commonForm"></form>
<script type="text/javascript">
$(document).ready(function(){
	fn_selectPlaceList3(1);
		$("a[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openPlaceDetail3($(this));
		});
	});
	
	function fn_selectPlaceList3(pageNo) {
		var comAjax = new ComAjax();

		comAjax.setUrl("<c:url value='/paging/place.paw' />");
		comAjax.setCallback("fn_selectPlaceListCallback3");

		comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_P").val());
		comAjax.addParam("PAGE_ROW", 6);

		comAjax.addParam("keyword", $('#keyword').val());
		comAjax.addParam("searchType", $('#searchType').val());

		comAjax.ajax();
	}
	

	function fn_selectPlaceListCallback3(data) {
		var total3 = data.TOTAL_P;
		var body = $(".place");
		body.empty();
		
		if (total3 == 0) {
			var str = "<tr align='center'>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"+"</tr>";
			body.append(str);

		} else {
			var params3 = {
				divId : "PAGE_NAVI_P",
				pageIndex : "PAGE_INDEX_P",
				totalCount : total3,
				eventName : "fn_selectPlaceList3",
			};
			gfn_renderPaging_P(params3);

			var str = "";
			$.each(data.placeSearchList, function(key, value) {
				//이미지
				let image = (isNull(value.PH_NAME))?"<i class='fa-thin fa-image no-image'></i>":"<img src='/resources/upload/s_"+value.PH_NAME+"' alt='"+value.PL_NAME+" 이미지' onerror='javascript:no_image(this)'>";
				//리뷰(총리뷰)
				let review = (isNull(value.R_AVG))?"0(0)":value.R_AVG+"("+value.R_COUNT+")";
				//시설메뉴  +총개수
				let menu = (isNull(value.PM_NAME))?"":value.PM_NAME;
				let menu_count = (isNull(value.PM_COUNT) || value.PM_COUNT-1 > 0)?"":" +"+value.PM_COUNT;
				str += "<tr class='use_move' data-mapping='"+value.PL_IDX+"' data-href='/place/detail/"+value.PL_IDX+".paw' onclick='move(this)'>";
				str += "<Td></td><td class='img'>" + image + "</td>"
					+ "<td class='cate'>" + value.PC_NAME + "</td>"
					+ "<td class='pl_name'>" + value.PL_NAME + "</td>"
					+ "<td class='review'> " + review + "</td>"
					+ "<td class='loc'>" + value.PL_LOC + "</td>"
				str += "</tr>";
			});
			body.append(str);
		}
	}
</script>
</html>

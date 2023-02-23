<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/common-head.jspf" %>

<script src="/resources/js/paging/searchPaging_T.js"></script>

	<div>
		<table class="card_table" id="together_list">
			<thead>
				<tr>
					<th scope="col">[분류] 제목/ 상태</th>
					<th scope="col">조건</th>
					<th scope="col">날짜</th>
					<th scope="col">시간</th>
					<th scope="col">총원</th>
				</tr>
			</thead>
			<tbody class="together">

			</tbody>
		</table>
		<div class="goBoard_div">
			<a class="goBoard" href="/together/openList.paw">
				<i class="fa-solid fa-angles-right"></i>함께해요로 이동하기
			</a>
		</div>
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
				var str = "<tr></tr><tr align='center'>" 
						+ "<td colspan='4' style='flex-direction:"+"column-reverse"+"'>조회된 결과가 없습니다.</td>"
						+ "</tr><tr></tr>";
				body.append(str);

			} else {
				var params2 = {
					divId : "PAGE_NAVI_T",
					pageIndex : "PAGE_INDEX_T",
					totalCount : total2,
					eventName : "fn_selectBoardList2",
				};
				gfn_renderPaging_T(params2);

				var now = new Date()//날짜 형식의 변수 선언
				var nowDate = getFormatDate(now);//원하는 형태의 문자열로 변환(2023-02-09)
				var nowTime = getFormatTime(now);//원하는 형태의 문자열 시간으로 변환(22:10)
				
				var str = "";
				$.each(data.togetherSearchList,
						function(key, value) {
							str += "<tr class='use_move' name='togelist' data-href='/together/detail/"+value.TO_IDX +".paw' onclick='move(this,\"TO_IDX:"+value.TO_IDX+"\")'>";
							str += "<input type='hidden' name='TO_IDX' id='TO_IDX' value=" + value.TO_IDX + ">";
							str += "<td class='title' align='center'>"+ "<div class='title_font'><div class='cate'>"+ value.TC_NAME + "</div>&nbsp;"  +value.TO_TITLE+ "</div>";
							if(nowDate < value.TO_DATE){//문자열 형태로 비교
								if(value.C == value.TO_PEOPLE){
									str += "&nbsp;<a class='btn'>모집완료</span>";
								}
								if(value.C < value.TO_PEOPLE){
									str += "&nbsp;<a class='btn'>모집중</span>";
								}
							}
							else if(nowDate > value.TO_DATE){
								str += "&nbsp;<a class='btn warn'>마감</span>";
							}
							else{//현재 날짜와 모집날짜가 같을때
								if(nowTime > value.TO_TIME){//모집시간이 지났다면
									str += "&nbsp;<a class='btn warn'>마감</span>";
								}else{
									if(value.C == value.TO_PEOPLE){
										str += "&nbsp;<a class='btn'>모집완료</span>";
									}
									if(value.C < value.TO_PEOPLE){
										str += "&nbsp;<a class='btn disable'>모집중</span>";
									}
								}
							}
							str += "</td>";
							str += "<td><div class='td_font'><span class='fa-solid fa-paw'></span>참여가능하개 : </div>"  + value.BR_NAME + " ["; 
							if(value.TO_WT_IDX == 1){
								str += "XS"
							}
							if(value.TO_WT_IDX == 2){
								str += "S"
							}
							if(value.TO_WT_IDX == 3){
								str += "M"
							}
							if(value.TO_WT_IDX == 4){
								str += "L"
							}
							if(value.TO_WT_IDX == 5){
								str += "XL"
							}
							str += "]</td>";
							str += "<td class='to_date'><div class='td_font'><span class='fa-solid fa-paw'></span>언제개 : </div>" +value.TO_DATE + "</td>";
							str += "<td><div class='td_font'><span class='fa-solid fa-paw'></span>몇시개 : </div>"  + value.TO_TIME + "</td>";
							str += "<td><div class='td_font'><span class='fa-solid fa-paw'></span>몇명이개 : </div>"  + value.C + "/" + value.TO_PEOPLE + "</td>";
							str +=	"</tr>";
						});
				body.append(str);
			}
		}
		
		//input time 과 비교위한 바꾸기
		function getFormatTime(date){
			var hours = date.getHours();//현재시간(한자리)
			hours = hours >= 10? hours : '0' + hours;//hours 두자리로 지정
			var minutes = date.getMinutes();//현재분
			minutes = minutes >= 10? minutes : '0' + minutes; //minutes두자리로 지정
			return hours + ":" + minutes;//형태변경
		}
		
		//input date 형식과 비교를 위한 날짜 바꾸기
		function getFormatDate(date){
			var year = date.getFullYear();//yyyy
			var month = (1 + date.getMonth());//M
			month = month >= 10? month: '0' + month;//month 두자리로 지정
			var day = date.getDate();//d
			day = day >= 10? day: '0' + day;//day 두자리로 지정
			return year + '-' + month + '-' + day;//-추가하여 yyyy-MM-dd 형태 지정가능
		}
	</script>
</html>
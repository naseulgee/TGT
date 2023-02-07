<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/admin_list.css"/>
<script src="/resources/js/paging/searchPaging_B.js"></script>
<script src="/resources/js/place/admin_list.js"></script>
<script src="/resources/js/place/admin_del_place.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1>우리동네 시설 관리</h1>
<section class="btn_wrap flexCenter">
	<a class="btn" href="/admin/place/cate/list.paw">시설 분류 관리</a>
	<a class="btn submit" href="/admin/place/writeForm.paw">시설 등록</a>
</section>

<section class="search_wrap flex">
	<i class="fa-solid fa-magnifying-glass"></i>
	<input type="text" id="subKeyword" name="subKeyword" placeholder="지역/시설명/메뉴명 중 검색해주세요">
	<!-- 정렬 -->
	<div class="sort_wrap">
		<select id="order" name="order">
			<option value="new">최신순</option>
			<option value="name">이름순</option>
			<option value="reviewcnt">리뷰순</option>
			<option value="reviewavg">평점순</option>
		</select>
	</div>
	<!-- 표시 개수 -->
	<div class="row_wrap">
		<select id="page_count">
			<option value="5">5개</option>
			<option value="10">10개</option>
			<option value="20">20개</option>
			<option value="50">50개</option>
			<option value="100">100개</option>
		</select>
	</div>
</section>

<section>
	<article class="list_wrap">
		<div class="condition_wrap">
			<!-- 분류 리스트 -->
			<div class="cate_slide slim_scroll">
				<div class="cate_wrap flex">
					<input id='caAll' type='radio' name='pl_pc_idx' value='caAll' checked>
					<label for='caAll'>전체</label>
				</div>
			</div>
		</div>
		
		<!-- 시설 테이블 -->
		<table>
			<tbody class="pl_list flex flexWrap">
				<tr><td></td></tr>
			</tbody>
		</table>
		<ul id="paging">
		</ul>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		<form id="commonForm" name="commonForm"></form>
	</article>
</section>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
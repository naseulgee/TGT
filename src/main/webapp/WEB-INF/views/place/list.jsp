<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/list.css"/>
<script src="/resources/js/paging/searchPaging_B.js"></script>
<script src="/resources/js/place/list.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1 class="txt_center">우리동네 시설 보기</h1>
<section class="search_wrap">
	<i class="fa-solid fa-magnifying-glass"></i>
	<input type="text" id="subKeyword" name="subKeyword" placeholder="지역/시설명/메뉴명 중 검색해주세요">
</section>
<section class="flex">
	<article class="list_wrap">
		<!-- 분류 리스트 -->
		<div class="cate_wrap"></div>
		
		<!-- 시설 테이블 -->
		<table>
			<tbody class="pl_list">
			</tbody>
		</table>
		<ul id="paging">
		</ul>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		<form id="commonForm" name="commonForm"></form>
	</article>
	<article class="map_wrap"></article>
</section>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
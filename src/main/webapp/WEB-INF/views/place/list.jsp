<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/form.css"/>
<script src="/resources/js/place/form.js"></script>
<script src="/resources/js/common/daum_address.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1 class="txt_center">우리동네 시설 보기</h1>
<section class="search_wrap">
	<button type="button" onclick=""><i class="fa-solid fa-magnifying-glass"></i><span class="displaynone">검색</span></button>
	<input type="text" name="" value="" placeholder="어디를 가고싶개?">
</section>
<section class="flex">
	<article class="list_wrap">
		지역 셀렉트<br>
		분류 라디오<br>
		시설 테이블
	</article>
	<article class="map_wrap"></article>
</section>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
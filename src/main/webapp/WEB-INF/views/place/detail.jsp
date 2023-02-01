<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/form.css"/>
<script src="/resources/js/common/daum_address.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1 class="txt_center">${detail.place.PL_NAME}</h1>
<button class="use_move btn" data-href="/place/modifyForm.paw" onclick="move(this, 'pl_idx:${detail.place.PL_IDX}', 'ph_board_type:place')">수정</button>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
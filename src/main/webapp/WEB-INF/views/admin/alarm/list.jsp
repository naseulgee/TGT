<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/alarm/admin_list.css"/>
<script src="/resources/js/paging/searchPaging_B.js"></script>
<script src="/resources/js/alarm/admin_alarm.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1>알람 관리</h1>
<section class="btn_wrap">
	<a class="btn submit" href="/admin/alarm/write.paw">알람 등록</a>
	<input type="button" class="btn" value="선택 알람 수정" onclick="">
	<input type="button" class="btn warn" value="선택 알람 삭제" onclick="">
</section>
<section>
	<table>
		<thead>
			<tr>
				<th class="check"><input type="checkbox" onclick="check_toggle()"></th>
				<th class="idx">알람 번호</th>
				<th class="target">발송 대상</th>
				<th class="content">알람 내용</th>
				<th class="link">연결 링크</th>
			</tr>
		</thead>
		<tbody id="admin_al_list">
		</tbody>
	</table>
	<ul id="paging">
	</ul>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
</section>
</main><!-- //main 종료 -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
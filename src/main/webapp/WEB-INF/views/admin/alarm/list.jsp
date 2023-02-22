<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/alarm/admin_list.css"/>
<script src="/resources/js/paging/searchPaging_B.js"></script>
<script src="/resources/js/alarm/admin_alarm.js"></script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
<h1>알람 관리</h1>
<p class='info_warn'>회원 전체에게 발송되는 알람입니다.</p>
<p class='info_warn'>실시간으로 발송된 팝업 알람은 내용이 변경되지 않습니다!</p>
<section class="btn_wrap">
	<a class="btn submit" href="/admin/alarm/write.paw">알람 등록</a>
	<input type="button" class="btn" value="선택 알람 수정" onclick="modi_form()">
	<input type="button" class="btn warn" value="선택 알람 삭제" onclick="del()">
</section>
<section class="al_list_wrap">
	<table>
		<thead>
			<tr>
				<th class="check"><label><input type="checkbox" onclick="check_toggle(this)">알람 번호</label></th>
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
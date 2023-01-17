<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<c:if test="${page != 'admin'}">
	<!-- 어드민 제외한 모든 페이지의 헤더 -->
	<%@ include file="/WEB-INF/include/user-header.jspf" %>
</c:if>
<c:if test="${page == 'admin'}">
	<!-- 어드민 페이지의 헤더 -->
	<%@ include file="/WEB-INF/include/admin-header.jspf" %>
</c:if>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<style>
.fa-solid {
color:#f0b1aa;
}

.color {
font-size:20px;
font-weight:bold;
}

.main_list{
padding-right:100px;
}

.cate_list{

}
</style>
<main class="layoutCenter">

	<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
<div class="flexCenter">
	
	<!-- 카드 테이블로 게시글 리스트 출력 -->
	<div class="main_list">
		<c:choose>
			<c:when test="${!empty list}">
				<table class="card_table row1">
					<tbody class="bgSubColor">
						<c:forEach items="${list}" var="to">
							<!-- tr클래스 클릭시 상세보기 페이지로 이동-->
							<tr class="use_move" data-href="/together/detail.paw" onclick="move(this,'TO_IDX:${to.TO_IDX}')">
								<td class="color"><span class="fa-solid fa-paw"></span>[${to.TO_TC_NAME}] ${to.TO_TITLE }</td><!-- 글분류, 제목 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(견종): ${to.TO_BR_NAME }</td><!-- 참여가능견종 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(크기) : <c:if test="${to.TO_WT_IDX eq '1'}">XS</c:if>
								<c:if test="${to.TO_WT_IDX eq '2'}">S</c:if>
								<c:if test="${to.TO_WT_IDX eq '3'}">M</c:if>
								<c:if test="${to.TO_WT_IDX eq '4'}">L</c:if>
								<c:if test="${to.TO_WT_IDX eq '5'}">XL</c:if>
									</td><!-- 참여가능사이즈 -->
								<td><span class="fa-solid fa-bone"></span> 언제개: ${to.TO_DATE }</td><!-- 모임날짜 -->
								<td><span class="fa-solid fa-bone"></span> 몇시개: ${to.TO_TIME }</td><!-- 모임시간 -->
								<td><span class="fa-solid fa-bone"></span> 몇명이개: ${to.TO_JOIN_PEOPLE }/${to.TO_PEOPLE}</td><!-- 참여인원/모임인원 -->
								<td class="txt_right" style="font-size:15px;">${to.TO_REG_DATE }</td><!-- 등록날짜 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			
			<c:otherwise>
				<table>
					<tbody>
						<tr>
							<td class="empty paw_hover">게시글이 없습니다:(</td>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	
	<br/>
	
	<!-- 카테고리별 게시글 리스트 출력, 글쓰기 버튼 -->
	<div class="cate_button">
		<ul>
			<li><a class="btn submit" href="/together/writeForm.paw">글쓰기</a>
			<li><input type="submit" class="btn" value="산책하개">
			<li><input type="submit" class="btn" value="카페가개">
			<li><input type="submit" class="btn" value="놀러가개">
			<li><input type="submit" class="btn" value="친구하개">
		</ul>
	</div>
</div>	
</main>

<c:if test="${page != 'admin'}">
	<!-- 풋터. 모든 페이지에 삽입! -->
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</c:if>
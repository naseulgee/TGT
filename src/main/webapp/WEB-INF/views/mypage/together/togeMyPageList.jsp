<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link href="/resources/css/together/togethermypagelist.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>

<main class="layoutCenter">
<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
<br/>

	<div class="cate_wrap">
	
	<!-- 23.02.08 박선영 카드 테이블로 참여게시글 리스트 출력 -->
	<div class="main_list">
	<h1 class="txt_center"><span class="fa-solid fa-paw" style="color:#f0b1aa;"></span>함께해요<span class="fa-solid fa-paw" style="color:#f0b1aa;"></span></h1>
	<br/>
		<c:choose>
			<c:when test="${!empty list}">
				<table class="card_table" id="together_list">
					<tbody class="flexCenter">
						<c:forEach items="${list}" var="to">
							<!-- tr클래스 클릭시 상세보기 페이지로 이동-->
							<tr class="use_move" data-href="/together/detail/${to.TO_IDX}.paw" onclick="move(this,'TO_IDX:${to.TO_IDX}')" id="togetherDetail">
								<td class="color"><span class="fa-solid fa-paw"></span>[${to.TO_TC_NAME}] ${to.TO_TITLE } 
								<!-- 현재날짜에 따른 모집여부변경 -->
								<c:if test="${nowDate > to.TO_DATE }">
									<span class="btn warn">마감</span>
								</c:if>
								<c:if test="${nowDate < to.TO_DATE }">
									<c:if test="${to.C eq to.TO_PEOPLE}">
										<span class="btn submit">모집완료</span>
									</c:if>
									<c:if test="${to.C < to.TO_PEOPLE}">
										<span class="btn submit">모집중</span>
									</c:if>
								</c:if>
								</td><!-- 글분류, 제목 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(견종): ${to.BR_NAME }</td><!-- 참여가능견종 -->
								<td><span class="fa-solid fa-bone"></span> 참여가능하개(크기) : <c:if test="${to.TO_WT_IDX eq '1'}">XS</c:if>
								<c:if test="${to.TO_WT_IDX eq '2'}">S</c:if>
								<c:if test="${to.TO_WT_IDX eq '3'}">M</c:if>
								<c:if test="${to.TO_WT_IDX eq '4'}">L</c:if>
								<c:if test="${to.TO_WT_IDX eq '5'}">XL</c:if>
									</td><!-- 참여가능사이즈 -->
								<td><span class="fa-solid fa-bone"></span> 언제개: ${to.TO_DATE}</td><!-- 모임날짜 -->
								<td><span class="fa-solid fa-bone"></span> 몇시개: ${to.TO_TIME }</td><!-- 모임시간 -->
								<td><span class="fa-solid fa-bone"></span> 몇명이개: ${to.C}/${to.TO_PEOPLE}<!-- 참여인원/모임인원 -->
								<td class="txt_right" style="font-size:15px;">${to.TO_REG_DATE }</td><!-- 등록날짜 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when> 

			<c:otherwise>
			<table id="not_together">
					<tbody>
						<tr>
							<td class="empty paw_hover">참여글이 없습니다:(</td>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</main>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>
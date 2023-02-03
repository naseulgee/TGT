<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<style>

#phIcon,#stars {
	display: inline-block;
}

#stars {
	font-size : 30px;
}

#place {
	font-size : 20px;
}

#place, #contents, #phIcon,#regDate {
	color : #b8bfc4;
}

#ppp {
	line-height : 1.2;
}


img {
	border-radius : 15px;
	height : 100%;
}

</style>


<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
		<div class="main_wrap txt_center">
		
		<h1>나의 리뷰</h1>
		<div class="color">${mem_id}님의 리뷰페이지입니다:)</div><br><br>

	<c:if test="${!empty reviewList}">
	<table>
		<tbody>
			<c:forEach items="${reviewList}" var="i" varStatus="status">
			<tr >
				<td width="80%">
					<div id="regDate" class="txt_right">
							<fmt:formatDate value="${i.RE_REG_DATE}" pattern="yy.MM.dd" /> 
					</div>
				
					<div class="pp flexBetween">
						<!-- 시설사진 : 일단 임시사진표시 -->
						<div id="photo">
							<img src="https://www.dailypop.kr/news/photo/202207/61411_118467_5044.jpg" width="180" alt="시설썸네일">
						</div>
						
						<div class="txt_left">
							<p id="ppp">
							<!-- 시설명 -->
							<span id="place" >${i.PL_NAME}&nbsp;|&nbsp;</span>
							
			    			<!-- 별점 -->
			    			<c:forEach var="j" begin="1" end="${i.RE_STAR}">
		   						<i class="fa-solid fa-paw color" id="stars"></i>
							</c:forEach>
							<c:forEach var="j" begin="1" end="${5-i.RE_STAR}">
		   						<i class="fa-solid fa-paw subColor" id="stars"></i>
							</c:forEach>&nbsp; 
							</p>
							<br>
							
							<!-- 후기내용 -->
							<span id="contents">
								<c:choose>
			       					 <c:when test="${fn:length(i.RE_CONTENTS) gt 51}">
			        					${fn:substring(i.RE_CONTENTS, 0, 50)}...
			        				</c:when>
			        				<c:otherwise> ${i.RE_CONTENTS} </c:otherwise>
								</c:choose>		
								<!-- 사진후기 -->		
								<c:if test="${i.PHCOUNT>0}">
									<i class="fa-solid fa-image" id="phIcon"></i>
								</c:if>
							</span> &nbsp;&nbsp;
							<a class="use_move btn slim" href="/mypage/review/detail.paw" 
							onclick="move(this, 're_idx:${i.RE_IDX}', 'ph_board_type:review')">
							더보기</a>
						</div>
						
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						
					</div>					
				</td>	
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>
	
	<c:if test="${empty reviewList}">
		<br><br>
		<div class="center">
			🤔<br>작성하신 리뷰가 없어요
		</div>
	</c:if>
	
	<br><br>
		</div>
</main><!-- //main 종료 -->

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>		

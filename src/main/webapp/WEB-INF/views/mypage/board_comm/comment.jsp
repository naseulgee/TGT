<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


          <i class="fa-solid fa-bone"> &nbsp;&nbsp; ${mem_id} 님이 쓴 댓글</i>
 
 		

       
        <div id="comment-list">
            <div class="container">
            <table class="board-table" id="board_list">
			<tr>
				<th>댓글번호</th>
				<th>게시글 번호</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
                <tbody class="board">
							<c:choose>
								<c:when test="${fn:length(myPageComment) > 0}">
									<c:forEach items="${myPageComment}" var="myPageComment">
										 <tr align="center" class="use_move" data-href="/board/detail.paw" onclick="move(this,'BC_IDX:${myPage.BC_IDX}')">
											<td>${myPageComment.RNO }</td>
											<td>${myPageComment.BNO}</td>
											<td>${myPageComment.CONTENT }</td>
											<td>${myPageComment.REGDATE }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
                </tbody>
            </table>
            <br>
            <br>
        <br>
</div>
</div>

  --%>
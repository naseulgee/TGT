<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/user-header.jspf"%>
	<link href="/resources/css/board_comm/board_comm_list.css"
		  rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/board_comm/toastr.css"
		  integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
		  crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="/resources/js/board_comm/toastr.min.js"
			integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
						<table class="board-table">
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list }" var="row">
										<tr align="center" class="use_move"
											data-href="/board/detail.paw"
											onclick="move(this,'BC_IDX:${row.BC_IDX}')">
											<td width="5%">${row.BC_IDX }</td>
											<td width="15%">${row.BC_BCC_NAME }</td>
											<td width="45%">${row.BC_TITLE }</td>
											<td width="5%">${row.BC_READHIT }</td>
											<td width="10%">${row.BC_WRITER_ID }</td>
											<td width="10%"><fmt:formatDate
													value="${row.BC_MOD_DATE}" pattern="yyyy-MM-dd" /></td>
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

</html>

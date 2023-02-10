<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/js/paging/searchPaging_B.js"></script>

<table id="board_list">
    <tbody class="board">
  
    <c:choose>
        <c:when test="${fn:length(list) > 0}">
            <c:forEach items="${list }" var="row">
                <tr align="center" class="use_move"
                    data-href="/board/detail/${row.BC_IDX}.paw" onclick="move(this,'BC_IDX:${row.BC_IDX}')">
                    <td width="8%">${row.BC_IDX }</td>
                    <td width="8%">${row.BC_BCC_NAME }</td>
                    <td width="54%">${row.BC_TITLE }</td>
                    <td width="10%">${row.BC_READHIT }</td>
                    <td width="10%">${row.BC_WRITER_NAME }</td>
                    <td width="10%"><fmt:formatDate value="${row.BC_MOD_DATE}" pattern="yyyy-MM-dd"/></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="4">조회된 결과가 없습니다.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    <input type="hidden" id="PAGE_INDEX_B" name="PAGE_INDEX_B"/>
    </tbody>
    <br/>
</table>


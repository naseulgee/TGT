<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
    span.fa-solid {
        color: #f0b1aa;
    }

    #wtreg.btn.submit {
        margin-right: 5px;
    }
</style>
<main class="layoutCenter">
    <h1>회원정보 관리</h1>
    <br/>
    <div class="main_wrap">
        <select id="search-filter">
            <option>반려견</option>
            <option>아이디</option>
        </select><input type="text" id="search-value">
        <div class="btn submit" id="search">검색하기</div>
        <table class="txt_center">
            <thead>
            <tr>
                <th>아이디</th>
                <th>이메일주소</th>
                <th>강아지이름</th>
                <th>견종명</th>
                <th>등록날짜</th>
                <th>탈퇴여부</th>
            </tr>
            </thead>
            <tbody id="itemList">
            <%--            <c:choose>--%>
            <%--                <c:when test="${!empty memberlist}">--%>
            <%--                    <c:forEach items="${memberlist}" var="row">--%>
            <%--                        <tr onclick="location.href = '/admin/modifyMemberInfo?id=${row.MEM_ID}'" style="cursor:pointer">--%>
            <%--                            <td>${row.MEM_ID}</td>--%>
            <%--                            <td>${row.MEM_EMAIL}</td>--%>
            <%--                            <td>${row.MEM_DOG_NAME}</td>--%>
            <%--                            <td>--%>
            <%--                                <c:choose>--%>
            <%--                                <c:when test="${!empty row.MEM_BR_NAME}">${row.MEM_BR_NAME}</c:when>--%>
            <%--                                <c:otherwise>${row.BR_NAME}</c:otherwise>--%>
            <%--                                </c:choose>--%>
            <%--                            </td>--%>
            <%--                            <td>${row.MEM_REG_DATE}</td>--%>
            <%--                            <td>${row.MEM_DEL_GB}</td>--%>
            <%--                        </tr>--%>
            <%--                    </c:forEach>--%>
            <%--                </c:when>--%>
            <%--                <c:otherwise>--%>
            <%--                    <tr>--%>
            <%--                        회원이 존재하지 않습니다.--%>
            <%--                    </tr>--%>
            <%--                </c:otherwise>--%>
            <%--            </c:choose>--%>
            </tbody>
        </table>
        <ul class="paging">

        </ul>
    </div>
    <br/>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>

<script>

    function onClick(memID) {
        location.href = '/admin/modifyMemberInfo?id=' + memID
    }

    window.addEventListener('load', function () {
        let currentPage = 1;
        let pageSize = 10;
        let totalPages = 1;

        function loadItems(page, searchParam) {
            let url = '/admin/getMembers?' + page + '&size=' + pageSize
            if (searchParam){
                url += searchParam
            }
            fetch(url)
                .then(function (response) {
                    if (response.ok) {
                        return response.json();
                    }
                    throw new Error('network error');
                })
                .then(function (data) {
                    totalPages = data.totalPages;
                    currentPage = data.page;
                    let pageList = data.pageList;
                    let itemList = data.memberList;

                    let pageHtml = '<ul>';
                    if (currentPage > 1) {
                        pageHtml += '<li><a href="#" data-page="1" class="first"></a></li>';
                        pageHtml += '<li><a href="#" data-page="' + (currentPage - 1) + '" class="before">이전</a></li>';
                    }
                    pageList.forEach(function (value) {
                        pageHtml += '<li><a href="#" data-page="' + value + '">' + value + '</a></li>';
                    });
                    if (currentPage < totalPages) {
                        pageHtml += '<li><a href="#" data-page="' + (currentPage + 1) + '" class="next">다음</a></li>';
                        pageHtml += '<li><a href="#" data-page="' + totalPages + '" class="end">끝</a></li>';
                    }
                    pageHtml += '</ul>';
                    document.getElementById('itemList').innerHTML = ""


                    itemList.forEach(function (value) {
                        let itemHtml = '';
                        let tr = document.createElement("tr")
                        tr.onclick = function () {
                            location.href = "/admin/modifyMemberInfo?id=" + value.MEM_ID
                        }
                        tr.style.cssText = "cursor:pointer"

                        itemHtml += '<td>' + value.MEM_ID + '</td>';
                        itemHtml += '<td>' + value.MEM_EMAIL + '</td>';
                        itemHtml += '<td>' + value.MEM_DOG_NAME + '</td>';
                        if (value.MEM_BR_NAME) {
                            itemHtml += '<td>' + value.MEM_BR_NAME + '</td>';
                        } else {
                            itemHtml += '<td>' + value.BR_NAME + '</td>';
                        }
                        itemHtml += '<td>' + value.MEM_REG_DATE + '</td>';
                        itemHtml += '<td>' + value.MEM_DEL_GB + '</td>';
                        // itemHtml += '</tr>';
                        tr.innerHTML = itemHtml
                        document.getElementById('itemList').appendChild(tr)
                    });

                    document.querySelector('.paging').innerHTML = pageHtml;
                    // document.getElementById('itemList').innerHTML = itemHtml;
                })
                .catch(function (error) {
                    console.error('error:', error);
                });
        }

        loadItems(currentPage);
        const findUser = () => {
            const filter = document.querySelector("#search-filter")
            const param = document.querySelector("#search-value")

            let searchParam
            if (filter.value == "반려견") {
                searchParam = "&dogname=" + param.value
            } else {
                searchParam = "&id=" + param.value
            }
            loadItems(1, searchParam)
            // window.location.assign(`/admin/adminMember?` + searchParam)
        }
        document.addEventListener('click', function (event) {
            if (event.target.matches('.paging a')) {
                let page = parseInt(event.target.dataset.page);
                loadItems(page);
            }
            if (event.target.matches('#search')) {
                findUser()
            }
        });
    });

</script>
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
    <h1>견종 관리</h1>
    <br/>
    <div class="main_wrap">
        <table class="txt_center">
            <thead>
            <tr>
                <th>견종번호</th>
                <th>견종명</th>
            </tr>
            </thead>
            <tbody id="itemList">
            </tbody>
        </table>
        <a class="btn submit" href="/admin/dogname.paw" style="float: right; margin: 10px">견종추가</a>
        <ul class="paging">
        </ul>
    </div>
    <br/>
</main>


<script>

    function onClick(memID) {
        location.href = '/admin/modifyDogname?id=' + memID
    }

    window.addEventListener('load', function () {
        let currentPage = 1;
        let pageSize = 10;
        let totalPages = 1;

        function loadItems(page) {
            fetch('/admin/getDognames?page=' + page + '&size=' + pageSize)
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
                    let itemList = data.dogList;

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
                            location.href = "/admin/modifyDogname?id=" + value.BR_IDX
                        }
                        tr.style.cssText = "cursor:pointer"

                        itemHtml += '<td>' + value.BR_IDX + '</td>';
                        itemHtml += '<td>' + value.BR_NAME + '</td>';
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

        document.addEventListener('click', function (event) {
            if (event.target.matches('.paging a')) {
                let page = parseInt(event.target.dataset.page);
                loadItems(page);
            }
        });
    });

</script>
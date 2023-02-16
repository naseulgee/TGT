<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="/resources/js/paging/searchPaging_B.js"></script>
<link href="/resources/css/board_comm/board_comm_list.css" rel="stylesheet">
      
<main class="layoutCenter">
    <body>
    <section class="notice">
        <div class="page-title">
            <div class="container">
            <br>
            <center><h4><a href="/admin/board_comm/list.paw">멍멍왈왈 게시판 관리</a></h4></center>
            <br>
            </div>
        </div>
        <!-- board seach area -->
        <div id="board-search">
            <div class="container">
                
              <div class="search-window">
                        <div class="search-wrap">
                            <input type="text" class="txt" placeholder="제목이나 내용을 검색하세요"
                                   name="subKeyword" id="subKeyword" value="${subKeyword}"
                                   style="width: 530px; height: 38px;"/>&nbsp; 
                                   <input type="button" value="검색" class="btn submit" onclick="fn_selectBoardList(1)"/>
                        </div>
                    <div></div>
                </div>
            </div>
        </div>
        <!-- board list area -->
        <div id="board-list">
            <div class="container">
            <table class="board-table" id="board_list">
                <thead>
                <div class="tab_radio">
                    <input type="radio" id="a" name="BC_BCC_NAME" value="전체게시판" checked><label for="a">전체게시판</label>
                    <input type="radio" id="b" name="BC_BCC_NAME" value="자유게시판"><label for="b">자유게시판</label>
                    <input type="radio" id="c" name="BC_BCC_NAME" value="정보게시판"><label for="c">정보게시판</label>
                    <input type="radio" id="d" name="BC_BCC_NAME" value="긴급실종유기견"><label for="d">긴급실종유기견</label>
                    <input type="radio" id="f" name="BC_BCC_NAME" value="자원봉사구해요"><label for="f">자원봉사구해요</label>
                </div>
                </thead>
			<tr>
				<th width="8%">글번호</th>
				<th width="8%">카테고리</th>
				<th width="54%">제목</th>
				<th width="12%">작성자</th>
				<th width="8%">조회수</th>
				<th width="10%">작성일</th>
			</tr>
                <tbody class="board">
                </tbody>
            </table>
            
            <br> 
            
            <a href="/board/writeForm.paw" class="btn submit" style="float: right">글쓰기</a>
            </div>
           	 	<div id="PAGE_NAVI_B"></div>
            		<input type="hidden" id="PAGE_INDEX_B" name="PAGE_INDEX_B"/>
            			<form id="commonForm" name="commonForm"></form>
        </div>
        <br>
    </section>
    </body>
</main>

<script>
	/* 페이징 처리 */
    $(document).ready(function () {
        fn_selectBoardList(1, '전체게시판');
    });

    function fn_selectBoardList(pageNo, BC_BCC_NAME='전체게시판') {
        var comAjax = new ComAjax();

        comAjax.setUrl("<c:url value='/admin/pagingBoard/list.paw' />");
        comAjax.setCallback("fn_selectBoardListCallback");

        comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX_B").val());
        comAjax.addParam("PAGE_ROW", 10);
        
        comAjax.addParam("BC_BCC_NAME", BC_BCC_NAME);
        
        comAjax.addParam("subKeyword", $("#subKeyword").val()); 
        
        
        comAjax.ajax();

    }

    function fn_selectBoardListCallback(data) {
        var total = data.TOTAL_B;

        var body = $(".board");
        body.empty(data.TOTAL_B);


        if (total == 0) {
            var str = "<tr align='center'>"
                + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>";
            body.append(str);

        } else {
            var params = {
                divId: "PAGE_NAVI_B",
                pageIndex: "PAGE_INDEX_B",
                totalCount: total,
                eventName: "fn_selectBoardList",
            };
            gfn_renderPaging_B(params);
           
            var str = "";
            $.each(data.list, function (key, value) {
            	str += "<tr class='use_move' data-href='/admin/board/detail/"+value.BC_IDX+".paw' onclick=\"move(this,\'BC_IDX:"+value.BC_IDX+"\')\"> "
                + "<td>" + value.BC_IDX + "</td>"
                + "<td>" + value.BC_BCC_NAME + "</td>"
                    + "<td>" + value.BC_TITLE + "</td>"
                    + "<td>" + value.BC_WRITER_NAME + "</td>"
                    + "<td>" + value.BC_READHIT + "</td>"
                    + "<td>" + value.BC_MOD_DATE + "</td>"
                    + "</tr>";
            });
            body.append(str);

        }

    }
    
    /* 카테고리 이동 함수 */
    $("input:radio[name='BC_BCC_NAME']").on('click', function () {
    	
        var BC_BCC_NAME = $(this).val();
        fn_selectBoardList(1, BC_BCC_NAME)

    });
    
    /* 등록 완료 후 이벤트 처리 */
    $(function () {

        if ('${success}') {
            toastr.success('${success}');
        }
        if ('${warning}') {
            toastr.warning('${warning}');
        }
        if ('${info}') {
            toastr.info('${info}');
        }
        if ('${error}') {
            toastr.info('${error}');
        }

    });
</script>

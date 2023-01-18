<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/place/form.css"/>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main id="cate_list" class="layoutCenter">
	<div class="add_here">
		<button class="btn submit" type="button" onclick="cate_add(this);">분류 등록하기</button>
	</div>
	<ul>
		<%-- <c:forEach var="i" begin="0" end="14">
			<li><a href="#ㄱ">${uni}</a></li>
		</c:forEach> --%>
	</ul>
	<table>
		<thead>
			<th>분류 번호</th>
			<th>분류 이름</th>
			<th>수정/삭제</th>
		</thead>
		<tbody>
			<c:forEach var="list" items="${cate_list}">
				<tr>
					<td class="idx">${list.PC_IDX}</td>
					<td class="name">${list.PC_NAME}</td>
					<td class="btn_wrap">
						<input class="btn" type="button" value="수정" onclick="cate_modi(this)">
						<input class="btn warn" type="button" value="삭제" onclick="cate_del(this)">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="add_here">
		<button class="btn submit" type="button" onclick="cate_add(this);">분류 등록하기</button>
	</div>
</main>
<script>
	//분류 추가/수정 취소 시 원래대로 돌리는 폼
	function cancel(){
		//수정중인 대상 변수에 세팅
		let here = $(".edit");
		if(here.hasClass("add")){
			here[0].outerHTML = "<div class='add_here'>"
				+"<button class='btn submit' type='button' onclick='cate_add(this);'>분류 등록하기</button>"
				+"</div>";
		}
		if(here.hasClass("modi")){
			here[0].classList = "";
			here.children(".name").html(here.find(".name input").attr("data-before"));
			here.children(".btn_wrap").html("<input class='btn' type='button' value='수정' onclick='cate_modi(this)'> "
						+"<input class='btn warn' type='button' value='삭제' onclick='cate_del(this)'>");
		}
	}
	//분류 추가 함수
	function cate_add(target){
		//이미 추가중인 함수가 있다면 수정하지 않기
		if($(".edit").length > 0) cancel();
		//클릭한 버튼 위치 내용 수정
		target = $(target).parent();
		target.addClass("edit add flexCenter");//클래스명 추가
		target.html("<div class='name'>"
				+"<input type='text' name='pc_name' placeholder='분류명을 입력해주세요'>"
			+"</div>"
			+"<div class='btn_wrap'>"
				+"<input value='반영' type='button' class='btn submit' onclick='cate_edit(1)'/> "
				+"<input value='취소' type='button' class='btn' onclick='cancel()'/>"
			+"</div>");
	}
	//분류 수정 함수
	function cate_modi(target){
		//이미 추가중인 함수가 있다면 수정하지 않기
		if($(".edit").length > 0) cancel();
		target = $(target).parent("td");
		let idx = $(target).siblings(".idx").text();
		let name = $(target).siblings(".name");
		target.parent("tr").addClass("edit modi");
		name.html("<input type='text' name='pc_name' data-before='"+name.text()+"' value='"+name.text()+"'>");
		target.html("<input value='반영' type='button' class='btn submit' onclick='cate_edit(2)'/> "
			+"<input value='취소' type='button' class='btn' onclick='cancel()'/>");
	}
	//분류 삭제 함수
	function cate_del(target){
		if(!confirm("정말 해당 분류를 삭제하시겠습니까?")) return;
		$(target).closest("tr").addClass("edit del");
		cate_edit(3);
	}
	function cate_edit(target){
		let idx = $(".edit .idx"); idx = isNull(idx)?0:idx.text();
		let name = $(".edit .name input"); name = isNull(name)?0:name.val();
		let _url = "/admin/place";
		if(target == 1) _url += "/cate/write.paw";//등록
		if(target == 2) _url += "/cate/modify";//수정
		if(target == 3) _url += "/cate/delete";//삭제
		
		$.ajax({
			url: "/admin/place/cate/write.paw",
			type: "POST",
			data: {pc_idx:0, pc_name:"aa"},
			dataType: 'json',
			processData: false,//무조건 지정
			contentType: false,//무조건 지정
			success: function(result){
				console.log(result);
			},
			error: function(result){
				console.log(result.status);
				console.log(result.responseText);
				console.log(result.error);
			}
		});
	}
</script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>
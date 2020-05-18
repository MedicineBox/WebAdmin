<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, medicine.*"%>

<jsp:useBean id="medi" scope="application" class="medicine.DBConnect"/>
<jsp:setProperty property="*" name="medicine"/>

<style>
/* 의약품 정보 관리 */
.medicineimg{
	width: 50px;
}
.medi_add {
	color: #4BBF6A;
	font-size: 30px;
	cursor: pointer;
}
</style>

<%
ArrayList<Medi> datas = (ArrayList<Medi>)medi.getMediList();
%>
<div class="tab-pane" id="medi" role="tabpanel" aria-labelledby="medi-tab">
	<div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
		<nav class="navbar">
			<a class="navbar-brand">의약품 목록
				<button class="btn medi_add" data-target="#mediaddModal" data-toggle="modal"><i class="fas fa-plus-circle"></i></button>
			</a>
			
			<form class="form-inline">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</nav>
		<br>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">사진</th>
					<th scope="col">의약품명</th>
					<th scope="col">보관</th>
					<th scope="col">검색</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<%
				for(Medi me : (ArrayList<Medi>) datas) {
				%>
				<tr>
					<td scope="row" id="num"><%=me.getMedi_num()%></td>
					<td><img src="img/<%=me.getMedi_photo()%>" id="photo" class="medicineimg"></td>			
					<td id="name"><%=me.getMedi_name() %></td>
					<td id="effect" style="display: none;"><%=me.getMedi_effect() %></td>
					<td id="use" style="display: none;"><%=me.getMedi_use() %></td>
					<td id="store"><%=me.getMedi_store() %>회</td>
					<td id="search"><%=me.getMedi_search() %>회</td>
					<td><input type="submit" class="btn btn-outline-success" value="수정" onclick="editFunction()" data-target="#updateModal" data-toggle="modal"></td>
				</tr>
				<%
				}
				%>
				<!-- <tr>
					<th scope="row">p3</th>
					<td><img alt="p3" src="img/p3.png" class="medicineimg"></td>
					<td>구바파정</td>
					<td>2회</td>
					<td>8회</td>
					<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#updateModal" data-toggle="modal"></td>
				</tr> -->
			</tbody>
		</table>
		<!-- 
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">></a></li>
		</ul>
		-->
	</div>
</div>

<!-- 의약품 정보 추가 모달 -->
<form method="post" action="admin_control.jsp?action=mediAdd" enctype="multipart/form-data">
	<div class="modal fade" role="dialog" id="mediaddModal" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">의약품 정보 추가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">의약품명</label>
						<input type="text" class="form-control col-sm-8" id="medi_name" name="medi_name">
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">의약품 사진</label>
						<input type="hidden" class="upload-name" disabled="disabled">
						<input type="file" class="form-control col-sm-7 upload-hidden" id="medi_photo" name="medi_photo">
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">효능·효과</label>
						<input type="text" class="form-control col-sm-8" id="medi_effect" name="medi_effect">
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">용법·용량</label>
						<input type="text" class="form-control col-sm-8" id="medi_use" name="medi_use">
					</div>
				</div>
				
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="확인">
					<input type="button" class="btn btn-secondary" data-dismiss="modal" value="취소">
				</div>
			</div>
		</div>
	</div>
</form>

<!-- 의약품 정보 수정 모달 -->
<form method="post" action="admin_control?action=mediUpdate.jsp">
	<div class="modal fade" role="dialog" id="updateModal" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">의약품 정보 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">일련번호</label>
						<input type="text" class="form-control col-sm-8" id="medi_e_num" name="medi_e_num" readonly>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">의약품명</label>
						<input type="text" class="form-control col-sm-8" id="medi_e_name" name="medi_e_name" value="">
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">의약품 사진</label>
						<label class="col-sm-1"><img class="medicineimg" id="medi_e_photo"></label>
						<input type="hidden" class="upload-name" disabled="disabled">
						<input type="file" class="form-control col-sm-7 upload-hidden" id="medi_photo" name="medi_photo">
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">효능·효과</label>
						<input type="text" class="form-control col-sm-8" id="medi_e_effect" name="medi_e_effect">
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">용법·용량</label>
						<input type="text" class="form-control col-sm-8" id="medi_e_use" name="medi_e_use">
					</div>
				</div>
				
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="확인">
					<input type="button" class="btn btn-secondary" data-dismiss="modal" value="취소">
				</div>
			</div>
		</div>
	</div>
</form>

<script>
//사진첨부
$(document).ready(function(){
	var fileTarget = $('.upload-hidden');

	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
		var filename = $(this)[0].files[0].name; 
		}
		else { // old IE 
		var filename = $(this).val().split('/').pop().split('\\').pop(); //파일명만 추출
	}

		// 추출한 파일명 삽입
		$(this).siblings('.upload-name').val(filename);
	});
});

//수정 모달창으로 값 넘겨주기
function editFunction() {	
	var num = document.getElementById("num").childNodes[0].nodeValue;
	var name = document.getElementById("name").childNodes[0].nodeValue;
	var effect = document.getElementById("effect").childNodes[0].nodeValue;
	var use = document.getElementById("use").childNodes[0].nodeValue;
	var photo = document.getElementById("photo").getAttribute('src');
	console.log(photo);
	
	$("#medi_e_num").val(num);
	$("#medi_e_name").val(name);
	$("#medi_e_effect").val(effect);
	$("#medi_e_use").val(use);
	$("#medi_e_photo").attr("src",photo);
	
}

</script>
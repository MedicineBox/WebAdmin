<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<tr>
					<th scope="row">p3</th>
					<td><img alt="p3" src="img/p3.png" class="medicineimg"></td>
					<td>구바파정</td>
					<td>2회</td>
					<td>8회</td>
					<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#updateModal" data-toggle="modal"></td>
				</tr>
				<tr>
					<th scope="row">p2</th>
					<td><img alt="p2" src="img/p2.png" class="medicineimg"></td>
					<td>오메가3</td>
					<td>2회</td>
					<td>12회</td>
					<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#updateModal" data-toggle="modal"></td>
				</tr>
				<tr>
					<th scope="row">p1</th>
					<td><img alt="p1" src="img/p1.png" class="medicineimg"></td>
					<td>비타민C</td>
					<td>6회</td>
					<td>23회</td>
					<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#updateModal" data-toggle="modal"></td>
				</tr>
				<tr>
					<th scope="row">o2</th>
					<td><img alt="p3" src="img/o2.png" class="medicineimg"></td>
					<td>노스카나 겔</td>
					<td>10회</td>
					<td>4회</td>
					<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#updateModal" data-toggle="modal"></td>
				</tr>
				<tr>
					<th scope="row">o1</th>
					<td><img alt="o1" src="img/o1.png" class="medicineimg"></td>
					<td>후시딘 연고</td>
					<td>16회</td>
					<td>4회</td>
					<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#medicineModal" data-toggle="modal"></td>
				</tr>
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
<form method="post" action="medicineadd.jsp">
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
						<label for="ps_title" class="col-sm-3 col-form-label">의약품명</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">의약품 사진</label>
						<label class="col-sm-1"><img src="img/p3.png" class="medicineimg"></label>
						<input type="file" class="form-control col-sm-7" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">효능·효과</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">용법·용량</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
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
<form method="post" action="medicineupdate.jsp">
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
						<label for="ps_title" class="col-sm-3 col-form-label">일련번호</label>
						<label for="ps_title" class="col-sm-8 col-form-label">p3</label>
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">의약품명</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">의약품 사진</label>
						<label class="col-sm-1"><img src="img/p3.png" class="medicineimg"></label>
						<input type="file" class="form-control col-sm-7" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">효능·효과</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">용법·용량</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.navbar-brand {
	font-size: 2em;
}
</style>

<div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
	<nav class="navbar">
		<a class="navbar-brand">사용자 목록</a>
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</nav>
	<br>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">비밀번호</th>
				<th scope="col">휴대폰 번호</th>
				<th scope="col">디바이스 일련번호</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">yoo123</th>
				<td>유효은</td>
				<td>*********</td>
				<td>01011112222</td>
				<td>abc000</td>
				<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#userModal" data-toggle="modal"></td>
			</tr>
			<tr>
				<th scope="row">park5678</th>
				<td>박상도</td>
				<td>*********</td>
				<td>01033334444</td>
				<td>abc134</td>
				<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#userModal" data-toggle="modal"></td>
			</tr>
			<tr>
				<th scope="row">shin0981</th>
				<td>신지현</td>
				<td>*********</td>
				<td>01055556666</td>
				<td>abc547</td>
				<td><input type="submit" class="btn btn-outline-success" value="수정" data-target="#userModal" data-toggle="modal"></td>
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

<!-- 사용자 정보 수정 모달 -->
<form method="post" action="userupdate.jsp">
	<div class="modal fade" role="dialog" id="userModal" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">사용자 정보 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">아이디</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">이름</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">비밀번호</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">휴대폰 번호</label>
						<input type="text" class="form-control col-sm-8" id="ps_title" name="ps_title">
					</div>
					<div class="form-group row">
						<label for="ps_title" class="col-sm-3 col-form-label">디바이스 일련번호</label>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab">
	<div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
		<div class="page-header">
			<h2>검색어 목록</h2>
		</div>
		<br>
		<h6>사용자의 검색어 중 DB에 없어 API를 이용하여 검색된 리스트입니다.<br>DB에 의약품 정보를 추가해 주세요.</h6>
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
					<th scope="row">2</th>
					<td><img alt="" src="img/alt.png" class="medicineimg"></td>
					<td>루테인</td>
					<td>3회</td>
					<td>3회</td>
					<td><input type="submit" class="btn btn-outline-success" value="추가" data-target="#addModal" data-toggle="modal"></td>
				</tr>
				<tr>
					<th scope="row">1</th>
					<td><img alt="p2" src="img/alt.png" class="medicineimg"></td>
					<td>미네랄 영양제</td>
					<td>1회</td>
					<td>7회</td>
					<td><input type="submit" class="btn btn-outline-success" value="추가" data-target="#addModal" data-toggle="modal"></td>
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
<form method="post" action="add.jsp">
	<div class="modal fade" role="dialog" id="addModal" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">의약품 정보 추가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
						<label for="ps_title">의약품명</label>
						<input type="text" class="form-control" id="ps_title" name="ps_title">
					</div>
					<div class="form-group">
						<label for="ps_title">의약품 사진</label>
						<input type="file" class="form-control">
					</div>					
					<div class="form-group">
						<label for="ps_title">효능·효과</label>
						<textarea class="form-control" rows="3"></textarea>
					</div>
					
					<div class="form-group">
						<label for="ps_title">용법·용량</label>
						<textarea class="form-control" rows="3"></textarea>
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
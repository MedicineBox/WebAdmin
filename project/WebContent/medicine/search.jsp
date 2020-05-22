<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id ="";
try {
	id = (String)session.getAttribute("id");
	
	if (id != null) {
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medicine Box</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<style>
.main {
	width: 100%;
}

.page {
	margin-right: 100px;
}

.medicineimg{
	width: 50px;
}
</style>

</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>

    $(document).ready(function () {

        $('#search').addClass('menu_active');

    });

</script>

<div class="main">
	<jsp:include page="inc_header.jsp" flush="false" />
	<div class="row page">
		<div class="col-3">
			<jsp:include page="inc_menu.jsp" flush="false" />
		</div>

		<div class="col-9">
			<nav class="navbar">
				<h3>검색어 목록</h3>
			</nav>
			<h6>사용자의 검색어 중 DB에 없어 API를 이용하여 검색된 리스트입니다.DB에 의약품 정보를 추가해 주세요.</h6>
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
						<td><img alt="" src="img/none.png" class="medicineimg"></td>
						<td>루테인</td>
						<td>3회</td>
						<td>3회</td>
						<td><input type="submit" class="btn btn-outline-success" value="추가" data-target="#addModal" data-toggle="modal"></td>
					</tr>
					<tr>
						<th scope="row">1</th>
						<td><img alt="p2" src="img/none.png" class="medicineimg"></td>
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

</body>
</html>

<% 
	} else {
		response.sendRedirect("index.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
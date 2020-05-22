<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, medicine.*"%>

<%
String id ="";
try {
	id = (String)session.getAttribute("id");
	
	if (id != null) {
		
%>
<jsp:useBean id="medi" scope="application" class="medicine.DBConnect"/>
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

</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>

    $(document).ready(function () {

        $('#user').addClass('menu_active');

    });

</script>
<%
String tempPage = request.getParameter("page");
int cPage = 0;

// cPage(현재 페이지 정하기)
if (tempPage == null || tempPage.length() == 0) {
    cPage = 1;
}
try {
    cPage = Integer.parseInt(tempPage);
} catch (NumberFormatException e) {
    cPage = 1;
}

int totalRows = medi.getUserTotalRows();

int len = 5;
int totalPages = totalRows % len == 0 ? totalRows / len : (totalRows / len) + 1;
if (totalPages == 0) {
    totalPages = 1;
}
if (cPage > totalPages) {
    cPage = 1;
}
int start = (cPage - 1) * 5;
int end = cPage * 5;

ArrayList<User> datas = (ArrayList<User>)medi.getUserList(start, end);
%>

<div class="main">
	<jsp:include page="inc_header.jsp" flush="false" />
	<div class="row page">
		<div class="col-3">
			<jsp:include page="inc_menu.jsp" flush="false" />
		</div>

		<div class="col-9">
		
			<nav class="navbar">
				<h3>사용자 목록</h3>
			
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
						<th scope="col">알림설정</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
				<%
	          if (datas.size() != 0) {
	        	  
					for(User us : (ArrayList<User>) datas) {
					%>
					<tr>
						<td scope="row" id="id"><%=us.getUser_id()%></td>		
						<td id="name"><%=us.getUser_name() %></td>
						<td id="pwd"><%=us.getUser_pwd() %></td>
						<td id="phone"><%=us.getUser_phone() %></td>
						<td id="device"><%=us.getUser_device() %></td>
						<td id="alarm"><%=us.getUser_alarm() %></td>
						<td><input type="submit" class="btn btn-outline-success" value="수정" onclick="editFunction(<%=me.getMedi_num()%>,'<%=me.getMedi_name() %>','img/<%=me.getMedi_photo()%>','<%=me.getMedi_effect() %>','<%=me.getMedi_use() %>')" data-target="#updateModal" data-toggle="modal"></td>
					</tr>
					<%
					}
	          } else {
	        	  %>
	        	  <tr>
					<td scope="row">데이터가 존재하지 않습니다.</td>
				</tr>
				<%
	          }
					%>
				</tbody>
			</table>
	
	<%
	//페이지 처음과 끝을 지정하는 부분
	int currentBlock = cPage % totalPages == 0 ? cPage / totalPages : (cPage / totalPages) + 1;
	int startPage = (currentBlock - 1) * totalPages + 1;
	int endPage = startPage + totalPages - 1;
	//마지막 페이지 묶음에서 총 페이지수를 넘어가면 끝 페이지를 마지막 페이지 숫자로 지정
	if (endPage > totalPages) {
	 endPage = totalPages;
	}
	
	
	%>
			<!-- 페이징 -->
			<ul class="pagination justify-content-center">
				<%
				if (startPage == 1) {
				%>
					<li class="page-item disabled">
						<a class="page-link" href="#" tabindex="-1" aria-disabled="true">
							<
						</a>
					</li>
				<%
				} else {
				%>
					<li class="page-item">
						<a class="page-link" href="medi.jsp?page=<%=startPage - 1%>" tabindex="-1" aria-disabled="true">
							<
						</a>
					</li>
				<%
				}
				%>
				<%
				for (int i = startPage; i <= endPage; i++) {
				%>
					<li class="page-item">
						<a class="page-link" href="medi.jsp?page=<%=i %>">
							<%=i%>
						</a>
					</li>
				<%
				}
				%>
				<%
				// 마지막 페이지 숫자와 startPage에서 pageLength 더해준 값이 일치할 때(즉 마지막 페이지 블럭일 때)
				if (totalPages == endPage) {
				%>
					<li class="page-item disabled">
						<a class="page-link" href="#">
							>
						</a>
					</li>
				<%
				} else {
				%>
				<li class="page-item">
					<a class="page-link" href="medi.jsp?page=<%=endPage + 1%>">
						>
					</a>
				</li>
				<%
				}
				%>
			</ul>

		</div>
	</div>
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
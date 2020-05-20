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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css"
	integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<style>
.logo {
	width: 250px;
	height: auto;
}

.menu {
	background-color: #4BBF6A;
	height: 100%;
	width: 250px;
	position: fixed;
	z-index: 0;
	left: 0;
}

.content {
	margin-left: 20%;
	margin-right: 5%;
	max-width: 90%;
	min-width: 200px;
}

.menuitem {
	color: white;
}

.admin {
	margin-left: 70%;
}

.navbar {
	padding-left: 0px;
	padding-right: 0px;
}
</style>

</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<script type="text/javascript">
    // 로그아웃 담당 JSP로 이동
    function logoutPro(){
        location.href="logout.jsp";
    }
</script>

	<!-- Nav tabs -->
	<div>
		<img alt="logo" src="img/medicinebox.png" class="logo">
		<label class="admin"><%=id %>님</label>
		<input type="button" class="btn btn-secondary" value="로그아웃" onclick="logoutPro()">
	</div>
	<ul class="nav nav-tabs flex-column menu" id="myTab" role="tablist" style="padding: 0px; background-color: #4BBF6A;">
		<li class="nav-item" style="margin-top: 10px;">
			<a class="nav-link active menuitem" id="chart-tab" data-toggle="tab" href="#chart" role="tab" aria-controls="chart" aria-selected="true">
				데이터 시각화
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link menuitem" id="user-tab" data-toggle="tab" href="#user" role="tab" aria-controls="user" aria-selected="false">
				사용자 정보 관리
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link menuitem" id="medi-tab" data-toggle="tab" href="#medi" role="tab" aria-controls="medi" aria-selected="false">
				의약품 정보 관리
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link menuitem" id="search-tab" data-toggle="tab" href="#search" role="tab" aria-controls="search" aria-selected="false">
				사용자 검색어 조회
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link menuitem" id="setting-tab" data-toggle="tab" href="#setting" role="tab" aria-controls="setting" aria-selected="false">
				비밀번호 변경
			</a>
		</li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content content">
		
		<!-- 데이터 시각화 -->
		<jsp:include page="inc_chart.jsp" flush="false" />

		<!-- 사용자 정보 관리 -->
		<jsp:include page="inc_user.jsp" flush="false" />

		<!-- 의약품 정보 관리 -->
		<jsp:include page="inc_medi.jsp" flush="false" />

		<!-- 사용자 검색어 조회 -->
		<jsp:include page="inc_search.jsp" flush="false" />
		
		<!-- 비밀번호 변경 -->
		<jsp:include page="inc_setting.jsp" flush="false" />
	</div>

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
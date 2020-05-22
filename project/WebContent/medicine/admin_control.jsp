<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, medicine.*"%>

<%@ page import="javax.naming.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="medi" scope="application" class="medicine.DBConnect"/>
<jsp:useBean id="admin" class="medicine.Admin" />
<jsp:setProperty property="*" name="admin"/>

<%
String action = request.getParameter("action");

// 로그인
if(action.equals("login")) {
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	
	int check = medi.loginCheck(id, pw);
	if(check == 1){
		session.setAttribute("id",id);
		response.sendRedirect("chart.jsp");
	} else if (check == 0) {%>
		<script> 
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
		</script>
	<%	
	} else {
	%>
		<script> 
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
		</script>
	<%
	}
}


//비번변경
else if(action.equals("setting")) {
	String id = request.getParameter("id");
	String oldPw = request.getParameter("oldPasswd");
	String newPw = request.getParameter("newPasswd");
	String newPw2 = request.getParameter("newPasswd2");
	
	int check = medi.passwdCheck(id, oldPw);
	
	if(newPw.equals(newPw2)) {
		if(check == 1){
			boolean edit = medi.passwdEdit(id, newPw);
			if (edit == true) {%>
				<script> 
				alert("비밀번호가 변경되었습니다. 재로그인 하시기 바랍니다.");
				location.href="index.jsp";
				</script>
				<% session.invalidate();
			}
			
		} else {%>
			<script> 
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
			</script>
		<%	
		}	
	} else {
		%>
		<script> 
		alert("새 비밀번호가 다릅니다.");
		history.go(-1);
		</script>
		<%
	}
}


// 의약품 추가
else if (action.equals("mediAdd")) {
	//String dir= "C:/Dev/WebAdmin/project/WebContent/medicine/img";
	String realFolder = "";
	String filename1 = ""; 
	String savefile = "img"; 
	String path = session.getServletContext().getRealPath("medicine/img");

	int max = 20*1024*1024;
	MultipartRequest m = null;

	String file = null;

	String ofile = null;


	try {
		
		m = new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());

		file = m.getFilesystemName("medi_photo");

	 	ofile = m.getOriginalFileName("medi_photo");
			
			
	} catch(Exception e) {
		out.println(e);
	}


	String medi_name = m.getParameter("medi_name");
	String medi_effect = m.getParameter("medi_effect");
	String medi_use = m.getParameter("medi_use");

	boolean insertMedi = medi.insertMedi(medi_name, ofile, medi_effect, medi_use);
	
	if (insertMedi == true) {%>
		<script> 
		alert("의약품 정보가 추가 되었습니다.");
		location.href="medi.jsp";
		</script>
		<%
	} else {
		%>
		<script> 
		alert("추가 실패");
		history.go(-1);
		</script>
		<%
	}

}

// 의약품 수정
else if (action.equals("mediEdit")) {
	int num = Integer.parseInt(request.getParameter("medi_num"));
	//System.out.println(num);
	Medi me = medi.getMedi(num);
	request.setAttribute("me", me);
	pageContext.forward("medi_edit.jsp");
	
}

%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cos.jar 멀티파티업로드 처리</title>
</head>
<body>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	//프로젝트 내 만들어질 폴더를 저장할 이름 변수 선언
	String realFolder = "";
	//실제 만들어질 폴더명 설정
	String saveFolder = "upload";
	//한글 설정
	String encType = "utf-8";
	//저장항 파일 사이즈 설정
	int maxSize =  1024*1024*5; //5메가
	//파일이 저장될 경로값을 알아오는 객체
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	try {
	//클라이언트로부터 넘어온 데이터를 저장해주는 객체
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, // cos,jar가 없으면 사용안됨, 서드파티이기 때문에 api가 시키는대로 코딩
			new DefaultFileRenamePolicy()); //같은 파일명 업로드시 파일이름 변경 처리하는 객체 생성자
%>
	파일의 이름 : [<%=multi.getParameter("name") %>]
			
<%
	//브라우저에 경로 출력(테스트용)
	out.println(realFolder);

	}catch(Exception e){
		e.printStackTrace();
	}
%>	






</body>
</html>
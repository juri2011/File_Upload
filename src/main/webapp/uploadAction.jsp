<%@page import="file.FileDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100; //100M까지만 가능
		String encoding = "UTF-8";
		//동일한 이름의 파일을 저장할 때 저장할 파일의 이름을 바꾸는 정책을 사용(덮어씌우는 정책도 있다)
		//이 예제에서는 모든 파일을 업로드하지만, 원래는 파일의 확장자를 제한하기 위해 시큐어코딩을 사용한다(보안성)
		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding,
													new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		new FileDAO().upload(fileName, fileRealName);
		out.write("파일명: "+fileName + "<br>");
		out.write("실제파일명: "+fileRealName + "<br>");
		
	%>
</body>
</html>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="file.FileDAO"%>
<%@page import="file.FileDTO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드</title>
</head>
<body>
<%
	/*
		String directory = "D:/kdt_juri/jsp/upload";
		String files[] = new File(directory).list();
		
		for(String file : files){
			out.write("<a href=\""+request.getContextPath() + "/downloadAction?file="+
			java.net.URLEncoder.encode(file,"UTF-8") + "\">" + file + "</a><br>");
		}
	*/
	
	List<FileDTO> fileList = new FileDAO().getList();
	
	for(FileDTO file : fileList){
		out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
			URLEncoder.encode(file.getFileRealName(), "UTF-8") + "\">" +
				file.getFileName() + "(다운로드 횟수: " + file.getDownloadCount() + ")</a><br>");
	}
	
	//실제로 다운로드를 해도 새로고침을 하지 않으면 조회수가 바뀌지 않는다.
	//javascript에서 이벤트 발생 시 reload를 시키는 방법을 사용하면 해결
	//react를 사용하면 편리하게 해결할 수 있다.
%>
</body>
</html>
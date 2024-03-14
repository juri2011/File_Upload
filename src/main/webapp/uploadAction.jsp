<%@page import="java.util.Enumeration"%>
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
		/* 서버와 전혀 상관 없는 곳에 폴더 생성하고 관리 */
		String directory = "D:/kdt_juri/jsp/upload";
		int maxSize = 1024 * 1024 * 100; //100M까지만 가능
		String encoding = "UTF-8";
		
		//동일한 이름의 파일을 저장할 때 저장할 파일의 이름을 바꾸는 정책을 사용(덮어씌우는 정책도 있다)
		//이 예제에서는 모든 파일을 업로드하지만, 원래는 파일의 확장자를 제한하기 위해 시큐어코딩을 사용한다(보안성)
		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding,
													new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasMoreElements()){
			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
		String fileRealName = multipartRequest.getFilesystemName(parameter);
		
		if(fileName == null) continue; // 파일을 선택하지 않은 항목에 대해서는 pass
		// 특정 파일만 불러 올 수 있고 그 외에 파일은 불러와도 바로 삭제됨.
		if(!fileName.endsWith(".gif") && !fileName.endsWith(".png") &&
			!fileName.endsWith(".jpg") && !fileName.endsWith(".txt")){
			File file = new File(directory + fileRealName);
			file.delete();
			out.write("업로드할 수 없는 확장자입니다.");
		}else{
			new FileDAO().upload(fileName, fileRealName);
			out.write("파일명: " + fileName + "<br>");
			out.write("실제파일명: " + fileRealName + "<br>");
		}			
	}
		/*
		
		
		
		Enumeration fileNames = multipartRequest.getFileNames();
		while(fileNames.hasMoreElements()){
			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
		String fileRealName = multipartRequest.getFilesystemName(parameter);
			
			
		if(fileName == null) continue; // 파일을 선택하지 않은 항목에 대해서는 pass
			// 특정 파일만 불러 올 수 있고 그 외에 파일은 불러와도 바로 삭제됨.
			if(!fileName.endsWith(".gif") && !fileName.endsWith(".png") &&
				!fileName.endsWith(".jpg") && !fileName.endsWith(".txt")){
				File file = new File(directory + fileRealName);
				file.delete();
				out.write("업로드할 수 없는 확장자입니다.");
			}else{
				new FileDAO().upload(fileName, fileRealName);
				out.write("파일명: " + fileName + "<br>");
				out.write("실제파일명: " + fileRealName + "<br>");
			}			
		}
		
		*/
	%>
</body>
</html>
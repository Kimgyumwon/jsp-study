package ch07.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/fileuploadProcess")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,   
    maxRequestSize = 1024 * 1024 * 50
)



public class FileuploadProcessServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	public FileuploadProcessServlet() {
		super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 파일명 처리를 위해 추가
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		String uploadPath = "D:/newfile";
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		
		Part filePart = request.getPart("uploadFile");
		
		String fileName = filePart.getSubmittedFileName();
		String contentType = filePart.getContentType();
		long fileSize = filePart.getSize();
		
		Collection<Part> fileParts = request.getParts();
		
		
		for (Part part : fileParts) {
			if (part.getName().startsWith("uploadFile")) {
				UUID uuid = UUID.randomUUID();
				String fileName1 = part.getSubmittedFileName();
				int num = fileName1.indexOf(".");
				String fileName2 = fileName1.substring(num);
				
				String uuidStr = uuid.toString()+fileName2;
				part.write(uploadPath + File.separator + uuidStr);
				out.println("업로드된 파일" +  ": " + fileName1 + "<br>");
			}
		}
		out.println("<h2>업로드 성공(Servlet 3.0 표준)</h2>");
        out.println("<h3>업로드 결과</h3>");
        out.println("<p>이름: " + name + "</p>");
        out.println("<p>제목: " + subject + "</p>");
        out.println("<p>파일명: " + fileName + "</p>");
        out.println("<p>콘텐츠 유형: " + contentType + "</p>");
        out.println("<p>파일 크기: " + fileSize + " bytes</p>");
        out.println("<p>서버 저장 경로: " + uploadPath + "</p>");
	}
}
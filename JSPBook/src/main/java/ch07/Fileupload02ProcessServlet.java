package ch07;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

/**
 * Servlet implementation class Fileupload01ProcessServlet
 */
@WebServlet("/fileupload02Process")
// 서블릿 3.0에서 도입된 파일 업로드(멀티파트 요청) 처리를 위한 어노테이션
// 이걸 선언하면 multipart/form-data 형식의 요청(파일 업로드 폼 전송)을 정상적으로 파싱 가능
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,   // 메모리 임시 저장 임계값(1MB) -> 이 크기 초과 시 디스크에 임시 저장
    maxFileSize = 1024 * 1024 * 10,        // 업로드 최대 파일 크기(10MB)
    maxRequestSize = 1024 * 1024 * 50      // 전체 요청 크기(50MB)
)
// 동작 구조 이해
// Servlet 3.0 파일 업로드는 내부적으로 다음 순서로 처리됨
// 1. 사용자가 <input type="file">로 파일을 업로드함
// 2. 서버(Tomcat 등)는 multipart 요청을 파싱함
// 3. 업로드된 파일을 일단 임시로 저장함 (<-- 이때 메모리 또는 디스크 중 한 곳에 저장)
// 4. 이후 Part.write()를 호출하면 최종 위치로 복사
// 참고로 3단계의 임시 저장 위치를 결정하는 기준이 바로 fileSizeThreshold
public class Fileupload02ProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fileupload02ProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		// 서블릿이 클라이언트(브라우저)에게 HTML 응답을 직접 출력하기 위해 사용하는 객체
		
		// 1. 업로드 경로 설정(2가지 경로 실습)
		// getServletContext(): 현재 웹 애플리케이션의 환경 정보를 제공하는 컨텍스트 객체를 반환
		// getRealPath("/"): 서버의 실제 디렉터리 위치의 "/" 루트 경로를 반환
		// D:\gonikim\jsp\jsp-study-gonikim\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MyWebProject\
		// String uploadPath = getServletContext().getRealPath("/upload");
		// 웹 프로젝트 안(webapp 폴더 아래)에 폴더 생성
		// 장점: 정적 리소스(예: 이미지)에 바로 접근 가능
		// 단점: 서버 재시작 시 초기화
		
		// 외부 폴더(절대 경로 사용 권장)
		String uploadPath = "D:/upload";
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		// 2-1. 일반 데이터 가져오기
		String name = request.getParameter("name1");
		String subject = request.getParameter("subject1");
		
		String name2 = request.getParameter("name2");
		String subject2 = request.getParameter("subject2");
		
		String name3 = request.getParameter("name3");
		String subject3 = request.getParameter("subject3");
		
		// 2-2. 여러 개의 파일 데이터 가져오기
		// 서블릿 3.0 표준 API 사용
		// Part: 업로드된 파일 또는 폼 데이터를 표현하는 객체
		Part filePart = request.getPart("uploadFile");
//		한 번에 가져오기
		Collection<Part> fileParts = request.getParts();
//		폼에 포함된 모든 입력 양식 요소를 가져옴
		
		int fileCount = 1;
		for (Part part : fileParts) {
//			파일만 필터링 - 방법1
			if (part.getName().startsWith("uploadFile")) {
				String fileName = part.getSubmittedFileName(); // 원본 파일 이름
				part.write(uploadPath + File.separator + fileName); // 파일 저장
				out.println("업로드된 파일" + fileCount + ": " + fileName + "<br>");
				fileCount++;
			}
		}
//		(참고) multiple 속성을 사용하여 하나의 input으로 여러 개의 파일을 업로드 시
//		같은 name(예: uploadFiles)으로 서버에 전송됨
//		getParts()로 모든 Part를 받고, 파일 항목들을 순회하면서 저장
		
		
		String fileName = filePart.getSubmittedFileName(); // 원본 파일 이름
		String contentType = filePart.getContentType(); // MIME 타입
		long fileSize = filePart.getSize(); // 파일 크기(byte)
		
		
		
		// 4. 결과 출력
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

package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.DBUtil;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 * Servlet implementation class ProcessAddBookservlet
 */
@WebServlet("/processUpdateBook")
@MultipartConfig (
	fileSizeThreshold = 1024 * 1024 * 1,
	maxFileSize = 1024 * 1024 * 10,   
	maxRequestSize = 1024 * 1024 * 50
)
public class ProcessUpdateBookservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        // ==== 일반 텍스트 데이터 처리 ====
        String bookId = request.getParameter("bookId");
        String name = request.getParameter("name");
        String unitPrice = request.getParameter("unitPrice");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String releaseDate = request.getParameter("releaseDate");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String unitsInStock = request.getParameter("unitsInStock");
        String condition = request.getParameter("condition");

        int price = 0;
        if (unitPrice != null && !unitPrice.isEmpty()) {
            price = Integer.parseInt(unitPrice);
        }

        long stock = 0;
        if (unitsInStock != null && !unitsInStock.isEmpty()) {
            stock = Long.parseLong(unitsInStock);
        }
        
        // ==== 파일 업로드 처리 ====
        Part filePart = request.getPart("bookImage");
        String fileName = null;
        
        if (filePart != null && filePart.getSize() > 0) {
//			파일 이름 가져오기
        	fileName = filePart.getSubmittedFileName();
        	
        	String uploadPath = "D:/upload";
        	
        	
        	
        	File uploadDir = new File(uploadPath);
        	if(!uploadDir.exists()) {
        		uploadDir.mkdirs();
        	}
        	filePart.write(uploadPath + File.separator + fileName);
		}
        
        // 도서 등록 처리 DB 연동
        Connection conn = null;
        PreparedStatement pstmt = null;
        // 공통 메소드로 커넥션 획득
        conn = DBUtil.getConnection();
        
        String sql = "UPDATE book SET b_id = ?, b_name = ?, b_unitPrice = ?, b_author = ?, b_description = ?, b_publisher = ?, b_category = ?, b_unitsInStock = ?, b_releaseDate = ?, b_condition = ?, b_fileName = IFNULL(?, b_fileName) "
        		 	 +"WHERE b_id = ?";
        try {
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, bookId);
        	pstmt.setString(2, name);
        	pstmt.setInt(3, price);
        	pstmt.setString(4, author);
        	pstmt.setString(5, description);
        	pstmt.setString(6, publisher);
        	pstmt.setString(7, category);
        	pstmt.setLong(8, stock);
        	pstmt.setString(9, releaseDate);
        	pstmt.setString(10, condition);
        	pstmt.setString(11, fileName);
        	pstmt.setString(12, bookId);
        	pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		} finally {
			DBUtil.close(pstmt,conn);
		}
        
//      수정 후 도서 편집 페이지로 리다이렉트
        response.sendRedirect("editBook.jsp?edit=update");
		
	}


}

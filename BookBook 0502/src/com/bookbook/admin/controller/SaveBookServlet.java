package com.bookbook.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.admin.service.AdminBookService;
import com.bookbook.book.domain.BookDTO;
import com.bookbook.bookdetail.domain.BookDetailDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import oracle.sql.BLOB;

/**
 * @version 1.0
 * @author 정광수
 * @biref book_detail_registeration.jsp 에서 등록 버튼 눌렀을때 접근 됨 이미지 업로드가 필요하기에
 *        MultipartRequest 사용
 * @see 성공할시 book_detail_registeration.jsp로 다시 이동
 */
@WebServlet("/SaveBookServlet")
public class SaveBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminBookService bookService = new AdminBookService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("save 들어왔어");

		try {
			
			String saveDir=request.getServletContext().getRealPath("/bookimg");
			int maxSize=1024*1024*10;//100M
			String encoding="UTF-8";
			MultipartRequest m =new MultipartRequest(request, saveDir, maxSize,encoding, new DefaultFileRenamePolicy());
			
			

			
			
			String isbn = m.getParameter("isbn");
			String book_name = m.getParameter("book_name");
			String author = m.getParameter("author");
			String publisher = m.getParameter("publisher");
			String publish_date = m.getParameter("publish_date");
			String bookPage = m.getParameter("page_num");
			String price = m.getParameter("price");
			File book_img_file = m.getFile("book_img");
			String imgName=m.getFilesystemName("book_img");
			String bookCategoryCode = m.getParameter("book_category_code");
			//String bookCategoryName = m.getParameter("category_name");
			String inventory = m.getParameter("inventory");

			String bookDescription = m.getParameter("book_description");
			bookDescription=bookDescription.replaceAll("<", "&lt;");
			String authorDescription = m.getParameter("author_description");
			authorDescription=authorDescription.replaceAll("<", "&lt;");
			String indexDescription = m.getParameter("index_description");
			indexDescription=indexDescription.replaceAll("<", "&lt;");
			

			String findExtensionArr[]= book_img_file.getName().split(".");
			String dataType=".jpg";
			
			for(int i=0;i<findExtensionArr.length;i++){
				System.out.println(findExtensionArr[i]);
				if(findExtensionArr[i].toLowerCase().equals("png")){dataType=".png";}
				else if(findExtensionArr[i].toLowerCase().equals("jpg")){dataType=".jpg";}
				else if(findExtensionArr[i].toLowerCase().equals("gif")){dataType=".gif";}
				else if(findExtensionArr[i].toLowerCase().equals("bmp")){dataType=".bmp";}
			}
			
			

		     // 원본이 업로드된 절대경로와 파일명를 구한다.
		    /*String  fullFileName = saveDir + "\\" + book_img_file.getName();
		    System.out.println("파일경로 +이름 :"+fullFileName);
		    System.out.println("datatype"+dataType);
		   */ 
			String  fullFileName = saveDir + "\\" + book_img_file.getName();
			File existingfile = new File(fullFileName);
		    
			String newPath=saveDir + "/" +isbn+dataType;
		    File newFile =new File(newPath);
		     
		    int read = 0;
		    byte[] buf = new byte[1024];
		    FileInputStream fin = null;
		    FileOutputStream fout = null;


		    if(!existingfile.renameTo(newFile)){
		    	 // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
		    	 
	            buf = new byte[1024];
	            fin = new FileInputStream(existingfile);
	            fout = new FileOutputStream(newFile);
	            read = 0;
	            while((read=fin.read(buf,0,buf.length))!=-1){
	                fout.write(buf, 0, read);
	            }

	            fin.close();
	            fout.close();
	            existingfile.delete();

		    }

		     
			
/*			System.out.println("isbn"+isbn);
			System.out.println("book_name"+book_name);
			System.out.println("publisher"+publisher);
			System.out.println("publish_date"+publish_date);
			System.out.println("bookPage"+bookPage);
			System.out.println("book_img"+imgName);
			System.out.println("bookCategoryCode"+bookCategoryCode);
			//System.out.println("bookCategoryName"+bookCategoryName);
			System.out.println("inventory"+inventory);
			System.out.println("책설명:" + bookDescription);
			System.out.println("저자설명:" + authorDescription);
			System.out.println("목차설명:" + indexDescription);
			*/
			BookDTO bookDto = new BookDTO(isbn, book_name, author, publisher, publish_date, Integer.parseInt(bookPage),
					Integer.parseInt(price), isbn+dataType, bookCategoryCode, Integer.parseInt(inventory),
					"Y");

			BookDetailDTO bookDetailDto = new BookDetailDTO(bookDto, bookDescription, authorDescription,
					indexDescription);

			bookService.saveBook(bookDetailDto);
			response.sendRedirect("admin/book_detail_registeration.jsp");
		} catch (Exception e) {
		e.printStackTrace();
			//response.sendRedirect("admin/500.html");
		}

	}

}

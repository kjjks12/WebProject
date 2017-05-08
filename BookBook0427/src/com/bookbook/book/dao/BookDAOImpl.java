package com.bookbook.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bookbook.book.action.PageAction;
import com.bookbook.book.domain.BookDTO;
import com.bookbook.util.db.DBUtil;



public class BookDAOImpl implements BookDAO {

	@Override
	public int getTotalRecord(String keyField, String keyWord) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;	
		int result=0;
        String sql="select count(*) from book ";
        
        try{
         
        	if(keyWord != null && !keyWord.equals("") && !keyWord.equals("null")) {
             sql += " WHERE " + keyField.trim() +" LIKE '%"+keyWord.trim()+"%'";
        	}
         
          con = DBUtil.getConnection();
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();
          if(rs.next()) result = rs.getInt(1); 
           
        }catch (Exception e) {
        	e.printStackTrace();
            System.out.println(e+"=> getTotalRecord fail");
        }finally{
            DBUtil.dbClose(con, ps, rs);
        }
               
        return result;
	}

	@Override
	public List<BookDTO> getBookList(int pageNum, String keyField, String keyWord) {
		Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
		List<BookDTO> list = new ArrayList<>();
        String sql = "SELECT ROWNUM , book_code,book_title,book_author,book_price from(select * from book order by book_title)";
        
         try{
        	 
            if(keyWord != null && !keyWord.equals("") && !keyWord.equals("null")) {
                sql += " WHERE " + keyField.trim() +" LIKE '%"+keyWord.trim()+"%'";
            }
            
            //��ü���ڵ�� ��������
            int totalCount = this.getTotalRecord(keyField, keyWord);
            
            //PageAction���� ���������� ���� �����ϱ�
            PageAction.keyField = keyField;
            PageAction.keyWord = keyWord;
            PageAction.pageNum = pageNum;
            
            //���������� ���Ѵ�.
           PageAction.pageCount = (int)Math.ceil(((double)totalCount/PageAction.pageSize));
            
           //������ ��ȣ�� �ش��ϴ� �Խù��� ������ ���Ѵ�. (������������ȣ-1) * pageSize+1
           int absolute = (pageNum-1) * PageAction.pageSize + 1;
          
          
           con = DBUtil.getConnection();
           //Ư�������  ���ڵ带 �������� ���ؼ� �ɼ� ����
           ps =  con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE ,
                                    ResultSet.CONCUR_UPDATABLE);
           
           rs = ps.executeQuery();
      
           if(rs.next()){
             rs.absolute(absolute);//Ŀ���� Ư�� ��ġ�� �̵���Ų��.
            
             int count=0;
             while(count < PageAction.pageSize){
                 BookDTO dto = new BookDTO();
                 
                 String bookCode = rs.getString(2);
                 String bookTitle = rs.getString(3);
                 String bookAuthor = rs.getString(4);
                 int bookPrice = rs.getInt(5);
                  
                  list.add(new BookDTO(bookCode, bookTitle, bookAuthor, bookPrice));
                  
                  if(rs.isLast()) break;
                  else rs.next();
                  
                  count++;
             }//while����
              
           }//if����
          
          
        }catch (Exception e) {
           System.out.println(e+"=> getBookList fail");
       }finally{
           DBUtil.dbClose(con, ps, rs);
       }
      
       return list;
	}

	@Override
	public List<BookDTO> selectAll() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * from book order by book_date";
		List<BookDTO> list = new ArrayList<>();
		
		try{
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				String bookCode = rs.getString(1);
				String bookTitle = rs.getString(2);
				String bookAuthor = rs.getString(3);
				String bookDate = rs.getString(5);
				int bookPrice = rs.getInt(7);
				

				
				list.add(new BookDTO(bookCode, bookTitle, bookAuthor, bookPrice, bookDate));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(con, ps, rs);
		}
		return list;
	}


}
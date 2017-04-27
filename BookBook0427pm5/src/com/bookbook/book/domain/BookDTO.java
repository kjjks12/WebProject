package com.bookbook.book.domain;

public class BookDTO {
   /**�����ڵ�*/
   private String bookCode;
   /**��������*/
   private String bookTitle;
   /**���� ����*/
   private String bookAuthor;
   /**���ǻ�*/
   private String bookPublisher;
   /**������*/
   private String bookDate;
   /**��������*/
   private int bookPage;
   /**����*/
   private int bookPrice;
   /**����ǥ��*/
   private String bookCover;
   /**�з��ڵ�*/
   private String bookCategoryCode;
   /**�о��ڵ�*/
   private String bookCategoryName;
   /**������*/
   private int bookInventory;

   private String bookUsed;
   
   public BookDTO() {
      super();
   }

   public BookDTO(String bookCode, String bookTitle, String bookAuthor, String bookPublisher, String bookDate,
         int bookPage, int bookPrice, String bookCover, String bookCategoryCode, String bookCategoryName,
         int bookInventory, String bookUsed) {
      super();
      this.bookCode = bookCode;
      this.bookTitle = bookTitle;
      this.bookAuthor = bookAuthor;
      this.bookPublisher = bookPublisher;
      this.bookDate = bookDate;
      this.bookPage = bookPage;
      this.bookPrice = bookPrice;
      this.bookCover = bookCover;
      this.bookCategoryCode = bookCategoryCode;
      this.bookCategoryName = bookCategoryName;
      this.bookInventory = bookInventory;
      this.bookUsed = bookUsed;
   }
   
   public BookDTO(String bookCode, String bookTitle, String bookAuthor, int bookPrice) {
	      super();	     
	      this.bookCode = bookCode;
	      this.bookTitle = bookTitle;
	      this.bookAuthor = bookAuthor;
	      this.bookPrice = bookPrice;
	   }

   public BookDTO(String bookCode, String bookTitle, String bookAuthor, int bookPrice, String bookDate) {
	      super();	     
	      this.bookCode = bookCode;
	      this.bookTitle = bookTitle;
	      this.bookAuthor = bookAuthor;
	      this.bookPrice = bookPrice;
	      this.bookDate = bookDate;
	   }


   public String getBookCode() {
      return bookCode;
   }

   public void setBookCode(String bookCode) {
      this.bookCode = bookCode;
   }

   public String getBookTitle() {
      return bookTitle;
   }

   public void setBookTitle(String bookTitle) {
      this.bookTitle = bookTitle;
   }

   public String getBookAuthor() {
      return bookAuthor;
   }

   public void setBookAuthor(String bookAuthor) {
      this.bookAuthor = bookAuthor;
   }

   public String getBookPublisher() {
      return bookPublisher;
   }

   public void setBookPublisher(String bookPublisher) {
      this.bookPublisher = bookPublisher;
   }

   public String getBookDate() {
      return bookDate;
   }

   public void setBookDate(String bookDate) {
      this.bookDate = bookDate;
   }

   public int getBookPage() {
      return bookPage;
   }

   public void setBookPage(int bookPage) {
      this.bookPage = bookPage;
   }

   public int getBookPrice() {
      return bookPrice;
   }

   public void setBookPrice(int bookPrice) {
      this.bookPrice = bookPrice;
   }

   public String getBookCover() {
      return bookCover;
   }

   public void setBookCover(String bookCover) {
      this.bookCover = bookCover;
   }

   public String getBookCategoryCode() {
      return bookCategoryCode;
   }

   public void setBookCategoryCode(String bookCategoryCode) {
      this.bookCategoryCode = bookCategoryCode;
   }

   public String getBookCategoryName() {
      return bookCategoryName;
   }

   public void setBookCategoryName(String bookCategoryName) {
      this.bookCategoryName = bookCategoryName;
   }

   public int getBookInventory() {
      return bookInventory;
   }

   public void setBookInventory(int bookInventory) {
      this.bookInventory = bookInventory;
   }

   public String getBookUsed() {
      return bookUsed;
   }

   public void setBookUsed(String bookUsed) {
      this.bookUsed = bookUsed;
   }


@Override
   public String toString() {
      return "BookDTO [bookCode=" + bookCode + ", bookTitle=" + bookTitle + ", bookAuthor=" + bookAuthor
            + ", bookPublisher=" + bookPublisher + ", bookDate=" + bookDate + ", bookPage=" + bookPage
            + ", bookPrice=" + bookPrice + ", bookCover=" + bookCover + ", bookCategoryCode=" + bookCategoryCode
            + ", bookCategoryName=" + bookCategoryName + ", bookInventory=" + bookInventory + ", bookUsed="
            + bookUsed + "]";
   }
}
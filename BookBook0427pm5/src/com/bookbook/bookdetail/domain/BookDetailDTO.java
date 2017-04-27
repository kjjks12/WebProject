package com.bookbook.bookdetail.domain;

import com.bookbook.book.domain.BookDTO;

public class BookDetailDTO {
	/**도서 기본정보*/
	private BookDTO bookDTO;
	/**도서 기본소개*/
	private String bookDetailDescription;
	/**도서 저자소개*/
	private String bookDetailAuthor;
	/**도서 목차*/
	private String bookDetailIndex;

	public BookDetailDTO() {
		super();
	}

	public BookDetailDTO(BookDTO bookDTO, String bookDetailDescription, String bookDetailAuthor,
			String bookDetailIndex) {
		super();
		this.bookDTO = bookDTO;
		this.bookDetailDescription = bookDetailDescription;
		this.bookDetailAuthor = bookDetailAuthor;
		this.bookDetailIndex = bookDetailIndex;
	}

	public BookDTO getBookDTO() {
		return bookDTO;
	}

	public void setBookDTO(BookDTO bookDTO) {
		this.bookDTO = bookDTO;
	}

	public String getBookDetailDescription() {
		return bookDetailDescription;
	}

	public void setBookDetailDescription(String bookDetailDescription) {
		this.bookDetailDescription = bookDetailDescription;
	}

	public String getBookDetailAuthor() {
		return bookDetailAuthor;
	}

	public void setBookDetailAuthor(String bookDetailAuthor) {
		this.bookDetailAuthor = bookDetailAuthor;
	}

	public String getBookDetailIndex() {
		return bookDetailIndex;
	}

	public void setBookDetailIndex(String bookDetailIndex) {
		this.bookDetailIndex = bookDetailIndex;
	}

	@Override
	public String toString() {
		return "BookDetailDTO [bookDTO=" + bookDTO + ", bookDetailDescription=" + bookDetailDescription
				+ ", bookDetailAuthor=" + bookDetailAuthor + ", bookDetailIndex=" + bookDetailIndex + "]";
	}
}

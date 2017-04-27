package com.bookbook.bookdetail.domain;

import com.bookbook.book.domain.BookDTO;

public class BookDetailDTO {
	/**���� �⺻����*/
	private BookDTO bookDTO;
	/**���� �⺻�Ұ�*/
	private String bookDetailDescription;
	/**���� ���ڼҰ�*/
	private String bookDetailAuthor;
	/**���� ����*/
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

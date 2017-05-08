package com.bookbook.user.domain;

public class UserDTO {
	/**사용자 코드*/
	private String userCode;
	/**사용자 이름*/
	private String userName;
	/**사용자 비밀번호*/
	private String userPassword;
	/**사용자 연락처*/
	private String userTel;
	/**사용자 주소*/
	private String userAddr;
	/**사용자 성별*/
	private String userGender;
	/**사용자 생일*/
	private String userBirth;
	/**사용자 이메일*/
	private String userEmail;
	/**사용자 비밀번호 힌트*/
	private String userPasswordHint;
	/**사용자 비밀번호 질문*/
	private String userPasswordQuestion;
	/**사용자 비밀번호 답변*/
	private String userPasswordAnswer;
	
	
	
	public UserDTO() {}


	/**
	 * @author 정광수
	 * @brief 관리자 페이지에서 관리자는 암호에 관한 정보는 알 필요가 없음
	 */
	public UserDTO(String userCode, String userName, String userTel, String userAddr, String userGender,
			String userBirth, String userEmail) {
		super();
		this.userCode = userCode;
		this.userName = userName;
		this.userTel = userTel;
		this.userAddr = userAddr;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
	}





	public UserDTO(String userCode, String userPassword, String userTel,  String userAddr, String userGender,  String userBirth,
			String userEmail, String userName,  String userPasswordHint, String userPasswordQuestion, String userPasswordAnswer) {
		super();
		this.userCode = userCode;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userTel = userTel;
		this.userAddr = userAddr;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userPasswordHint = userPasswordHint;
		this.userPasswordQuestion = userPasswordQuestion;
		this.userPasswordAnswer = userPasswordAnswer;
	}



	public String getUserCode() {
		return userCode;
	}



	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserPassword() {
		return userPassword;
	}



	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}



	public String getUserTel() {
		return userTel;
	}



	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}



	public String getUserAddr() {
		return userAddr;
	}



	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}



	public String getUserGender() {
		return userGender;
	}



	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}



	public String getUserBirth() {
		return userBirth;
	}



	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public String getUserPasswordHint() {
		return userPasswordHint;
	}



	public void setUserPasswordHint(String userPasswordHint) {
		this.userPasswordHint = userPasswordHint;
	}



	public String getUserPasswordQuestion() {
		return userPasswordQuestion;
	}



	public void setUserPasswordQuestion(String userPasswordQuestion) {
		this.userPasswordQuestion = userPasswordQuestion;
	}



	public String getUserPasswordAnswer() {
		return userPasswordAnswer;
	}



	public void setUserPasswordAnswer(String userPasswordAnswer) {
		this.userPasswordAnswer = userPasswordAnswer;
	}



	@Override
	public String toString() {
		return "UserDTO [userCode=" + userCode + ", userName=" + userName + ", userPassword=" + userPassword
				+ ", userTel=" + userTel + ", userAddr=" + userAddr + ", userGender=" + userGender + ", userBirth="
				+ userBirth + ", userEmail=" + userEmail + ", userPasswordHint=" + userPasswordHint
				+ ", userPasswordQuestion=" + userPasswordQuestion + ", userPasswordAnswer=" + userPasswordAnswer + "]";
	}
}

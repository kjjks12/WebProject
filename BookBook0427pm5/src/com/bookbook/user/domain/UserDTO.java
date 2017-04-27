package com.bookbook.user.domain;

public class UserDTO {
	/**����� �ڵ�*/
	private String userCode;
	/**����� �̸�*/
	private String userName;
	/**����� ��й�ȣ*/
	private String userPassword;
	/**����� ����ó*/
	private String userTel;
	/**����� �ּ�*/
	private String userAddr;
	/**����� ����*/
	private String userGender;
	/**����� ����*/
	private String userBirth;
	/**����� �̸���*/
	private String userEmail;
	/**����� ��й�ȣ ��Ʈ*/
	private String userPasswordHint;
	/**����� ��й�ȣ ����*/
	private String userPasswordQuestion;
	/**����� ��й�ȣ �亯*/
	private String userPasswordAnswer;
	
	
	
	public UserDTO() {}


	/**
	 * @author ������
	 * @brief ������ ���������� �����ڴ� ��ȣ�� ���� ������ �� �ʿ䰡 ����
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

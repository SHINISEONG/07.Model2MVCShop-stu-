package com.model2.mvc.service.domain;

import java.sql.Date;


//==>ȸ�������� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean
public class User {
	
	///Field
	private String userId;
	private String userName;
	private String password;
	private String role;
	private String ssn;
	private String phone;
	private String addr;
	private String email;
	private Date regDate;
	/////////////// EL ���� ���� �߰��� Field ///////////
	private String phone1;
	private String phone2;
	private String phone3;
	////////////// ����ǰ�� ���� �� ��ٱ��� ������ ����  Field ////////////
	private int cartTranNo;

	
	
	///Constructor
	public User(){
	}
	
	///Method 
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
		/////////////// EL ���� ���� �߰� ///////////
		if(phone != null && phone.length() !=0 ){
			phone1 = phone.split("-")[0];
			phone2 = phone.split("-")[1];
			phone3 = phone.split("-")[2];
		}
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	/////////////// EL ���� ���� �߰��� getter Method ///////////
	public String getPhone1() {
		return phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public String getPhone3() {
		return phone3;
	}

	public int getCartTranNo() {
		return cartTranNo;
	}

	public void setCartTranNo(int cartTranNo) {
		this.cartTranNo = cartTranNo;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", role=" + role
				+ ", ssn=" + ssn + ", phone=" + phone + ", addr=" + addr + ", email=" + email + ", regDate=" + regDate
				+ ", cartTranNo=" + cartTranNo + "]";
	}

	
}
package com.Modal;

public class User {
	private int userId;
	private String fname;
	private String lname;
	private String email;
	private String mobileNum;
	private int age;

	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(int userId,String fname, String lname, String email, String mobileNum, int age) {
		super();
		this.userId = userId;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobileNum = mobileNum;
		this.age = age;
	}
	

	public User(String fname, String lname, String email, String mobileNum, int age) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobileNum = mobileNum;
		this.age = age;
	}

	public int getUserId()
	{
		return userId;
	}
   public void setUserId(int userId)
   {
	   this.userId = userId;
   }
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNum() {
		return mobileNum;
	}

	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", mobileNum="
				+ mobileNum + ", age=" + age + "]";
	} 

}

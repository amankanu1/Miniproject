package com.tech.blog.entities;

import java.sql.*;

public class User {

    private int id;
    private String name;
    private String email;
    private String mobilrNumber;
    private String password;
    private String securityQuestion;
    private String answer;
    private Timestamp rdate;
    private String profileinfo;
    private int userId;
   

   

	public User(int id, String name, String email,String mobilrNumber, String password, String securityQuestion, String answer,Timestamp rdate,int userId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.mobilrNumber = mobilrNumber;
        this. password= password;
        this.securityQuestion = securityQuestion;
        this.answer = answer;
        this.rdate = rdate;
        this.userId = userId;
    }

    public User() {
    }

    public User(String name, String email, String mobilrNumber, String password,  String securityQuestion, String answer) {
        this.name = name;
        this.email = email;
        this.mobilrNumber= mobilrNumber;
        this.password = password;
        this.securityQuestion = securityQuestion;       
        this.answer = answer;
        this.userId = userId;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobilrNumber() {
		return mobilrNumber;
	}

	public void setMobilrNumber(String mobilrNumber) {
		this.mobilrNumber = mobilrNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Timestamp getRdate() {
		return rdate;
	}

	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	 public String getProfileinfo() {
			return profileinfo;
	}

	public void setProfileinfo(String profileinfo) {
			this.profileinfo = profileinfo;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
    
//    getters and setters
    
}
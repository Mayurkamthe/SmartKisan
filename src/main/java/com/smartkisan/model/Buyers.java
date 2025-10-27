package com.smartkisan.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Component
@Entity
public class Buyers {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int compid;
	private String companyName;
	private String email;
	private String password;

	public int getCompid() {
		return compid;
	}

	public void setCompid(int compid) {
		this.compid = compid;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Buyers() {
		// TODO Auto-generated constructor stub
	}
}
package com.tech.blog.entities;
import java.sql.*;

public class User {
	private int id;
	private String Name;
	private String Email;
	private String Password;
	private String Gendar;
	private String About;
	private String Adress;
	int Sno;
	public User(String name, String email, String password, String gendar,
			String about, String adress) {
		super();
		Name = name;
		Email = email;
		Password = password;
		Gendar = gendar;
		About = about;
		Adress = adress;
	}
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int id, String name, String email, String password,
			String gendar, String about, String adress) {
		super();
		this.id = id;
		Name = name;
		Email = email;
		Password = password;
		Gendar = gendar;
		About = about;
		Adress = adress;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getGendar() {
		return Gendar;
	}

	public void setGendar(String gendar) {
		Gendar = gendar;
	}

	public String getAbout() {
		return About;
	}

	public void setAbout(String about) {
		About = about;
	}

	public String getAdress() {
		return Adress;
	}

	public void setAdress(String adress) {
		Adress = adress;
	}
	
	

}

package com.tech.blog.entities;

public class Massage {
	
	private String content;
	private String type;
	private String CssClass;
	public Massage(String content, String type, String cssClass) {
		super();
		this.content = content;
		this.type = type;
		CssClass = cssClass;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCssClass() {
		return CssClass;
	}
	public void setCssClass(String cssClass) {
		CssClass = cssClass;
	}
	
	

}

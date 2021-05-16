package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	private int pid;
	private String ptitle;
	private String pcode;
	private Timestamp pdate;
	private int cid;
	private int uid;
	private String pcontent;
	
	public Post(int pid, String ptitle, String pcode, Timestamp pdate, int cid,
			int userid,String pcontent) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcode = pcode;
		this.pdate = pdate;
		this.cid = cid;
		this.uid = uid;
		this.pcontent=pcontent;
	}
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(String ptitle, String pcode, Timestamp pdate, int cid,int uid,String pcontent) {
		super();
		this.ptitle = ptitle;
		this.pcode = pcode;
		this.pdate = pdate;
		this.cid = cid;
		this.uid=uid;
		this.pcontent=pcontent;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUserid() {
		return uid;
	}
	public void setUserid(int uid) {
		this.uid = uid;
	}
	
	

}

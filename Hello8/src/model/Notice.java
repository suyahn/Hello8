package model;

import java.sql.Date;

public class Notice {
	private int nno;
	private String nsubject;
	private String ncontent;
	private Date ndate;
	private int nreadcount;
	private String ndel;

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getNsubject() {
		return nsubject;
	}

	public void setNsubject(String nsubject) {
		this.nsubject = nsubject;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	public int getNreadcount() {
		return nreadcount;
	}

	public void setNreadcount(int nreadcount) {
		this.nreadcount = nreadcount;
	}

	public String getNdel() {
		return ndel;
	}

	public void setNdel(String ndel) {
		this.ndel = ndel;
	}

}
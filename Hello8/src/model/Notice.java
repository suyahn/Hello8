package model;

import java.sql.Date;

public class Notice {
	private int mno;
	private String nsubject;
	private String ncontent;
	private Date ndate;
	private int nreadcount;
	private String ndel;

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
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
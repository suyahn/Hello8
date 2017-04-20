package model;

import java.sql.Date;

public class Diary {
	private int dno;
	private String dsubject;
	private String id;
	private String dcontent;
	private Date ddate;
	private int dreadcount;
	private int rno;
	private String ddel;
	private int lang_no;
	private String nickname;
	private String lang_name;

	public String getLang_name() {
		return lang_name;
	}

	public void setLang_name(String lang_name) {
		this.lang_name = lang_name;
	}

	

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getDsubject() {
		return dsubject;
	}

	public void setDsubject(String dsubject) {
		this.dsubject = dsubject;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public Date getDdate() {
		return ddate;
	}

	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

	public int getDreadcount() {
		return dreadcount;
	}

	public void setDreadcount(int dreadcount) {
		this.dreadcount = dreadcount;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getDdel() {
		return ddel;
	}

	public void setDdel(String ddel) {
		this.ddel = ddel;
	}

	public int getLang_no() {
		return lang_no;
	}

	public void setLang_no(int lang_no) {
		this.lang_no = lang_no;
	}

}

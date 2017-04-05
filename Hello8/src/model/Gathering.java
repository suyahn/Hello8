package model;

import java.sql.Date;

public class Gathering {
	private int gno;
	private String gsubject;
	private String id;
	private String gcontent;
	private Date gdate;
	private int greadcount;
	private String gdel;
	private int lang_no;

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getGsubject() {
		return gsubject;
	}

	public void setGsubject(String gsubject) {
		this.gsubject = gsubject;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGcontent() {
		return gcontent;
	}

	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}

	public Date getGdate() {
		return gdate;
	}

	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}

	public int getGreadcount() {
		return greadcount;
	}

	public void setGreadcount(int greadcount) {
		this.greadcount = greadcount;
	}

	public String getGdel() {
		return gdel;
	}

	public void setGdel(String gdel) {
		this.gdel = gdel;
	}

	public int getLang_no() {
		return lang_no;
	}

	public void setLang_no(int lang_no) {
		this.lang_no = lang_no;
	}
}

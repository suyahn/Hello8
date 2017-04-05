package model;
import java.sql.Date;

public class Diary {
	private int dno;
	private String dsubject;
	private String id;
	private String dcontent;
	private Date ddate;

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

	public Date getDate() {
		return ddate;
	}

	public void setDate(Date ddate) {
		this.ddate = ddate;
	}

	public int getDreadcount() {
		return dreadcount;
	}

	public void setDreadcount(int dreadcount) {
		this.dreadcount = dreadcount;
	}

	public int getDrange() {
		return drange;
	}

	public void setDrange(int drange) {
		this.drange = drange;
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

	private int dreadcount;
	private int drange;
	private String ddel;
	private int lang_no;
}

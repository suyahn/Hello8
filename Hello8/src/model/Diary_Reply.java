package model;

import java.sql.Date;

public class Diary_Reply {
	private int drno;
	private int dno;
	private String id;
	private String drcontent;
	private Date drdate;
	private int ref;
	private int re_step;
	private int re_level;
	private String nickname;
	private String drdel;

	public String getDrdel() {
		return drdel;
	}

	public void setDrdel(String drdel) {
		this.drdel = drdel;
	}

	public int getDrno() {
		return drno;
	}

	public void setDrno(int drno) {
		this.drno = drno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDrcontent() {
		return drcontent;
	}

	public void setDrcontent(String drcontent) {
		this.drcontent = drcontent;
	}

	public Date getDrdate() {
		return drdate;
	}

	public void setDrdate(Date drdate) {
		this.drdate = drdate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}

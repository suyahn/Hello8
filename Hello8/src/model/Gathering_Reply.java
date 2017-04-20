package model;

import java.sql.Date;

public class Gathering_Reply {
	private int grno;
	private int gno;
	private String id;
	private String grcontent;
	private Date grdate;
	private int ref;
	private int re_step;
	private int re_level;
	private String nickname;
	private String grdel;

	public int getGrno() {
		return grno;
	}

	public void setGrno(int grno) {
		this.grno = grno;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGrcontent() {
		return grcontent;
	}

	public void setGrcontent(String grcontent) {
		this.grcontent = grcontent;
	}

	public Date getGrdate() {
		return grdate;
	}

	public void setGrdate(Date grdate) {
		this.grdate = grdate;
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

	public String getGrdel() {
		return grdel;
	}

	public void setGrdel(String grdel) {
		this.grdel = grdel;
	}
}

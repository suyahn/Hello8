package model;

public class Faq {
	private int fno;
	private String fquestion;
	private String fanswer;
	private String fdel;
	
	public String getFdel() {
		return fdel;
	}
	public void setFdel(String fdel) {
		this.fdel = fdel;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFquestion() {
		return fquestion;
	}
	public void setFquestion(String fquestion) {
		this.fquestion = fquestion;
	}
	public String getFanswer() {
		return fanswer;
	}
	public void setFanswer(String fanswer) {
		this.fanswer = fanswer;
	}
}

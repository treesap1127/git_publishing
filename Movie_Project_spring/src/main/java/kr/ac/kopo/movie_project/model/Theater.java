package kr.ac.kopo.movie_project.model;

public class Theater {
	private String cinemaCode;
	private String theaterName;
	private int row;
	private int line;
	private String sit;
	private String sit_reser;
	
	public String getCinemaCode() {
		return cinemaCode;
	}
	public void setCinemaCode(String cinemaCode) {
		this.cinemaCode = cinemaCode;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getLine() {
		return line;
	}
	public void setLine(int line) {
		this.line = line;
	}
	public String getSit() {
		return sit;
	}
	public void setSit(String sit) {
		this.sit = sit;
	}
	public String getSit_reser() {
		return sit_reser;
	}
	public void setSit_reser(String sit_reser) {
		this.sit_reser = sit_reser;
	}

	
}

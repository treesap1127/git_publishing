package kr.ac.kopo.movie_project.model;

import java.util.ArrayList;

public class Theater {
	private String cinemaCode;
	private String theaterName;
	private int row;
	private int line;
	private ArrayList<String> sit;
	private String sit_str;
	
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
	public ArrayList<String> getSit() {
		return sit;
	}
	public void setSit(ArrayList<String> sit) {
		this.sit = sit;
	}
	public String getSit_str() {
		return sit_str;
	}
	public void setSit_str(String sit_str) {
		this.sit_str = sit_str;
	}

	
}

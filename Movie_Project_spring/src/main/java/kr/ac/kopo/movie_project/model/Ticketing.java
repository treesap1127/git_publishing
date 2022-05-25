package kr.ac.kopo.movie_project.model;

public class Ticketing {
	private String ticketCode;
	private String id;
	private String cinemaCode;
	private String theaterName;
	private String sitCode;
	private int movieCode;
	private int teenager;
	private int adult;
	private String payTool;
	private String payTime;
	public String getTicketCode() {
		return ticketCode;
	}
	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getSitCode() {
		return sitCode;
	}
	public void setSitCode(String sitCode) {
		this.sitCode = sitCode;
	}
	public int getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}
	public int getTeenager() {
		return teenager;
	}
	public void setTeenager(int teenager) {
		this.teenager = teenager;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public String getPayTool() {
		return payTool;
	}
	public void setPayTool(String payTool) {
		this.payTool = payTool;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	
}

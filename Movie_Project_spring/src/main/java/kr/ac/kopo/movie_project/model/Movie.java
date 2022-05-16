package kr.ac.kopo.movie_project.model;

import java.util.Date;

public class Movie {
	private String movieName;
	private String cinemaCode;
	private String theaterName;
	private Date movieDate;
	private Date movieTime;
	
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
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
	public Date getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}
	public Date getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(Date movieTime) {
		this.movieTime = movieTime;
	}
	

}

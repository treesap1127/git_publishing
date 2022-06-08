package kr.ac.kopo.movie_project.model;

public class TicketItem {
	private String ticketCode;
	private String id;
	private String sitCode;
	private int teenager;
	private int adult;
	private String payTool;
	private String payTime;
	private int cancel;
	
	private int movieCode;
	private String cinemaCode;
	private String theaterName;
	private String movieName;
	private String movieDate;
	private String movieTime;
	private String image;
	private String movieRating;
	private MovieImage movieImage;
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
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}
	public String getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}
	public MovieImage getMovieImage() {
		return movieImage;
	}
	public void setMovieImage(MovieImage movieImage) {
		this.movieImage = movieImage;
	}

}

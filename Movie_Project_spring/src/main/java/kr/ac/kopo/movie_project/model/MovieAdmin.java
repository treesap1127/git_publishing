package kr.ac.kopo.movie_project.model;

public class MovieAdmin {
	private String cinemaCode;
	private String id;
	private String bigCity;
	private String littleCity;
	private String tel;
	private String movieAreaName;
	public String getCinemaCode() {
		return cinemaCode;
	}
	public void setCinemaCode(String cinemaCode) {
		this.cinemaCode = cinemaCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBigCity() {
		return bigCity;
	}
	public void setBigCity(String bigCity) {
		this.bigCity = bigCity;
	}
	public String getLittleCity() {
		return littleCity;
	}
	public void setLittleCity(String littleCity) {
		this.littleCity = littleCity;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMovieAreaName() {
		return movieAreaName;
	}
	public void setMovieAreaName(String movieAreaName) {
		this.movieAreaName = movieAreaName;
	}

}
package kr.ac.kopo.movie_project.model;

public class Kofic {
	private String rnum;//순번
	private String rank;//영화 순위
	private String rankInten;//전일대비 순위의 증감분을 출력합니다.
	private String rankOldAndNew;//랭킹에 신규진입여부를 출력합니다.
	private String movieCd;//영화 코드
	private String movieNm;//영화 명
	private String openDt;//영화의 개봉일을 출력합니다.
	private String salesAmt	;//영화의 개봉일을 출력합니다.
	private String salesShare;//해당일자 상영작의 매출총액 대비 해당 영화의 매출비율을 출력합니다.
	private String salesInten;//전일 대비 매출액 증감분을 출력합니다.
	private String salesChange;//전일 대비 매출액 증감 비율을 출력합니다.
	private String salesAcc;//누적매출액을 출력합니다.
	private String audiCnt;//해당일의 관객수를 출력합니다.
	private String audiInten;//전일 대비 관객수 증감분을 출력합니다.
	private String audiChange;//전일 대비 관객수 증감 비율을 출력합니다.
	private String audiAcc;//누적관객수를 출력합니다.
	private String scrnCnt;//해당일자에 상영한 스크린수를 출력합니다.
	private String showCnt;//해당일자에 상영된 횟수를 출력합니다.
	private String movieRating;//심의등급
	// 위 까지 일일 박스 오피스 아래부터 주석 달면서 주간 박스오피스등을 사용해주세요
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getRankInten() {
		return rankInten;
	}
	public void setRankInten(String rankInten) {
		this.rankInten = rankInten;
	}
	public String getRankOldAndNew() {
		return rankOldAndNew;
	}
	public void setRankOldAndNew(String rankOldAndNew) {
		this.rankOldAndNew = rankOldAndNew;
	}
	public String getOpenDt() {
		return openDt;
	}
	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
	public String getSalesAmt() {
		return salesAmt;
	}
	public void setSalesAmt(String salesAmt) {
		this.salesAmt = salesAmt;
	}
	public String getSalesShare() {
		return salesShare;
	}
	public void setSalesShare(String salesShare) {
		this.salesShare = salesShare;
	}
	public String getSalesInten() {
		return salesInten;
	}
	public void setSalesInten(String salesInten) {
		this.salesInten = salesInten;
	}
	public String getSalesChange() {
		return salesChange;
	}
	public void setSalesChange(String salesChange) {
		this.salesChange = salesChange;
	}
	public String getSalesAcc() {
		return salesAcc;
	}
	public void setSalesAcc(String salesAcc) {
		this.salesAcc = salesAcc;
	}
	public String getAudiCnt() {
		return audiCnt;
	}
	public void setAudiCnt(String audiCnt) {
		this.audiCnt = audiCnt;
	}
	public String getAudiInten() {
		return audiInten;
	}
	public void setAudiInten(String audiInten) {
		this.audiInten = audiInten;
	}
	public String getAudiChange() {
		return audiChange;
	}
	public void setAudiChange(String audiChange) {
		this.audiChange = audiChange;
	}
	public String getAudiAcc() {
		return audiAcc;
	}
	public void setAudiAcc(String audiAcc) {
		this.audiAcc = audiAcc;
	}
	public String getScrnCnt() {
		return scrnCnt;
	}
	public void setScrnCnt(String scrnCnt) {
		this.scrnCnt = scrnCnt;
	}
	public String getShowCnt() {
		return showCnt;
	}
	public void setShowCnt(String showCnt) {
		this.showCnt = showCnt;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}
	

	
	
}

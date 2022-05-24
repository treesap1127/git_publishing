package kr.ac.kopo.movie_project.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.TicketDao;
import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;

@Service
public class TicketServiceImpl implements TicketService {
	@Autowired 
	TicketDao dao;
	@Override
	public List<Movie> movielist() {
		return dao.movielist();
	}
	@Override
	public List<MovieAdmin> movieplace(MovieAdmin bicCity) {
		return dao.movieplace(bicCity);
	}
	@Override
	public List<Movie> cinema(MovieAdmin item) {
		return dao.cinema(item);
	}
	@Override
	public List<Movie> cinemaCode(Movie item) {
		return dao.cinemaCode(item);
	}
	@Override
	public List<Movie> cinematime(Movie item) throws ParseException {
		String strDate=item.getMovieDate();
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		// String 타입을 Date 타입으로 변환 
		Date formatDate = dtFormat.parse(strDate); 
		// Date타입의 변수를 새롭게 지정한 포맷으로 변환 
		String strNewDtFormat = newDtFormat.format(formatDate); 
		System.out.println("포맷 후 : " + strNewDtFormat);
		item.setMovieDate(strNewDtFormat);
		
		return dao.cinematime(item);
	}
	@Override
	public List<Movie> cinemaDate(Movie item) {
		return dao.cinemaDate(item);
	}
	@Override
	public List<Theater> ticketsit(Movie list) {
		return dao.ticketsit(list);
	}
	@Override
	public List<Movie> view() {
		return dao.movielist();
	}
	@Override
	public Movie moviecode(Movie item) {
		return dao.moviecode(item);
	}
}

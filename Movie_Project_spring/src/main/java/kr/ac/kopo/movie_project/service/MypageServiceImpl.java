package kr.ac.kopo.movie_project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.movie_project.dao.ImageDao;
import kr.ac.kopo.movie_project.dao.MypageDao;
import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.MovieImage;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.model.TicketItem;
import kr.ac.kopo.movie_project.model.Ticketing;
@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDao dao;
	@Autowired
	ImageDao imagedao;
	@Override
	public List<MovieAdmin> list(String id) {
		return dao.list(id);
	}
	@Override
	public void sit_add(Theater item) {
		dao.sit_add(item);
	}
	@Override
	public List<Theater> theaterlist(String cinemaCode) {
		return dao.theaterlist(cinemaCode);
	}
	@Override
	public List<Theater> theaterlist(String cinemaCode, String theaterName) {
		return dao.theaterlist(cinemaCode,theaterName);
	}
	@Override
	public void sitUpdate(Theater item) {
		dao.sitUpdate(item);
		
	}
	@Transactional
	@Override
	public void theater_delete(String cinemaCode, String theaterName) {
		dao.movie_delete(cinemaCode,theaterName);
		dao.theater_delete(cinemaCode,theaterName);
	}
	@Transactional
	@Override
	public void delete(String cinemaCode) {
		dao.movie_all_delete(cinemaCode);
		dao.deleteTheater(cinemaCode);
		dao.deleteCinema(cinemaCode);
	}
	@Override
	public List<Movie> movielist(HashMap<String, Object> map) {
		return dao.movielist(map);
	}
	@Override
	public void movieadd(Movie item) {
		String rating=item.getMovieRating();
		String rating_num;
		rating_num=rating.substring(0,2);
		System.out.println(rating_num);
		item.setMovieRating(rating_num);
		dao.movieadd(item);
		
	}
	@Override
	public void moviedelete(Movie item) {
		dao.moviedelete(item);
		
	}
	@Override
	public List<TicketItem> myticket(String id) {
		return dao.myticket(id);
	}
	@Override
	public String cancel(Ticketing item) {
		String test=dao.cancel(item);
		return test;
	}
	@Override
	public List<TicketItem> myDateTicket(String id) {
		return dao.myDateTicket(id);
	}
	@Override
	public MovieAdmin cinemaItem(String cinemaCode) {
		return dao.cinemaItem(cinemaCode);
	}
	@Override
	public void cinemaUpdate(MovieAdmin item) {
		dao.cinemaUpdate(item);
	}
	@Override
	@Transactional
	public void Minoradd(Movie item) {
		dao.movieadd(item);
		MovieImage movieimage = new MovieImage();
		movieimage=item.getMovieImage();
		movieimage.setCinemaCode(item.getCinemaCode());
		movieimage.setMovieCode(item.getMovieCode());
		movieimage.setTheaterName(item.getTheaterName());
		imagedao.imageadd(movieimage);
	}
}

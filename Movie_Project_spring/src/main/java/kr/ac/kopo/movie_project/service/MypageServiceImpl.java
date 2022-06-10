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
		imagedao.th_delete(theaterName);
		dao.th_sitdelete(theaterName);
		dao.th_ticketdelete(theaterName);
		
		dao.movie_delete(cinemaCode,theaterName);//movie하나
		dao.theater_delete(cinemaCode,theaterName);//theater하나
		
	}
	@Transactional
	@Override
	public void delete(String cinemaCode,String id) {
		imagedao.ci_delete(cinemaCode);//image
		dao.ci_sitdelete(cinemaCode);//sit
		dao.ci_ticketdelete(cinemaCode);//ticket
		
		dao.movie_all_delete(cinemaCode);// movie
		dao.deleteTheater(cinemaCode);// theater
		dao.deleteCinema(cinemaCode);// movie_admin
		int check =dao.admincheck(id);
		if(check==0) {
			dao.adminUpdate(id);
		}
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
	@Transactional
	public void moviedelete(Movie item) {
		dao.sitdelete(item);
		dao.ticketdelete(item);
		imagedao.delete(item);
		dao.moviedelete(item);//영화삭제
	}
	@Override
	public List<TicketItem> myticket(String id) {
		return dao.myticket(id);
	}
	@Override
	@Transactional
	public String cancel(Ticketing item) {
		String test=dao.cancel(item);
		Ticketing list = dao.ticketitem(item);
		dao.sitdelete(list);
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
		movieimage.getUUID();
		movieimage.setCinemaCode(item.getCinemaCode());
		int code=dao.moviecode(item);
		movieimage.setMovieCode(code);
		movieimage.setTheaterName(item.getTheaterName());
		imagedao.imageadd(movieimage);
	}
}

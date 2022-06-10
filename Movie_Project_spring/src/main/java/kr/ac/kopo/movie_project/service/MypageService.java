package kr.ac.kopo.movie_project.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.model.TicketItem;
import kr.ac.kopo.movie_project.model.Ticketing;

public interface MypageService {

	List<MovieAdmin> list(String id);

	void sit_add(Theater item);

	List<Theater> theaterlist(String cinemaCode);

	List<Theater> theaterlist(String cinemaCode, String theaterName);

	void sitUpdate(Theater item);

	void theater_delete(String cinemaCode, String theaterName);

	void delete(String cinemaCode, String id);

	List<Movie> movielist(HashMap<String, Object> map);

	void movieadd(Movie item);

	void moviedelete(Movie item);

	List<TicketItem> myticket(String id);

	String cancel(Ticketing item);

	List<TicketItem> myDateTicket(String id);

	MovieAdmin cinemaItem(String cinemaCode);

	void cinemaUpdate(MovieAdmin item);

	void Minoradd(Movie item);

}

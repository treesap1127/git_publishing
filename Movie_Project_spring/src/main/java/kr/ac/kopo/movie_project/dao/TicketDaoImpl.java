package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;

@Repository
public class TicketDaoImpl implements TicketDao {
	@Autowired
	SqlSession sql;
	@Override
	public List<Movie> movielist() {
		return sql.selectList("ticket.movielist");
	}
	@Override
	public List<MovieAdmin> movieplace(MovieAdmin bicCity) {
		return sql.selectList("ticket.movieplace", bicCity);
	}
	@Override
	public List<Movie> cinema(MovieAdmin item) {
		return sql.selectList("ticket.cinema", item);
	}
	@Override
	public List<Movie> cinemaCode(Movie item) {
		return  sql.selectList("ticket.cinemaCode", item);
	}
	@Override
	public List<Movie> cinematime(Movie item) {
		return sql.selectList("ticket.cinematime", item);
	}

}

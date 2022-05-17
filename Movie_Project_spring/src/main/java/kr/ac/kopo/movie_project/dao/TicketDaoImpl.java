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
	public Object movieplace(MovieAdmin bicCity) {
		return sql.selectList("ticket.movieplace", bicCity);
	}

}

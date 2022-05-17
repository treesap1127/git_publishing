package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.TicketDao;
import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;

@Service
public class TicketServiceImpl implements TicketService {
	@Autowired 
	TicketDao dao;
	@Override
	public List<Movie> movielist() {
		
		return dao.movielist();

	}
	@Override
	public Object movieplace(MovieAdmin bicCity) {
		return dao.movieplace(bicCity);
	}
}

package kr.ac.kopo.movie_project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
@Repository
public class MypageDaoImpl implements MypageDao {
	@Autowired
	SqlSession sql;
	@Override
	public List<MovieAdmin> list(String id) {
		return sql.selectList("theater.list", id);
	}
	@Override
	public void sit_add(Theater item) {
		sql.insert("theater.sit_add", item);
	}
	@Override
	public List<Theater> theaterlist(String cinemaCode) {
		return sql.selectList("theater.theaterlist", cinemaCode);
	}
	@Override
	public List<Theater> theaterlist(String cinemaCode, String theaterName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cinemaCode", cinemaCode);
		map.put("theaterName", theaterName);
		return sql.selectList("theater.theaterlistmap",map);
	}
	@Override
	public void sitUpdate(Theater item) {
		sql.update("theater.sit_update", item);
	}
	@Override
	public void theater_delete(String cinemaCode,String theaterName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cinemaCode", cinemaCode);
		map.put("theaterName", theaterName);
		sql.delete("theater.theaterdelete", map);
	}
	@Override
	public void deleteTheater(String cinemaCode) {
		sql.delete("theater.deleteTheater",cinemaCode);
	}
	@Override
	public void deleteCinema(String cinemaCode) {
		sql.delete("theater.deleteCinema",cinemaCode);
	}
	@Override
	public List<Movie> movielist(HashMap<String, Object> map) {
		return sql.selectList("theater.movieList", map);
	}
	@Override
	public void movieadd(Movie item) {
		sql.insert("theater.movieadd", item);
		
	}

}

package kr.ac.kopo.movie_project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.model.TheaterList;
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
	public List<TheaterList> theaterlist(String cinemaCode, String theaterName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cinemaCode", cinemaCode);
		map.put("theaterName", theaterName);
		return sql.selectList("theater.theaterlistmap",map);
	}

}

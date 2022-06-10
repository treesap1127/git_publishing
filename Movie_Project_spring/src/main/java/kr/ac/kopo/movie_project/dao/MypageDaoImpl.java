package kr.ac.kopo.movie_project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.model.TicketItem;
import kr.ac.kopo.movie_project.model.Ticketing;
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
	@Override
	public void moviedelete(Movie item) {
		sql.delete("theater.moviedelete", item);
		
	}
	@Override
	public void movie_delete(String cinemaCode, String theaterName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cinemaCode", cinemaCode);
		map.put("theaterName", theaterName);
		sql.delete("theater.movie_delete", map);
	}
	@Override
	public void movie_all_delete(String cinemaCode) {
		sql.delete("theater.movie_all_delete", cinemaCode);
	}
	@Override
	public List<TicketItem> myticket(String id) {
		List<TicketItem> item =sql.selectList("theater.myticket", id);
		return item;
	}
	@Override
	public String cancel(Ticketing item) {
		try {
			sql.update("theater.cancel", item);
		} catch (Exception e) {
			return "false";
		}
		return "true";
	}
	@Override
	public List<TicketItem> myDateTicket(String id) {
		return sql.selectList("theater.myDateTicket", id);
	}
	@Override
	public MovieAdmin cinemaItem(String cinemaCode) {
		return sql.selectOne("theater.cinemaItem",cinemaCode);
	}
	@Override
	public void cinemaUpdate(MovieAdmin item) {
		sql.update("theater.cinemaUpdate", item);
	}
	@Override
	public int moviecode(Movie item) {
		return sql.selectOne("theater.moviecode", item);
	}
	@Override
	public void sitdelete(Movie item) {
		sql.delete("theater.sitdelete", item);
	}
	@Override
	public void ticketdelete(Movie item) {
		sql.delete("theater.ticketdelete", item);
		
	}
	
	@Override
	public void th_sitdelete(String theaterName) {
		sql.delete("theater.th_sitdelete", theaterName);
		
	}
	@Override
	public void th_ticketdelete(String theaterName) {
		sql.delete("theater.th_ticketdelete", theaterName);
		
	}
	@Override
	public int admincheck(String id) {
		return sql.selectOne("theater.admincheck", id);
	}
	@Override
	public void adminUpdate(String id) {
		sql.update("theater.adminUpdate", id);
	}
	@Override
	public void ci_sitdelete(String cinemaCode) {
		sql.delete("theater.ci_sitdelete", cinemaCode);
		
	}
	@Override
	public void ci_ticketdelete(String cinemaCode) {
		sql.delete("theater.ci_ticketdelete", cinemaCode);
		
	}
	@Override
	public Ticketing ticketitem(Ticketing item) {
		return sql.selectOne("theater.ticketitem",item);
	}
	@Override
	public void sitdelete(Ticketing list) {
		sql.delete("theater.sitofdelete", list);
	}
}

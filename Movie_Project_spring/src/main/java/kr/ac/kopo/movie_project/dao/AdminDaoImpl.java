package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.MovieAdmin;
@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	SqlSession sql;
	@Override
	public List<MovieAdmin> admin() {
		return sql.selectList("admin.list");
	}
	@Override
	public void approve(String cinemaCode) {
		sql.update("admin.approve", cinemaCode);
	}
	@Override
	public void reject(String cinemaCode) {
		sql.delete("admin.reject", cinemaCode);
		
	}
	@Override
	public List<MovieAdmin> adminTable() {
		return sql.selectList("admin.adminTable");
	}
	@Override
	public void approveId(String id) {
		sql.update("admin.approveId",id);
	}
	@Override
	public MovieAdmin cinemaItem(String cinemaCode) {
		return sql.selectOne("theater.cinemaItem",cinemaCode);
	}
	@Override
	public void cinemaUpdate(MovieAdmin item) {
		sql.update("theater.cinemaUpdate", item);
	}

}

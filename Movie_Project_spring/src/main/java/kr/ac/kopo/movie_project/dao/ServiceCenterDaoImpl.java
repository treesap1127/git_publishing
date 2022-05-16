package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Board;
@Repository
public class ServiceCenterDaoImpl implements ServiceCenterDao {
@Autowired
SqlSession sql;
	@Override
	public List<Board> list() {
	
		return sql.selectList("Board.list");
	}
	@Override
	public void add(Board item) {
		sql.insert("Board.add", item);
		
	}
	@Override
	public Board item(int articleId) {
	
		return sql.selectOne("Board.item", articleId);
	}
	@Override
	public void update(Board item) {
		sql.update("Board.update",item);
		
	}
	@Override
	public void delete(int articleId) {
		sql.delete("Board.delete",articleId);
		
	}

}

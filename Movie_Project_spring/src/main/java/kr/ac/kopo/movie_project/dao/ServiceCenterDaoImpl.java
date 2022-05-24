package kr.ac.kopo.movie_project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.util.Pager;

@Repository
public class ServiceCenterDaoImpl implements ServiceCenterDao {
	@Autowired
	SqlSession sql;

	@Override
	public void add(Board item) {
		sql.insert("Board.add", item);

	}

	@Override
	public void update(Board item) {
		sql.update("Board.update", item);

	}

	@Override
	public List<Board> list(Pager pager,Long boardId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("boardId",boardId);
		map.put("pager",pager);
		return sql.selectList("Board.list",map);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("Board.total", pager);
	}

	@Override
	public Board item(int boardId, int articleId) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("boardId", boardId);
		map.put("articleId", articleId);
		return sql.selectOne("Board.item", map);
	}

	@Override
	public void delete(Long boardId, Long articleId) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("boardId", boardId);
		map.put("articleId", articleId);

		sql.delete("Board.delete", map);

	}

}
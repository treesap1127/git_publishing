package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.BoardMaster;
@Repository
public class BoardDaoImpl implements BoardDao {
@Autowired
SqlSession sql;
	@Override
	public List<BoardMaster> list() {
		
		return sql.selectList("Board.list");
	}

	@Override
	public void add(BoardMaster item) {
		sql.insert("board.add",item);

	}

	@Override
	public void createTable(int boardId) {
		sql.update("board.create_board", boardId);

	}

	@Override
	public void update(BoardMaster item) {
		sql.update("board.update", item);

	}

	@Override
	public BoardMaster item(int boardId) {
		return sql.selectOne("board.item", boardId);
	}

	@Override
	public void delete(int boardId) {
		sql.delete("board.delete", boardId);

	}

	@Override
	public void deleteTable(int boardId) {
		sql.update("board.delete_board", boardId);

	}

}

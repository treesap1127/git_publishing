package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.BoardDao;
import kr.ac.kopo.movie_project.model.BoardMaster;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao dao;

	@Override
	public List<BoardMaster> list() {

		return dao.list();
	}

	@Override
	public void add(BoardMaster item) {
		dao.add(item);
		dao.createTable(item.getBoardId());

	}

	@Override
	public void update(BoardMaster item) {
		dao.update(item);

	}

	@Override
	public BoardMaster item(int boardId) {

		return dao.item(boardId);
	}

	@Override
	public void delete(int boardId) {
		dao.delete(boardId);

		dao.deleteTable(boardId);

	}

}

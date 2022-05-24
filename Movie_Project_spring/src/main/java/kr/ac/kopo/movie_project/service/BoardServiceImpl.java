package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public BoardMaster item(int boardId) {

		return dao.item(boardId);
	}
	
	@Transactional
	@Override
	public void delete(int boardId) {
		dao.delete(boardId);

		dao.deleteTable(boardId);

	}


	@Override
	public void update(BoardMaster item) {
		dao.update(item);
		
	}
	@Override
	public void BoardTableadd(BoardMaster item) {
		dao.add(item);
		dao.createTable(item.getBoardId());
		
	}
	@Override
	public int boardid() {
		return dao.boardid();
	}


	


}

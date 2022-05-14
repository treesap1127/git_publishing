package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.ServiceCenterDao;
import kr.ac.kopo.movie_project.model.BoardMaster;

@Service
public class ServiceCenterserviceImpl implements ServiceCenterservice {

	@Autowired
	ServiceCenterDao dao;
	
	
	@Override
	public void noticeadd(BoardMaster item) {
		dao.noticeadd(item);

	}

	@Override
	public void noticeupdate(BoardMaster item) {
		dao.noticeupdate(item);

	}

	@Override
	public void delete(int boardId) {
		dao.delete(boardId);
		
	}

	@Override
	public BoardMaster item(int boardId) {
	
		return dao.item(boardId);
	}

	@Override
	public List<BoardMaster> list() {
		
		return dao.list();
	}

}

package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.BoardMaster;

public interface ServiceCenterservice {

	

	void noticeadd(BoardMaster boardmaster);

	void noticeupdate(BoardMaster boardmaster);

	void delete(int boardId);

	BoardMaster item(int boardId);

	List<BoardMaster> list();

}

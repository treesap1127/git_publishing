package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.BoardMaster;

@Repository
public class ServiceCenterDaoImpl implements ServiceCenterDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<BoardMaster> noticeView() {
	
		return sql.selectList("serviceCenter.NoticeView");
	}

	@Override
	public void noticeadd(BoardMaster boardmaster) {
		sql.insert("serviceCenter.Noticeadd",boardmaster);

	}

	@Override
	public void noticeupdate(BoardMaster boardmaster) {
		sql.update("serviceCenter.NoticeUpdate",boardmaster);

	}

	@Override
	public void delete(int boardId) {
		sql.delete("serviceCenter.delete",boardId);

	}

	@Override
	public BoardMaster item(int boardId) {
		
		return sql.selectOne("boardmaster.item",boardId);
	}

}

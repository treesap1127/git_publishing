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
	public void noticeadd(BoardMaster item) {
		sql.insert("serviceCenter.Noticeadd",item);

	}

	@Override
	public void noticeupdate(BoardMaster item) {
		sql.update("serviceCenter.NoticeUpdate",item);

	}

	@Override
	public void delete(int boardId) {
		sql.delete("serviceCenter.delete",boardId);

	}

	@Override
	public BoardMaster item(int boardId) {
		
		return sql.selectOne("boardmaster.item",boardId);
	}

	@Override
	public List<BoardMaster> list() {
	
		return sql.selectList("serviceCenter.list");
	}

}

package kr.ac.kopo.movie_project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.EventImage;

@Repository
public class EventImageDaoImpl implements EventImageDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public void add(EventImage image) {
		sql.insert("eventimage.add",image);
	}

	@Override
	public boolean delete(int eventId) {		
		if(sql.delete("eventimage.delete", eventId) > 0)
			return true;
		else
			return false;
	}

}

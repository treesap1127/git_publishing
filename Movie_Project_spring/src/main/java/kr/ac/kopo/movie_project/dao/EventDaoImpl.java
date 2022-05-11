package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Event;
@Repository
public class EventDaoImpl implements EventDao {
	@Autowired
	SqlSession sql;
	@Override
	public List<Event> continue_Event() {
		
		return sql.selectList("Event.list");
	}


	

}

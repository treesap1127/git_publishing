package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Event;
import kr.ac.kopo.movie_project.util.Pager;
@Repository
public class EventDaoImpl implements EventDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Event> continue_Event(Pager pager) {
		
		return sql.selectList("Event.list",pager);
	}
	@Override
	public List<Event> end_Event(Pager pager) {
		
		return sql.selectList("Event.list",pager);
	}
	
	@Override
	public void NoticeEventAdd(Event item) {
		sql.insert("Event.add", item);
		
	}
	@Override
	public void delete(int eventId) {
		sql.delete("Event.delete", eventId);
		
	}
	@Override
	public void NoticeEventUpdate(Event item) {
		sql.insert("Event.update", item);
		
	}
	@Override
	public Event item(int eventId) {		
		return sql.selectOne("Event.item", eventId);
	}

	@Override
	public int total(Pager pager) {
		
		return sql.selectOne("Event.total",pager);
	}
	@Override
	public void viewcnt(Event item) {
		sql.update("Event.viewcnt", item);
		
	}	

	

}

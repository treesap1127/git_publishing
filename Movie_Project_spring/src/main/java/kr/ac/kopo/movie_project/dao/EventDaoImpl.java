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
		return sql.selectList("Event.continue_Event",pager);
	}
	@Override
	public List<Event> end_Event(Pager pager) {
		return sql.selectList("Event.end_Event",pager);
	}
	
	@Override
	public String NoticeEventAdd(Event item) {
		try {
			sql.insert("Event.add", item);
		} 
		catch (Exception e) {
			return "false";
		}
		return "true";
	}
	@Override
	public void delete(int eventId) {
		sql.delete("Event.delete", eventId);
		
	}
	@Override
	public String NoticeEventUpdate(Event item) {
		try {
			sql.update("Event.update", item);
		} 
		catch (Exception e) {
			return "false";
		}
		return "true";
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
	@Override
	public int eventItem() {
		try {
			return sql.selectOne("Event.eventItem");
		} catch (NullPointerException e) {
			return 0;
		}
	}	

	

}

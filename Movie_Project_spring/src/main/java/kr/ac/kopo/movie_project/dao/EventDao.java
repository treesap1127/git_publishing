package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.Event;
import kr.ac.kopo.movie_project.util.Pager;

public interface EventDao {

	List<Event> continue_Event(Pager pager);

	List<Event> end_Event(Pager pager);

	String NoticeEventAdd(Event item);

	void delete(int eventId);

	String NoticeEventUpdate(Event item);

	Event item(int eventId);

	int total(Pager pager);

	void viewcnt(Event item);

	int eventItem();	



}

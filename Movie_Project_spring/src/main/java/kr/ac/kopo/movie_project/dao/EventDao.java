package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.Event;

public interface EventDao {

	List<Event> continue_Event();

	List<Event> end_Event();

	void NoticeEventAdd(Event item);

	void delete(int eventId);

	void NoticeEventUpdate(Event item);

	Event item(int eventId);



}

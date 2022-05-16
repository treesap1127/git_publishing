package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.Event;

public interface EventService {

	List<Event> continue_Event();

	List<Event> end_Event();

	void NoticeEventAdd(Event item);

	void delete(int eventId);

	
}

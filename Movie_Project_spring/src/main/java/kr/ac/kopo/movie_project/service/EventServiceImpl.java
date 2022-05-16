package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.EventDao;
import kr.ac.kopo.movie_project.model.Event;
@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao dao;
	
	@Override
	public List<Event> continue_Event() {
		
		return dao.continue_Event();
	}

	@Override
	public List<Event> end_Event() {
		
		return dao.end_Event();
	}

	@Override
	public void NoticeEventAdd(Event item) {
		
		dao.NoticeEventAdd(item);
		
	}

	@Override
	public void delete(int eventId) {
		dao.delete(eventId);
		
	}

	

}

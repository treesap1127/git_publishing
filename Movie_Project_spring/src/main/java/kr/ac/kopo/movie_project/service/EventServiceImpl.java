package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.EventDao;
import kr.ac.kopo.movie_project.model.Event;
import kr.ac.kopo.movie_project.util.Pager;
@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao dao;
	
	@Override
	public List<Event> continue_Event(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);
		return dao.continue_Event(pager);
	}

	@Override
	public List<Event> end_Event(Pager pager) {
		
		return dao.end_Event(pager);
	}

	@Override
	public void NoticeEventAdd(Event item) {
		
		dao.NoticeEventAdd(item);
		
	}

	@Override
	public void delete(int eventId) {
		dao.delete(eventId);
		
	}

	@Override
	public void NoticeEventUpdate(Event item) {
		dao.NoticeEventUpdate(item);
		
	}

	@Override
	public Event item(int eventId) {
		
		return dao.item(eventId);
	}

	@Override
	public void viewcnt(Event item) {
		dao.viewcnt(item);
		
	}

	
	

}

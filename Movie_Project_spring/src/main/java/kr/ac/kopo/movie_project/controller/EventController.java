package kr.ac.kopo.movie_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.movie_project.model.Event;
import kr.ac.kopo.movie_project.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	@Autowired
	EventService service;
	
	final String path = "event/";
	
	@GetMapping("/continue_Event")
	public String continue_Event(Model model){
		List<Event> list = service.continue_Event();
		model.addAttribute("list",list);
		return path+"continue_Event";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/end_Event")
	public String end_Event() {
		return path+"end_Event";
	}
	
	@GetMapping("/EventInfo")
	public String EventInfo() {
		return path+"EventInfo";
		
	}
	
	@GetMapping("/NoticeEventAdd")
	public String NoticeEventAdd() {
		return path+"NoticeEventAdd";
	}
}

package kr.ac.kopo.movie_project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.movie_project.model.Event;
import kr.ac.kopo.movie_project.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	final String path = "event/";
	
	@Autowired
	EventService service;	
	
	
	@GetMapping("/continue_Event")
	public String continue_Event(Model model){
		List<Event> list = service.continue_Event();
		
		model.addAttribute("list",list);
		
		return path+"continue_Event";
	}	
	
	
	@GetMapping("/end_Event")
	public String end_Event(Model model) {
		List<Event> list = service.end_Event();
		
		model.addAttribute("list",list);
		
		return path+"end_Event";
	}
	
	@GetMapping("/EventInfo/{eventId}")
	public String EventInfo(@PathVariable int eventId, Model model) {
		Event item = service.item(eventId);
		
		model.addAttribute("item", item);
		
		return path+"EventInfo";
		
	}
	
	@GetMapping("/NoticeEventAdd")
	public String NoticeEventAdd() {
		return path+"NoticeEventAdd";
	}
	
	@PostMapping("/NoticeEventAdd")
	public String NoticeEventAdd(Event item,HttpSession session) {
		String id=(String) session.getAttribute("id");
		item.setId(id);
		service.NoticeEventAdd(item);
		
		return "redirect:continue_Event";		
	}	
	
	@GetMapping("/NoticeEventUpdate/{eventId}")
	public String NoticeEventUpdate(@PathVariable int eventId, Model model) {
		Event item =  service.item(eventId);
		
		model.addAttribute("item", item);
		
		return path + "NoticeEventUpdate";
	}
	
	@PostMapping("/NoticeEventUpdate/{eventId}")
	public String NoticeEventUpdate(@PathVariable int eventId, Event item) {
		item.setEventId(eventId);
		
		service.NoticeEventUpdate(item);
		
		return "redirect:continue_Event";
		
	}
	
	@GetMapping("/delete/{eventId}")
	public String delete(@PathVariable int eventId) {
		service.delete(eventId);
		
		return "redirect:../continue_Event";
	}
	
}
